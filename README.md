# Voting Machine Mobile Client
## How to run Android app on your phone and/or emulator  
1. We used a Windows computer and Android Studio to develop the app. 
2. To test this out, you can either use an Android emulator or a real Android phone.  
3. Make sure the Android Studio is installed on your computer successfully. You can go to the official website to download the latest compatible version.  
4. To download Flutter, please follow this link: [click me](https://flutter.dev/docs/get-started/install/macos). Make sure you update the path to your Flutter bin folder.   
5. Remember to run    
`flutter doctor -v`   
to check if anything is missing.   
To launch the app in the emulator, ensure that the emulator is running and enter the following command.   
`flutter run`   
The app will run in the emulator. Remember to locate the root of the project folder first.  
6. To launch the app in a real phone, you need to follow the instructions given in the Android Studio. First, make sure you connect your phone to your computer using a USB cord. Run   
 `flutter doctor -v`  
to see if the device is connected properly.  
7. Follow the instructions on this link to run the app on your Android phone: [click me](https://developer.android.com/training/basics/firstapp/running-app). But to put it in simple terms, you need to enable USB debugging by opening the Settings on your Android phone. Locate to the build number seven times. Then, you will be able to see the device on the available devices list. Click   
`run`   
to run the app on your phone.
8. You are all set! Make sure Bluetooth is on for your phone. Make sure the Pi server is running in the room. You will be able to see the homepage with a list of devices!


## How to run iOS app on your iPhone and/or emulator  
1. We used a Mac computer, Android Studio and Xcode to develop the iOS app. 
2. To test this out, you can either use an iPhone emulator or a real iPhone.  
3. Make sure the Android Studio and Xcode are installed on your computer successfully. For Xcode, you can download in the App Store. For the Android Studio, you can go to the official website to download the latest compatible version.  
4. To download Flutter, please follow this link: [click me](https://flutter.dev/docs/get-started/install/macos). Make sure you update the path to your Flutter bin folder.   
5. Remember to run    
`flutter doctor -v`   
to check if anything is missing.   
To launch the app in the emulator, ensure that the emulator is running and enter the following command.   
`flutter run`   
The app will run in the emulator. Remember to locate the root of the project folder first.  
6. To launch the app in a real iPhone, you need to follow the instructions given in the Android Studio. First, make sure you connect your iPhone to your Mac using a USB cord. Run   
 `flutter doctor -v`  
to see if the device is connected properly.  
7. Click the link appeared in the Android Studio console, and you will be redirected to the Xcode version of the Flutter project.   
8. In the menu, click Preferences, then enter your Apple ID. Make sure you are using the same ID for your Mac and your phone. It will register you as a personal team.  
9. Navigate to the Product menu and click Clean Build Folder.
10. Click the whole Runner folder, enter your personal team as the team.
Your app will appear on your iPhone. Don’t forget to trust this app by going to Settings -> General -> Device Management. 
11. Click the run button on Xcode.
12. You are all set! Your app will start automatically on your iPhone. Click allow Bluetooth device when prompted. Make sure the Pi server is running in the room. You will be able to see the homepage with a list of devices!

