helloFace
=========

helloFace is a face-detection tool which aims on simple setting and easy using.


Functions:
----------
* using [OSC](http://archive.cnmat.berkeley.edu/OpenSoundControl/) to send out the result of face-detection
* also receive [OSC](http://archive.cnmat.berkeley.edu/OpenSoundControl/) message for dynamic settings
* providing GUI for simple setting and easy using


How to install:
---------------
* install GStreamer framework on your platform ([reference](http://wiki.processing.org/w/Video_Issues))
	* make sure that you can run video-related examples in Processing 2.x (if you can, that means you install GStreamer framework already.)
* install OpenCV 2 on your platform ([reference](http://codeanticode.wordpress.com/2011/11/21/opencv-2-in-processing/))
	* windows
	* Mac ([中文參考](http://shenshengpo.blogspot.tw/2013/01/macprocessing-opencv-2.html))
	* Linux ([中文參考](http://shenshengpo.blogspot.tw/2013/01/ubuntu-processing-opencv-2.html))


//... to be continued


Tech:
-----
***helloFace*** uses GStreamer framework to capture live camera video, and then uses OpenCV 2 to do face-detection.


Built with:
-----------
* [Processing](http://processing.org)
* [javacvPro library](http://www.mon-club-elec.fr/pmwiki_reference_lib_javacvPro/pmwiki.php) for getting the power of [OpenCV 2](http://opencv.willowgarage.com/wiki)
* [oscP5 library](http://www.sojamo.de/libraries/oscP5)
* [controlP5 library](http://www.sojamo.de/libraries/controlP5)

