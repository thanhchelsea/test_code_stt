import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_code/controller.dart';
import 'package:test_code/list_texts.dart';

import 'dialog_listen.dart';

class MicroComponent extends StatefulWidget {
  List<String> textSpeech;
  List<String>  textOrigin;
  Function onTapSpeech;
  Color colorButton;
  bool isListen ;
  MicroComponent({
    required this.textSpeech,
    required this.textOrigin,
    required this.onTapSpeech,
    required this.colorButton,required this.isListen,
  });

  @override
  _MicroComponentState createState() => _MicroComponentState();
}

class _MicroComponentState extends State<MicroComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(flex: 2, child: itemMico()),
        Expanded(flex: 3, child: ListText(
          textsSpeech: widget.textSpeech,
          textsOrigin: widget.textOrigin,
          lengthSpeech: widget.textOrigin.length,
          onTapUndo: (){
            Get.find<TextToSpeechController>().clearTextSpeech();
          },
        )),
      ],
    );
  }

  Widget itemMico() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          child: AvatarGlow(
            animate: widget.isListen,
            glowColor: widget.colorButton,
            endRadius: 80.0.h,
            duration: Duration(milliseconds: 2000),
            repeatPauseDuration: Duration(milliseconds: 100),
            repeat: true,
            child:Container(
              width: 80.w,height: 80.w,
              child: FloatingActionButton(
                backgroundColor: widget.colorButton,
                child: Icon(Icons.mic ,size: 40,),
                onPressed: () {
                 widget.onTapSpeech();
                },
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 40.h,
          child: Text(
            widget.isListen ? "Listening..." : "Tap to speech",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: widget.isListen ? Colors.red:null,
            ),
          ),
        ),
      ],
    );
  }

  // Widget itemTextTrans(String textTrans) {
  //   return Container(
  //     margin: EdgeInsets.only(bottom: 16.h, left: 16.h, right: 16.h),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(12),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.grey.withOpacity(0.4),
  //           spreadRadius: 1,
  //           blurRadius: 5,
  //           offset: Offset(2, 3), // changes position of shadow
  //         ),
  //       ],
  //     ),
  //     width: double.infinity,
  //     child: Container(
  //       padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 12.h),
  //       child: Column(
  //         children: [
  //           SizedBox(height: 12.h),
  //           Text(
  //             textTrans,
  //             style: TextStyle(
  //               fontSize: 16.sp,
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
