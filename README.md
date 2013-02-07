helloFace
=========

![helloFace](https://github.com/shengpo/helloFace/raw/master/helloFace.png)

helloFace is a face-detection tool which aims on simple setting and easy using.
([source code](https://github.com/shengpo/helloFace/raw/master/code/helloFace.zip))



Functions:
----------
- using [OSC](http://archive.cnmat.berkeley.edu/OpenSoundControl/) to send out the result of face-detection or to response query
- also receive [OSC](http://archive.cnmat.berkeley.edu/OpenSoundControl/) message for dynamic settings or query
- providing GUI for simple setting and easy using


How to install:
---------------
1. install ***GStreamer framework*** on your platform ([reference](http://wiki.processing.org/w/Video_Issues))
	- make sure that you can run video-related examples in Processing 2.x (if you can, that means you install GStreamer framework already.)
2. install ***OpenCV 2*** on your platform ([reference](http://codeanticode.wordpress.com/2011/11/21/opencv-2-in-processing/))
	- windows
	- Mac ([中文參考](http://shenshengpo.blogspot.tw/2013/01/macprocessing-opencv-2.html))
	- Linux ([中文參考](http://shenshengpo.blogspot.tw/2013/01/ubuntu-processing-opencv-2.html))
3. download, unzip adn run ***helloFace app*** from links below:
	- [Linux (32bit)](https://github.com/shengpo/helloFace/raw/master/apps/linux32/helloFace_linux32.zip)
	- [Linux (64bit)](https://github.com/shengpo/helloFace/raw/master/apps/linux64/helloFace_linux64.zip)
	- [Mac (64bit)](https://github.com/shengpo/helloFace/raw/master/apps/macosx64/helloFace_macosx64.zip)
	- [Windows (32bit)](https://github.com/shengpo/helloFace/raw/master/apps/windows32/helloFace_windows32.zip)
	- [Windows (64bit)](https://github.com/shengpo/helloFace/raw/master/apps/windows64/helloFace_windows64.zip)


How to use helloFace:
---------------------
####about helloFace main app
- Press key [s/S] to switch on/off SettingPanel
	- to select/set camera paramerters
	- to set OSC-related paramters
	- to set current settings as default settings for next usage
	- to delete current default setting files
- Press key [i/I] to switch on/off InfoPanel
- Press key [v/V] to switch on/off visual hints of detection
	- always send out OSC messages of detecting result, whether the visual hints is on or off

####about helloFace client app
you can use any language or tools that support OSC protocol to build a OSC connection with **helloFace app**.<br/>
, and then you can get the OSC messages about results of detecting faces or your query from **helloFace**.<br/>
in the future, you also can send OSC message to **helloFace** for advanced using.<br/>

####download helloFace client Examples
now some exanples are provided, you can download for testing and get more understanding about **helloFace**
- [Processing examples](https://github.com/shengpo/helloFace/raw/master/clientExamples/ProcessingExample.zip)


About OSC message:
------------------
####helloFace send [ OUT ]
- about responding camera's resolution
	- address pattern：`/returnCamRes`
	- type tag：`ii`
		- i: first one stands for camera's width
		- i: second one stands for camera's height

- about responding camera's FPS
	- address pattern：`/returnCamFps`
	- type tag：`i`
		- i: stands for camera's FPS (frame per second)

- about *face-detection*
	- address pattern : `/faceDetect`
	- type tag: `is`
		- i: total count of detected faces
		- s: list of detected faces' ranges (rectangle range). Format is `x=0.4640625,y=0.47083333,w=0.1828125,h=0.24375|x=0.4453125,y=0.35416666,w=0.2484375,h=0.33125|...`（and so on），every face range is separated by **|** , every face range (rectangle range) is consist of 4 numbers (every value is normalized，value is between0 and 1): **x** stands for the x position of top-left corner of rectangle, **y** stands for the y position of top-left corner of rectangle, **w** stands for the width of rectangle, **h** stands for the height of rectangle
	- Example: `/faceDetect 2 x=0.525,y=0.52708334,w=0.09375,h=0.125|x=0.4421875,y=0.36875,w=0.2484375,h=0.33125`


####helloFace receive [ IN ]
- about receiving query of camera's resolution
	- address pattern：`/queryCamRes`
	- type tag：none

- about receiving query of camera's FPS
	- address pattern：`/queryCamFps`
	- type tag：none



Tech:
-----
***helloFace*** uses GStreamer framework to capture live camera video, and then uses OpenCV 2 to do face-detection.


Built with:
-----------
- [Processing](http://processing.org)
- [javacvPro library](http://www.mon-club-elec.fr/pmwiki_reference_lib_javacvPro/pmwiki.php) for getting the power of [OpenCV 2](http://opencv.willowgarage.com/wiki)
- [oscP5 library](http://www.sojamo.de/libraries/oscP5)
- [controlP5 library](http://www.sojamo.de/libraries/controlP5)

