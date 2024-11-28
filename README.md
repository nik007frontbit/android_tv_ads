# android_tv_ads

A new Flutter project wth android tv.

## Getting Started

This project is a starting point for a Flutter application.

Here please focus on the remote control base focus
and how we show sliding and handle ads all

How to deploy to Android TV
First Build the App Locally and Make It Available for Download
Build an app that has the “d-pad” support (here is one I prepared earlier: https://github.com/cocreations/android_tv_dpad_basic)
Use serve in the folder with the .apk so it’s available via port 80
Use ngrok to get the location available on the internet
flutter build apk  
cd build/app/outputs/flutter-apk/
serve
ngrok http 5000   # this in another tab
Next Install the App on your Android TV
Go into Apps, open the Google Play Store, and
Install an app that will allow browsing to a URL (I found and recommend Downloader by AFTVnews)
Go home, open Settings (cog icon) > Apps > Security & restrictions
Untick Verify apps, choose Unknown sources, and allow the new Downloader by AFTVnews app to do this
Go home, and run the Downloader by AFTVnews app, and type in the ngrok URL (eg. https://b3cdd4f102eb.ngrok.io/app-release.apk)
Install and Open the app !
