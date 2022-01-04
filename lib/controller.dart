import 'package:background_stt/background_stt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speech/flutter_speech.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:test_code/dialog_listen.dart';

class TextToSpeechController extends GetxController {
  RxList<String> textResult = <String>[].obs;
  RxList<String> textOrigin = <String>[].obs;
  RxString pu = "".obs;

  RxString textTrans1 = "".obs;
  RxString textTrans2 = "".obs;
  SpeechToText speechToText = SpeechToText();
  SpeechRecognition speech = SpeechRecognition();
  RxBool isListening = false.obs;
  RxBool newSpeech = false.obs;
  var service = BackgroundStt();

  RxBool lis = false.obs;
  RxBool speechEnabled = false.obs;
  RxString transText = ''.obs;
  @override
  void onReady() async {
    setTextOrigin("Hello, can you speak, alo alo alo. Can we solo yasuo?");
    speechEnabled.value = await speechToText.initialize(
      onStatus: (status) {
        if (status == "done" || status == "notListening") {
          stopListening();
        }
        // print(status);
      },
    );
    super.onReady();
  }

  //1
  void startListening({bool start = false, bool forced = false}) async {
    //   if (start) textResult.clear();
    newSpeech.value = true;
    isListening.value = true;
    currentIndexText = 0;
    await speechToText.listen(
      onResult: _onSpeechResult,
      listenFor: Duration(seconds: 10),
      pauseFor: Duration(seconds: 10),
    );
  }

  void stopListening() async {
    isListening.value = false;
    await speechToText.stop();
  }

  int currentIndexText = 0;
  void _onSpeechResult(SpeechRecognitionResult result) {
    // transText.value = result.recognizedWords;
    // print(result.recognizedWords);
    if (result.recognizedWords.isNotEmpty) {
      //   print("vao 1 ${result.recognizedWords} nhe");
      if (!newSpeech.value) {
        if (textResult.isEmpty) {
          //  print("vao 2");
          if (stringsToList(result.recognizedWords)[0].isNotEmpty) {
            //   print("vao 3");
            textResult.add(stringsToList(result.recognizedWords)[0]);
          }
        } else {
          List<String> textAdd = stringsToList(result.recognizedWords).sublist(
            currentIndexText, //textResult.length,
            stringsToList(result.recognizedWords).length,
          );
          // print("vao 4: ${textResult.length}, ${stringsToList(result.recognizedWords).length}   ${textAdd}");
          textResult.addAll(textAdd);
          currentIndexText += textAdd.length;
        }
      } else {
        // print("add moi:");
        currentIndexText = stringsToList(result.recognizedWords).length;
        textResult.addAll(stringsToList(result.recognizedWords));
      }
      newSpeech.value = false;
    }
  }

//2
  void startSpeech2() async {
    Navigator.push(
      Get.context!,
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: false,
        pageBuilder: (BuildContext context, _, __) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: DialogComponent(),
            // child: Container(),
          );
        },
      ),
    );
    await speech.listen();
    speech.setRecognitionCompleteHandler((text) {
      textTrans2.value = text.toString();
      //   print("ket qua ${textTrans2.value}");
      speech.cancel();
      // Navigator.pop(Get.context!);
    });
  }

  void setTextOrigin(String text) {
    pu.value = text;
    textResult.clear();
    textOrigin.value = stringsToList(text);
  }

  void clearTextSpeech() {
    textResult.clear();
  }

  List<String> stringsToList(String s) {
    List<String> data = [];
    data = s.split(" ");
    return data;
  }
}
