import 'package:audio/Home1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
     home:Home1() ,
    );
  }
}





///////////////
//todo الاذونات 
//todo. android >> AndroidManifest.xml :
// <manifest xmlns:android="http://schemas.android.com/apk/res/android">
// <uses-permission android:name="android.permission.RECORD_AUDIO"/>//!تضاف
// <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>//!تضاف
/////////


//todo . ios >> Runner >> Info.plist:

// 	<key>NSMicrophoneUsageDescription</key>//!
//         <string>We need access to your microphone for recording audio.</string>///!

// </dict>
// </plist>