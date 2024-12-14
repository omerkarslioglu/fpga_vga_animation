# FPGA VGA ANIMATION

It's a motion of square animation to be implemented on the BASYS3 FPGA board.

Video link: https://www.youtube.com/watch?v=JUf8FeBw8NU

<p align="center">
  <img title="" alt="Windowing Operation" src="/docs/images/setup.jpeg"width="400" height="auto">
</p>

### Design Description:

* There is a square on the screen; you should control it using 4 push buttons. 
There are 4 directions: up, down, left, and right. 
There is also a switch that toggles between two-speed levels.

### Files Tree:
```
│   README.md
│
├───constraint
│       VGAanimatedObject.xdc
│
├───docs
│   └───images
│
└───rtl
        pixelGeneration.v
        VGAanimatedObject.v
        vgaSync.v
```

### Inputs and outputs of top module for this application:

<p align="center">
  <img title="" alt="Windowing Operation" src="/docs/images/top.png"width="400" height="auto">
</p>

* Inside of the top module there are two modules (pixelGeneration and vgaSync) instantiated as in the figure.
* Inputs and outputs of the pixelGeneration. The major animation hardware is in this VGAanimatedObject module.

<p align="center">
  <img title="" alt="Windowing Operation" src="/docs/images/inside_of_top.png"width="400" height="auto">
</p>

Thanks for reviewing the design. If you have any questions you can contact me on ``omerkarsliogluu@gmail.com``
