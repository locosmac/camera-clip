# camera-clip

An adjustable clip design for Continuity Camera that you can print on a 3D printer.

![Camera Clip](https://github.com/locosmac/camera-clip/blob/main/images/camera-clip-render.png?raw=true)

Due to the use of OpenSCAD you can easily adjust the relevant parameters to match the clip dimensions to your iPhone and screen type. The predefined values are for an iPhone Pro with a very thin case and a 13-inch Mac Pro.

## Usage

Get [OpenSCAD](https://openscad.org/) and install it. Download the file with [clip design](openscad/camera-clip.scad) and open it in OpenSCAD. Measure the thickness of your iPhone including the case using a caliper and adjust the value for `iPhoneThickness` accordingly. Measure the thickness of your screen using a caliper and adjust the `macScreenThickness` accordingly. Press the render button and export an STL file. Import the STL file in [Ultimaker Cura](https://ultimaker.com/en/software/ultimaker-cura) or your 3D printer software of choice and print it.

After printing make sure to remove all sharp edges (e.g. from the board adhesion) using a fine-grained sand paper before using the clip. Otherwise you might get scratches into your screen protector, especially, if you are using a soft one.

## Preview

If the thickness is set properly, the clip will not fall off, so you can easily attach two clips to the iPhone and then attach your iPhone to the screen.

![Sticks to the iPhone](https://github.com/locosmac/camera-clip/blob/main/images/camera-clip-front.jpg?raw=true)

It looks really dangerous, but since the iPhone is quite heavy, it is suprisingly steady.

![Sticks to the Mac](https://github.com/locosmac/camera-clip/blob/main/images/camera-clip-back.jpg?raw=true)

In addition, if you have access to a 3D printer, its less expensive and more portable than other alternatives.

![Works for me](https://github.com/locosmac/camera-clip/blob/main/images/camera-clip-mounted.jpg?raw=true)

Of course, use at your own risk ;-).



