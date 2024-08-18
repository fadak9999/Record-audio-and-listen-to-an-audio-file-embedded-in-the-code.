// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
//   ////////////////////////////////////////////////
  late AudioPlayer player; // سيتم استخدامه لتشغيل الملفات الصوتية
  final Record record = Record(); //لاستخدامه في تسجيل الصوت
  bool isPlaying = false; //يشير إلى ما إذا كان يتم تشغيل الصوت حاليًا أم لا.
  bool isRecording = false; //يشير إلى ما إذا كان يتم تسجيل الصوت حاليًا أم لا.
  bool isPaused = false; //يشير إلى ما إذا كان التشغيل متوقفًا مؤقتًا.
  double sliderValue = 0.0; //slider
  Duration duration = Duration.zero; //يخزن مدة الملف الصوتي بالكامل.
  Duration position =
      Duration.zero; //يخزن الموضع الحالي للتشغيل داخل الملف الصوتي.
  String? recordingPath; // يخزن المسار إلى ملف الصوت المسجل.
// //

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    player.onDurationChanged.listen((d) {
      setState(() {
        duration = d;
      });
    });
    player.onPositionChanged.listen((p) {
      setState(() {
        position = p;
        sliderValue = p.inSeconds.toDouble();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: const Color.fromARGB(255, 177, 176, 170),
            height: 400,
            width: double.infinity,
            alignment: Alignment.center,
            child: const Text(
              "play music",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${position.inSeconds}"),
              SizedBox(
                width: 300,
                child: Slider(
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: sliderValue,
                  onChanged: (val) {
                    setState(() {
                      sliderValue = val;
                      player.seek(Duration(seconds: val.toInt()));
                    });
                  },
                ),
              ),
              Text("${duration.inSeconds}"),
            ],
          ),
          //todoيعرض شريط تمرير (Slider) للتحكم في موضع التشغيل، مع عرض الموضع الحالي والمدة الكاملة على اليمين واليسار.
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //?
              IconButton(
                onPressed: () async {
                  if (isPlaying) {
                    if (isPaused) {
                      player.resume();
                      setState(() {
                        isPaused = false;
                      });
                    } else {
                      player.pause();
                      setState(() {
                        isPaused = true;
                      });
                    }
                  } else {
                    await playMusic(); //
                    setState(() {
                      isPlaying = true;
                    });
                  }
                },
                icon: Icon(
                    isPaused ? Icons.play_arrow : Icons.audiotrack_outlined),
              ),
              //todo
              IconButton(
                onPressed: () async {
                  if (isRecording) {
                    await stopRecording();
                    setState(() {
                      isRecording = false;
                    });
                  } else {
                    await startRecording();
                    setState(() {
                      isRecording = true;
                    });
                  }
                },
                icon: Icon(isRecording ? Icons.stop : Icons.mic),
              ),
              //todo زر لتسجيل الصوت. إذا كان التسجيل جارياً، يتم إيقافه عند الضغط. إذا لم يكن جارياً، يتم بدء التسجيل.
              IconButton(
                onPressed: () async {
                  await player.stop();
                  setState(() {
                    isPlaying = false;
                    isPaused = false;
                  });
                },
                icon: const Icon(Icons.stop_circle_outlined),
              ),
            ],
          ),
          //?  زر لإيقاف تشغيل الصوت بالكامل وإعادة تعيين الحالة.
//////////////////////////////////
          if (recordingPath != null) // عرض زر تشغيل التسجيل إذا كان متاحاً
            IconButton(
              onPressed: () async {
                await playRecording();
              },
              icon: const Icon(Icons.play_arrow),
            ),
          //todo إذا كان هناك تسجيل متاح، يعرض زر لتشغيل التسجيل المحفوظ.
        ],
      ),
    );
  }
//!------------ تقوم بتحديد مصدر الصوت من الأصول (assets) وتشغيله.

  Future<void> playMusic() async {
    await player.setSource(AssetSource('juj.mp3'));
    player.resume();
  }

//!----------- تطلب إذن الميكروفون. إذا تم منح الإذن، تبدأ تسجيل الصوت وتحفظه في ملف في المسار المؤقت.
  Future<void> startRecording() async {
    // طلب إذن تسجيل الصوت
    PermissionStatus status = await Permission.microphone.request();

    if (status.isGranted) {
      // الحصول على مسار الدليل المؤقت
      final directory = await getTemporaryDirectory();
      final path = '${directory.path}/recording.m4a';

      await record.start(path: path);
      print("Recording started at $path");
    } else {
      print("Microphone permission denied");
    }
  }

//!------------ recordingPath توقف التسجيل وتخزن مسار الملف الصوتي في المتغير .
  Future<void> stopRecording() async {
    final path = await record.stop();
    setState(() {
      recordingPath = path; // تخزين المسار بعد التسجيل
    });
    print("Recording saved to $path");
  }

//!-----------------تقوم بتشغيل التسجيل المحفوظ إذا كان المسار موجودًا.
  Future<void> playRecording() async {
    if (recordingPath != null) {
      await player.setSource(DeviceFileSource(recordingPath!));
      player.resume();
    }
  }
}
