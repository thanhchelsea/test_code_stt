import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:test_code/micro_component.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'controller.dart';

class Micro1Ui extends StatefulWidget {
  const Micro1Ui({Key? key}) : super(key: key);

  @override
  _Micro1UiState createState() => _Micro1UiState();
}

class _Micro1UiState extends State<Micro1Ui> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<TextToSpeechController>(
      builder: (controller) {
        return Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.w),
              child: Text(
                "Speech To Text",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            Expanded(
              child: MicroComponent(
                textSpeech: controller.textResult.value,
                textOrigin: controller.textOrigin.value,
                colorButton:
                    controller.isListening.value ? Colors.red : Colors.blue,
                onTapSpeech: () {
                  controller.speechToText.isNotListening
                      ? controller.startListening()
                      : controller.stopListening();
                },
                isListen: controller.isListening.value,
              ),
            ),
          ],
        );
      },
    );
  }
}
