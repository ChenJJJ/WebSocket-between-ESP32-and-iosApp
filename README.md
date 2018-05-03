# WebSocket-between-ESP32-and-iosApp
This is a simple implementation about websocket between App(IOS) and esp32

I got a lot of help from 2 posts:
https://techtutorialsx.com/2017/11/03/esp32-arduino-websocket-server-over-soft-ap/
and
https://github.com/daltoniam/Starscream
The first one do the same thing basing on python, while the second post do websocket on swift. I do some change and bridging on these 2 posts and realize the basic data transmission basing on websocket between App and esp32.

First Part:
The first part is implement websocket on swift.
Firstly, you need to follow the instruction(Install and Get Started) on 
https://cocoapods.org/
to intall Starscream and add that into your xcode project. And in the Podfile, you need to use a correct version accoring to you xcode. My xcode is 9.2, so I use "platform :ios, '9.0'" in that file. And you need to open Xcode workspace in right way.
Then you can see details about how to use Starscream in second post. One thing to mention, the url should be the IP address of your access point created by ESP32, which will be mentioned in second part.

Second Part:
We use Arduino IDE to code our ESP32. 
On the ESP32 side,the basic idea is we use ESP32, as a server, to create an access point(AP). And our App does websocket connection by connect to the AP created. Before the following steps, you need to add WebSocketServer library into your Arduino library. Then the code is almost the same as that in first post.

In App, it will connect with ESP32 first and give an indication. Then, every time we push "send" button, App will send a data to ESP32. After ESP32 get that data, it will also send back to App, which realizes the real-time websocket communication between these 2 things.
