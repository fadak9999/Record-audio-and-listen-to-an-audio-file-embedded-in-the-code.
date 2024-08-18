// // import 'package:audioplayers/audioplayers.dart';
// // import 'package:flutter/material.dart';

// // class Home2 extends StatefulWidget {
// //   const Home2({super.key});

// //   @override
// //   State<Home2> createState() => _Home2State();
// // }

// // class _Home2State extends State<Home2> {
// //   late AudioCache cache; //?
// //   late AudioPlayer player; //تشغيل الملفا الصوتيه في الكود
// //   bool isplaying = false;
// //   //
// //   Duration currentpostion = Duration();
// //   Duration musicLength = Duration();

// //   @override
// //   void initState() {
// //     super.initState();
// //     player = AudioPlayer();
// //     cache.load("juj.mp3");
// //     setUp();
// //   }

// //   @override
// //   //?
// //   setUp() {
// //     setState(() {
// //       player.onAudioPositionChanged.listen((d) {
// //         setState(() {
// //           currentpostion = d;
// //         });
// //         player.onDurationChanged.listen((d) {
// //           setState(() {
// //             musicLength = d;
// //           });
// //         });
// //       });
// //     });
// //   }

// //   //?
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Column(
// //         mainAxisAlignment: MainAxisAlignment.start,
// //         children: [
// //           Container(
// //             color: const Color.fromARGB(255, 177, 176, 170),
// //             height: 400,
// //             width: double.infinity,
// //             child: Text(
// //               "play music",
// //               style: TextStyle(fontSize: 20),
// //             ),
// //             alignment: Alignment.center,
// //           ),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               Text("${currentpostion.inSeconds}"),
// //               Container(
// //                   width: 300,
// //                   child: Slider(
// //                       value: currentpostion.inSeconds.toDouble(),
// //                       max: musicLength.inSeconds.toDouble(),
// //                       onChanged: (val) {
// //                         seetkTo(val.toInt());
// //                       })),
// //               Text("${musicLength.inSeconds}"),
// //             ],
// //           ),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               IconButton(
// //                   onPressed: () {
// //                     if (currentpostion.inSeconds == 0 ||
// //                         currentpostion.inSeconds < 10) {
// //                       seetkTo(0);
// //                     } else if (currentpostion.inSeconds > 10) {
// //                       seetkTo(currentpostion.inSeconds - 10);
// //                     }
// //                   },
// //                   icon: Icon(Icons.first_page)),
// //               //
// //               IconButton(
// //                   onPressed: () {
// //                     if (isplaying) {
// //                       setState(() {
// //                         isplaying = false;
// //                       });
// //                       stopMusic();
// //                     } else {
// //                       setState(() {
// //                         isplaying = true;
// //                       });
// //                       playMusic();
// //                     }
// //                   },
// //                   icon: isplaying ? Icon(Icons.pause) : Icon(Icons.play_arrow)),
// //               IconButton(
// //                   onPressed: () {
// //                     if (currentpostion < musicLength - Duration(seconds: 10)) {
// //                       seetkTo(currentpostion.inSeconds + 10);
// //                     } else {
// //                       seetkTo(musicLength.inSeconds);
// //                       setState(() {
// //                         isplaying = false;
// //                       });
// //                       player.stop();
// //                     }
// //                   },
// //                   icon: Icon(Icons.last_page)),
// //             ],
// //           )
// //         ],
// //       ),
// //     );
// //   }

// //   void playMusic() async {
// //     await player.setSource(AssetSource('juj.mp3'));
// //     player.resume();
// //   }

// //   void stopMusic() {
// //     player.stop();
// //   }

// //   //
// //   seetkTo(int sec) {
// //     player.seek(Duration(seconds: sec));
// //   }
// // }
// //!!!!!!!!!!!!!!
// // import 'package:audioplayers/audioplayers.dart';
// // import 'package:flutter/material.dart';

// // class Home2 extends StatefulWidget {
// //   const Home2({super.key});

// //   @override
// //   State<Home2> createState() => _Home2State();
// // }

// // class _Home2State extends State<Home2> {
// //   late AudioPlayer player;
// //   bool isPlaying = false;
// //   Duration currentPosition = Duration();
// //   Duration musicLength = Duration();

// //   @override
// //   void initState() {
// //     super.initState();
// //     player = AudioPlayer();

// //     player.onPositionChanged.listen((Duration p) {
// //       setState(() {
// //         currentPosition = p;
// //       });
// //     });

// //     player.onDurationChanged.listen((Duration d) {
// //       setState(() {
// //         musicLength = d;
// //       });
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Column(
// //         mainAxisAlignment: MainAxisAlignment.start,
// //         children: [
// //           Container(
// //             color: const Color.fromARGB(255, 177, 176, 170),
// //             height: 400,
// //             width: double.infinity,
// //             child: Text(
// //               "play music",
// //               style: TextStyle(fontSize: 20),
// //             ),
// //             alignment: Alignment.center,
// //           ),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               Text("${currentPosition.inSeconds}"),
// //               Container(
// //                 width: 300,
// //                 child: Slider(
// //                   value: currentPosition.inSeconds.toDouble(),
// //                   max: musicLength.inSeconds.toDouble(),
// //                   onChanged: (val) {
// //                     seekTo(val.toInt());
// //                   },
// //                 ),
// //               ),
// //               Text("${musicLength.inSeconds}"),
// //             ],
// //           ),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               IconButton(
// //                 onPressed: () {
// //                   if (currentPosition.inSeconds <= 10) {
// //                     seekTo(0);
// //                   } else {
// //                     seekTo(currentPosition.inSeconds - 10);
// //                   }
// //                 },
// //                 icon: Icon(Icons.first_page),
// //               ),
// //               IconButton(
// //                 onPressed: () {
// //                   if (isPlaying) {
// //                     setState(() {
// //                       isPlaying = false;
// //                     });
// //                     stopMusic();
// //                   } else {
// //                     setState(() {
// //                       isPlaying = true;
// //                     });
// //                     playMusic();
// //                   }
// //                 },
// //                 icon: isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
// //               ),
// //               IconButton(
// //                 onPressed: () {
// //                   if (currentPosition.inSeconds + 10 < musicLength.inSeconds) {
// //                     seekTo(currentPosition.inSeconds + 10);
// //                   } else {
// //                     seekTo(musicLength.inSeconds.toInt());
// //                     setState(() {
// //                       isPlaying = false;
// //                     });
// //                     stopMusic();
// //                   }
// //                 },
// //                 icon: Icon(Icons.last_page),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   void playMusic() async {
// //     await player.setSource(AssetSource('juj.mp3'));
// //     player.resume();
// //   }

// //   void stopMusic() {
// //     player.stop();
// //   }

// //   void seekTo(int sec) {
// //     player.seek(Duration(seconds: sec));
// //   }
// // }
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';

// class Home2 extends StatefulWidget {
//   const Home2({super.key});

//   @override
//   State<Home2> createState() => _Home2State();
// }

// class _Home2State extends State<Home2> {
//   late AudioPlayer player; // مشغل الصوت
//   bool isPlaying = false; // حالة التشغيل
//   Duration currentPosition = Duration(); // موقع التشغيل الحالي
//   Duration musicLength = Duration(); // طول الموسيقى

//   @override
//   void initState() {
//     super.initState();
//     player = AudioPlayer();

//     // الاستماع لتغييرات الموقع
//     player.onPositionChanged.listen((Duration p) {
//       setState(() {
//         currentPosition = p;
//       });
//     });

//     // الاستماع لتغييرات المدة
//     player.onDurationChanged.listen((Duration d) {
//       setState(() {
//         musicLength = d;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Audio Player"),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Container(
//             color: const Color.fromARGB(255, 177, 176, 170),
//             height: 200, // تحسين حجم ال Container
//             width: double.infinity,
//             child: Center(
//               child: Text(
//                 "Play Music",
//                 style: TextStyle(fontSize: 20),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0), // إضافة حواف حول ال Slider
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text("${currentPosition.inSeconds} s"),
//                 Expanded(
//                   child: Slider(
//                     value: currentPosition.inSeconds.toDouble(),
//                     min: 0,
//                     max: musicLength.inSeconds.toDouble(),
//                     onChanged: (val) {
//                       seekTo(val.toInt());
//                     },
//                   ),
//                 ),
//                 Text("${musicLength.inSeconds} s"),
//               ],
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               IconButton(
//                 onPressed: () {
//                   // التراجع 10 ثواني
//                   seekTo(currentPosition.inSeconds - 10);
//                 },
//                 icon: Icon(Icons.replay_10),
//               ),
//               IconButton(
//                 onPressed: () {
//                   if (isPlaying) {
//                     setState(() {
//                       isPlaying = false;
//                     });
//                     stopMusic();
//                   } else {
//                     setState(() {
//                       isPlaying = true;
//                     });
//                     playMusic();
//                   }
//                 },
//                 icon: isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
//               ),
//               IconButton(
//                 onPressed: () {
//                   // التقدم 10 ثواني
//                   seekTo(currentPosition.inSeconds + 10);
//                 },
//                 icon: Icon(Icons.forward_10),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // تشغيل الموسيقى
//   void playMusic() async {
//     await player.setSource(AssetSource('juj.mp3'));
//     player.resume();
//   }

//   // إيقاف الموسيقى
//   void stopMusic() {
//     player.stop();
//   }

//   // الانتقال إلى موقع معين في الموسيقى
//   void seekTo(int sec) {
//     if (sec < 0) sec = 0; // تجنب الانتقال إلى موقع سلبي
//     if (sec > musicLength.inSeconds) sec = musicLength.inSeconds; // تجنب الانتقال بعد نهاية الموسيقى
//     player.seek(Duration(seconds: sec));
//   }
// }
