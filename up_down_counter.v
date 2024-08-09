// Code your design here
// short function to determine the output port width based on N

/*
* `define LOG2(x) \
   (x < 2) ? 1 : \
   (x < 4) ? 2 : \
   (x < 8) ? 3 : \
   (x < 16) ? 4 : \
   (x < 32) ? 5 : \
   (x < 64) ? 6 : \
   (x < 128) ? 7 : \
   (x < 256) ? 8 : 16
*/

module up_down_counter
#(
    parameter N = 10,
    parameter WIDTH = (N < 2) ? 1 :
                      (N < 4) ? 2 :
                      (N < 8) ? 3 :
                      (N < 16) ? 4 :
                      (N < 32) ? 5 :
                      (N < 64) ? 6 :
                      (N < 128) ? 7 :
                      (N < 256) ? 8 : 16
)
(
	// Inputs
	input i_clk, 
	input i_rst,
	input i_en,
	input i_up_down,

	// Output
	output reg [WIDTH-1:0]o_Q
);

// register 
reg [WIDTH-1:0]count;

// State encoding
localparam INITIAL = 3'd0,
	   UP = 3'd1,
	   DOWN = 3'd2,
	   WRAP = 3'd3,
	   HOLD = 3'd4;

// State Register declaration
reg [2:0] Current_state;
reg [2:0] Next_state;

// Output logic
assign o_Q = (i_en)?(count):(o_Q); 

// Synchronous state transition, along with asynchronous reset logic 
always@(posedge i_clk, posedge i_rst) begin
	if(i_rst) Current_state <= INITIAL;
	else begin
      Current_state <= Next_state;
//       o_Q <= count;
end
end
  
// Conditional State transition
always@(*) begin
	Next_state = Current_state;
	case(Current_state)
		INITIAL : begin
			Next_state = UP;
		end

		UP : begin
		       if(!i_up_down) Next_state = DOWN;
	       	       else if(!i_en) Next_state = HOLD;
          else if(count==(N-2)) Next_state = WRAP;
       	        end

		DOWN : begin
		       if(i_up_down) Next_state = UP;
	       	       else if(!i_en) Next_state = HOLD;
          else if((count==1) || (count==0)) Next_state = WRAP;
       	        end

		HOLD : begin
			if(i_en && i_up_down) Next_state = UP;
			else if(i_en && !i_up_down) Next_state = DOWN;
		end

		WRAP : begin 
			if(i_up_down) Next_state = UP;
			else Next_state = DOWN;
		end
	endcase
end

always@(posedge i_clk, posedge i_rst) begin
  if(i_rst) count <= 0;
  else begin
       case(Current_state) 
       		INITIAL : count <= 0;

		UP : count <= count + 1;

		DOWN : count <= count - 1;

		HOLD : count <= count;

		WRAP : begin
          if(!i_up_down) count <= N-1;
          else if(i_up_down) count <= 0;
		end
	endcase
  end
end

endmodule
