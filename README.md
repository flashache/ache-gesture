![AcheGesture poster](http://flashache-wordpress.stor.sinaapp.com/uploads/2012/12/ache-gesture.jpg)


Gesture-recognition framework for Adobe AIR Mobile App based on [Starling Framework](http://www.starling-framework.org/)

Created by [Qi Donghui](http://www.flashache.com/about/)

AcheGesture简介:[http://www.flashache.com/2012/12/17/ache-gesture-introduction/](http://www.flashache.com/2012/12/17/ache-gesture-introduction/)

AcheGesture Introduction:[http://www.flashache.com/2012/12/17/ache-gesture-introduction-en/](http://www.flashache.com/2012/12/17/ache-gesture-introduction-en/)

##Features:
* Provide seven based gestures, include: Tap, Double Tap, Pinch, Pan, Swipe, Rotate and Long press.
* Each gesture of the framework can be config, "Long press" for example, can config time threshold for recognition.
* Handle conflict between different gestures, like one gesture recognition requeres another recognition to fail(requireGestureRecognizerToFail), recognition priority, simultaneous effect and so on.
* Use callback function to send different state of the gestures(discrete gestures and continuous gestures), gestures' state includes:recognized, possible, failed, began, changed, ended and cancelled.
* Extendable, AcheGesture framework can be extended for new gesture-recognizers according to the projects use GestureRecognizerPlugin, and certain gesture-recognizers can be activate when needed.
* Free and open source, can be used under any circumstances.

##Why AcheGesture?
###1. Needs for re-useable code
Starling provides touch event, include handling both single and multi touch, but does not encapsulate for specific gestures, for example "Swipe Gesture". When someone implements one specific gesture-recognizers, codes for re-uses is one basic needs for encapsulation.
###2. Needs encapsulation for handling complex gesture-recognizers' relationship
This reason is the main reason why I wrote the AcheGesture. For Instance, if one display object linked to a Tap Gesture-recognizer and a Double Tap Gesture-recognizer, when user taps twice in a short time, there will be four different results (yes, 4, no kidding --!) as following: 1. two taps and one double tap, 2. one tap and one double tap, 3. two taps, 4. one double tap. A little surprised? Especially the second result a little hard to image why. Dont worry i will explain it in the Tap Example tutorial(coming soon). Actually, in normal case, we expect the 3rd and the 4th result. So come along the "requireGestureRecognizerToFail" relationship between two gestures. In this case, tap gesture recognize require double tap gesture recognize to fail, which means only when the framework try to recognized the double tap and fail then it will try to recognize the tap gesture. When more gestures come along with this kind of relationship, it become very complex for some simple needs, so we need some encapsulation for this certain logic.
###3. Needs handling simultaneous gestures' effect
This is also a common needs, but can not be done easily by sigle touch object provided by Starling Framework. For example, when use Pinch gesture to scale one display object, in the same time, user can also pan or so called drag the object, even may also rotate the object simultaneously. So we need to handle this kind of situation.


**Note:** Ache-gesture is in beta, so there is no "stable version" yet, but 1.0 is very, very near. If you found any bugs or want some features added to this framework or have any troubles to use, please info me by email(flashache@gmail.com) or weibo:(@flashache)


