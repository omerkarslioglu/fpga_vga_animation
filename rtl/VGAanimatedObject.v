module VGAanimatedObject (clk, rst, switch, push, hsync, vsync, rgb);

input         clk, rst;
input         switch;
input   [3:0] push;
output        hsync, vsync;
output  [2:0] rgb;

wire          video_on;
wire    [9:0] pixel_x, pixel_y;

/* instantiation of VGA Driver */ 
vgaSync vgaSync(
  .clk(clk), 
  .rst(rst), 
  .hsync(hsync), 
  .vsync(vsync), 
  .video_on(video_on), 
  .p_tick(), 
  .pixel_x(pixel_x), 
  .pixel_y(pixel_y)
);

/* instantiation of pixelGeneration circuit (square animation) */
pixelGeneration pixelGeneration(
  .clk(clk), 
  .rst(rst), 
  .push(push), 
  .switch(switch), 
  .pixel_x(pixel_x), 
  .pixel_y(pixel_y), 
  .video_on(video_on), 
  .rgb(rgb)
);

endmodule
