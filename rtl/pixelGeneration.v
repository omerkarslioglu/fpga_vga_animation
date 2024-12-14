module pixelGeneration (clk, rst, switch, pixel_x, pixel_y, push, video_on, rgb);

input 						clk, rst, switch;
input 			[9:0] pixel_x, pixel_y;
input 						video_on;
input 			[3:0] push;
output reg 	[2:0] rgb;

wire 							square_on;

reg 				[9:0] x_left_cnt, x_right_cnt; // The counters to set square localization on x-axis
reg 				[9:0] y_down_cnt, y_up_cnt; // The counters to set square localization on y-axis

reg 			 [29:0] max_cnt; // counters for speed options to use in clock division
reg 			 [29:0] mid_cnt; // counters for speed options to use in clock division

/* Debounce for push buttons */
reg 			[29:0] counter = 0; // for debounce
reg							 slow_clk; // for clock division
reg 			 [3:0] push_q1; // ff for debounce
reg 			 [3:0] push_q2; // ff for debounce
wire       [3:0] push_debounced;

always @(posedge clk) begin
	if (rst) begin
		counter <= 0;
	end else begin
		counter <= (counter >= max_cnt) ? 0 : counter + 1;
		slow_clk <= (counter < mid_cnt) ? 1'b0 : 1'b1;
	end
end

always @(posedge slow_clk) begin
	push_q1 <= push;
	push_q2 <= push_q1;
end

assign push_debounced = push_q1 & push_q2;

/* mux for various speed (There are two speed to move square, those are selected by switch) */
always @(*) begin
	case(switch)
		0: begin 
			max_cnt = 249999; mid_cnt = 125000; 
		end
		1: begin 
			max_cnt = 999999; mid_cnt = 500000; 
		end
		default: begin
			max_cnt = 249999; mid_cnt = 125000; 
		end
	endcase
end

always @(posedge slow_clk) begin
	if (rst) begin
		/* The reset values of the square is to hold the square on the mid. of the screen */
		x_left_cnt <= 320;
		x_right_cnt <= 360;
		y_down_cnt <= 220;
		y_up_cnt <= 260;
	end else begin
		if (push_debounced[0]) begin // up
			y_down_cnt <= y_down_cnt + 10; 
			y_up_cnt <= y_up_cnt + 10;
		end else if (push_debounced[3]) begin // down 
			y_down_cnt <= y_down_cnt - 10; 
			y_up_cnt <= y_up_cnt - 10;
		end else if (push_debounced[2]) begin // left
			x_left_cnt <= x_left_cnt - 10;
			x_right_cnt <= x_right_cnt - 10;
		end else if (push_debounced[1]) begin // right
			x_left_cnt <= x_left_cnt + 10;
			x_right_cnt <= x_right_cnt + 10;
		end
	end
end

/* Pixel Color */
always @(*) begin
	rgb = 3'b000;
	if(video_on) begin
		if (square_on) rgb = 3'b010;
		else rgb = 3'b001;
	end
end

assign square_on = ((pixel_x > x_left_cnt && pixel_x < x_right_cnt) && (pixel_y > y_down_cnt && pixel_y < y_up_cnt)); // set the position of square

endmodule