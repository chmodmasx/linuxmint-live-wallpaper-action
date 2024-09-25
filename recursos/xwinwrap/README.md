# Xwinwrap

Fork of xwinwrap.  
Xwinwrap allows you to stick an app such as a videoplayer or gif viewer to your desktop background.  
Gif as a background:

![demo gif](https://github.com/mmhobi7/xwinwrap/blob/readme/demo-gif.gif)

Video as a background (it is much smoother than the gif would make it appear):

![demo gif](https://github.com/mmhobi7/xwinwrap/blob/readme/demo-video.gif)

### Installing

```
sudo apt-get install xorg-dev build-essential libx11-dev x11proto-xext-dev libxrender-dev libxext-dev
git clone https://github.com/mmhobi7/xwinwrap.git
cd xwinwrap
make
sudo make install
make clean
```

### Uninstalling 

```
cd /path/to/xwinwrap
sudo make uninstall
cd ..
rm -r xwinwrap
```

### Usage

```
Usage: 
    xwinwrap [OPTIONS...] -- <video-player> [VIDEO-PLAYER OPTIONS...] <video-file>
 
Options:
             -g {w}x{h}+{x}+{y}    
                     - Specify Geometry (w=width, h=height, x=x-coord,
                       y=y-coord. ex: -g 640x480+100+100)
             -ni     - Ignore Input
             -argb   - RGB
             -fdt    - Force WID window a desktop type window
             -fs     - Full Screen
             -un     - Undecorated
             -s      - Sticky
             -st     - Skip Taskbar
             -sp     - Skip Pager
             -a      - Above
             -b      - Below
             -nf     - No Focus
             -o      - Opacity value between 0 to 1 (ex: -o 0.20)
             -sh     - Shape of window (choose between rectangle, circle or
                       triangle. Default is rectangle)
             -ov     - Set override_redirect flag (For seamless desktop
                       background integration in non-fullscreenmode) (can cause
                       artifacts on some environments)
             -ovr    - Set override_redirect flag on root window (For seamless
                       desktop background integration in fullscreenmode)
             -d      - Daemonize
             -debug  - Enable debug messages
```
Example

`xwinwrap -g 400x400 -ni -s -nf -b -un -argb -sh circle -- gifview -w WID mygif.gif -a`

`nice xwinwrap -b -s -fs -st -sp -nf -ov -fdt -- mpv -wid WID --really-quiet --framedrop=vo --no-audio --panscan="1.0" /path/to/your/video`
### Changes

* Added ability to make undecorated window
* Changed how desktop window is found
* Refactored window hints
* Add DESKTOP window type flag

----
Original source - https://launchpad.net/xwinwrap
