// import 'package:flutter/material.dart';
// import 'package:flutter_sound/flutter_sound.dart';
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   FlutterSoundRecorder? _recorder;
//   FlutterSoundPlayer? _player;
//   String? _filePath;
//   bool isRecording = false;
//   bool isPlaying = false;

//   @override
//   void initState() {
//     super.initState();
//     _recorder = FlutterSoundRecorder();
//     _player = FlutterSoundPlayer();
//     _initRecorder();
//   }

//   Future<void> _initRecorder() async {
//     Directory tempDir = await getTemporaryDirectory();
//     _filePath = '${tempDir.path}/audio_record.aac';
//     await _requestPermissions();
//     await _recorder!.openRecorder();
//     await _player!.openPlayer();
//   }

//   Future<void> _requestPermissions() async {
//     var status = await Permission.microphone.request();
//     if (!status.isGranted) {
//       throw 'Microphone permission not granted';
//     }
//   }

//   Future<void> _startRecording() async {
//     await _recorder!.startRecorder(toFile: _filePath);
//     setState(() {
//       isRecording = true;
//     });
//   }

//   Future<void> _stopRecording() async {
//     await _recorder!.stopRecorder();
//     setState(() {
//       isRecording = false;
//     });
//   }

//   Future<void> _playRecording() async {
//     if (_filePath != null && File(_filePath!).existsSync()) {
//       await _player!.startPlayer(
//         fromURI: _filePath,
//         whenFinished: () {
//           setState(() {
//             isPlaying = false;
//           });
//         },
//       );
//       setState(() {
//         isPlaying = true;
//       });
//     }
//   }

//   Future<void> _pausePlayback() async {
//     if (isPlaying) {
//       await _player!.pausePlayer();
//       setState(() {
//         isPlaying = false;
//       });
//     }
//   }

//   Future<void> _resumePlayback() async {
//     if (!isPlaying) {
//       await _player!.resumePlayer();
//       setState(() {
//         isPlaying = true;
//       });
//     }
//   }

//   // Future<void> _seekForward() async {
//   //   if (isPlaying) {
//   //     await _player!.seekToPlayer(Duration(seconds: (await _player!.getPosition())!.inSeconds + 5));
//   //   }
//   // }

//   // Future<void> _seekBackward() async {
//   //   if (isPlaying) {
//   //     await _player!.seekToPlayer(Duration(seconds: (await _player!.getPosition())!.inSeconds - 5));
//   //   }
//   // }

//   @override
//   void dispose() {
//     _recorder!.closeRecorder();
//     _player!.closePlayer();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('تسجيل والتحكم في الصوت'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: isRecording ? _stopRecording : _startRecording,
//               child: Text(isRecording ? 'إيقاف التسجيل' : 'بدء التسجيل'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _playRecording,
//               child: const Text('تشغيل التسجيل'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _pausePlayback,
//               child: const Text('إيقاف مؤقت'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _resumePlayback,
//               child: const Text('استئناف'),
//             ),
//             const SizedBox(height: 20),
//             // ElevatedButton(
//             //   onPressed: _seekForward,
//             //   child: const Text('تقديم 5 ثوانٍ'),
//             // ),
//             const SizedBox(height: 20),
//             // ElevatedButton(
//             //   onPressed: _seekBackward,
//             //   child: const Text('تأخير 5 ثوانٍ'),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
