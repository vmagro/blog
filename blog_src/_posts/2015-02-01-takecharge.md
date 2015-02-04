---
layout: post
title: "Take Charge"
subtitle: "USB-based Android exploit allowing automated installation of unauthorized applications"
header-img: "img/take-charge-header.png"
---

At [SB Hacks](http://www.ucsbhacks.com/) last weekend, we built [Take Charge](http://sbhacks.challengepost.com/submissions/32343-take-charge?utm_campaign=sb-hacks_20140908&utm_content=submission_visible_in_gallery&utm_medium=email&utm_source=transactional), a device that could be disguised as a standard USB charger, but secretly hides a way to install a data-mining application on unsuspecting users' phones.

We do this by taking advantage of the implicit trust that a user has in an innocent-looking phone charger and the trust that Android blindly gives to USB input devices. Take Charge emulates a normal USB keyboard,
that is programmed to rapidly navigate through the Android settings menus to enable debugging and allow unknown sources, and then download our payload apk onto the device and install it on behalf of the user,
granting an alarming number of permissions in a matter of seconds.

See a video of Take Charge in action below:

<iframe width="420" height="315" src="https://www.youtube.com/embed/LnVOQbqrt6Y" frameborder="0" allowfullscreen></iframe>

We use our emulated keyboard to unlock the device (doesn't work if the user has a passcode, but things like Smart Unlock would still allow us to unlock the phone) after first waiting a few seconds so that the user isn't looking at their phone to see what's about to happen.
We take advantage of the fact that the stock Android launcher allows you to run a search query by just typing text anywhere on the homescreen, so we search for "Settings", and open the Settings app, enable unknown sources, then go download our data-mining APK from the internet, and install it using our full keyboard access.
Then we go back to Settings and give Take Charge full access to notifications, so we can monitor all notifications that the user receives and upload them to our web dashboard in the background.

We achieved this by using an Arduino Uno that is acting as a USB HID device by flashing an alternative firmware on the microcontroller that controls the Uno's USB port as described [here](http://mitchtech.net/arduino-usb-hid-keyboard/).

Our code is available on GitHub [web interface + Arduino code](https://github.com/vmagro/TakeCharge).

Disclaimer: Take Charge is a proof of concept of a payload delivery system and a reminder to users to be more security conscious - Take Charge was never intended to be exploited.