![AcheGesture poster](http://flashache-wordpress.stor.sinaapp.com/uploads/2012/12/ache-gesture.jpg)


Gesture-recognition framework for Adobe AIR Mobile App based on [Starling Framework](http://www.starling-framework.org/)

Created by [Qi Donghui](http://www.flashache.com/about/)

AcheGesture简介:[http://www.flashache.com/2012/12/17/ache-gesture-introduction/](http://www.flashache.com/2012/12/17/ache-gesture-introduction/)

AcheGesture Introduction:[http://www.flashache.com/2012/12/17/ache-gesture-introduction-en/](http://www.flashache.com/2012/12/17/ache-gesture-introduction-en/)

##Features:
* Provide seven basic gestures, include: Tap, Double Tap, Pinch, Pan, Swipe, Rotate and Long press.
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

##How to use AcheGesture:
###Step1: Define gesture object
Use tap gesture as an example, this gesture has two states: recognized and possible. Use the TapGesture class to define the tap gesture object, send the reference for the callback function for these two states.

```
private function linkGesture():void
{
    var g1:Gesture = new TapGesture(onTapRecognized, onTapPossible);
}
```
Here we send two callback functions, onTapRecognized and onTapPossible. For defining gesture objects, we can also use Object data type, which needs to include callback functions’ references with certain keys, like “recognized” and “possible”. Use the Tap recognizer as example, g1 can be written in the following format:

```
var g1:Object = {"recognized": onTapRecognized, "possible": onTapPossible};
```
Using classes defined in the acheGesture.data package is strongly recommended. Not only because you will have code hinting but also you can easily know what states one gestures have. Use “Tap” gesture as example, if you use the acheGesture.data.TapGesture, you will see it only has two states: recognized and possible.
### Step2: Binding the gestures to display object
Next we use the GestureManager.add method to bind the pre-defined gestures to the target display objects, like following:

```
private function linkGesture():void
{
    var g1:Gesture = new TapGesture(onTapRecognized, onTapPossible);
    GestureManager.add(_btn, new GestureVars().onTap(g1).vars);
}
```
“GestureManager.add” has three parmeters. First is the display object (Starling.display.DisplayObject) you will bind. Second is the gestures config object. Third parmeter is if you all different gestures to effect in the same time or simultaneously. Also like defining the gesture object, here you can use the GestureVars datatype object to config the gesture, you can also directly use the Object data type, as the code shows here:

```
GestureManager.add(_btn, {"tap": g1}, false);
```
So, if we just use the Object data type, we can write it in this simple way:

```
GestureManager.add(_btn, {"tap": {"recognized": onTapRecognized, "possible": onTapPossible} }, false);
```
Just your choice for using which kind, personally i recommend to use the data type in the acheGesture.data package to config the gestures.

###Step3: Handling the gestures’ state callback
All the gestures’ stat callback function will need to receive one parmeter, e: AcheGestureEvent. This object has all the properties need to send out from the framework. Use tap gesture as example, when in the “possible” state, you can check the e.possible to know if the tap gesture is possible to recognize in certain time and then to show the different appearance according to the state. Details will be exampled in the Tap Example tutorial.

```
function onTapRecognized(e:AcheGestureEvent):void
{
    trace("tap gesture recognized!");
}
 
private function onTapPossible(e:AcheGestureEvent):void
{
    trace("tap gesture onTapPossible >>>" + e.possible);
}
```


**Note:** Ache-gesture is in beta, so there is no "stable version" yet, but 1.0 is very, very near. If you found any bugs or want some features added to this framework or have any troubles to use, please info me by email(flashache@gmail.com) or weibo:(@flashache)


