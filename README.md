helloFace
=========

![helloFace](https://github.com/shengpo/helloFace/raw/master/helloFace.png)

helloFace is a face-detection tool which aims on simple setting and easy using.



Functions:
----------
- using [OSC](http://archive.cnmat.berkeley.edu/OpenSoundControl/) to send out the result of face-detection
- also receive [OSC](http://archive.cnmat.berkeley.edu/OpenSoundControl/) message for dynamic settings
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



Tech:
-----
***helloFace*** uses GStreamer framework to capture live camera video, and then uses OpenCV 2 to do face-detection.


Built with:
-----------
- [Processing](http://processing.org)
- [javacvPro library](http://www.mon-club-elec.fr/pmwiki_reference_lib_javacvPro/pmwiki.php) for getting the power of [OpenCV 2](http://opencv.willowgarage.com/wiki)
- [oscP5 library](http://www.sojamo.de/libraries/oscP5)
- [controlP5 library](http://www.sojamo.de/libraries/controlP5)

