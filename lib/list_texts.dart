import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListText extends StatelessWidget {
  List<String> textsOrigin;
  List<String> textsSpeech;
  Function onTapUndo;
  int lengthSpeech;

  ListText({
    required this.textsOrigin,
    required this.textsSpeech,
    required this.lengthSpeech,
    required this.onTapUndo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Stack(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16.w),
              child: SingleChildScrollView(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: List.generate(
                      textsOrigin.length,
                      (index) {
                        Color colorText = Colors.black;
                        if (textsSpeech.length <= index) {
                          colorText = Colors.black;
                        } else {
                          if (checkSameWord(
                              textsOrigin[index], textsSpeech[index],
                              index: index)) {
                            colorText = Color(0xff78e08f);
                          } else
                            colorText = Color(0xffFC427B);
                        }
                        // if (index == textsSpeech.length && index != 0) {
                        //   colorText = Color(0xff4a69bd);
                        // }
                        return WidgetSpan(
                          child: Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: 2.w, vertical: 8.w),
                            child: Stack(
                              overflow: Overflow.visible,
                              alignment: Alignment.center,
                              children: [
                                index == textsSpeech.length
                                    ? Positioned(
                                        child: Container(
                                          child: Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.amber,
                                          ),
                                        ),
                                        top: -14.h,
                                      )
                                    : Container(
                                        width: 0,
                                        height: 0,
                                      ),
                                Text(
                                  textsOrigin[index],
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w800,
                                    color: colorText,
                                    decoration: colorText == Color(0xffFC427B)
                                        ? TextDecoration.underline
                                        : TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 16.h,
            right: 16.h,
            child: InkWell(
              onTap: () {
                onTapUndo();
              },
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, offset: Offset(1, 1)),
                    ]),
                child: Icon(
                  Icons.undo,
                  color: Colors.amber,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool checkSameWord(String w1, String w2, {required int index}) {
    String t1 = w1.replaceAll(RegExp(r"[^\s\w]"), "");
    String t2 = w2.replaceAll(RegExp(r"[^\s\w]"), "");
    bool check = false;
    check = t1.toLowerCase() == t2.toLowerCase();
    // if (!check) {
    //   List<String> tFake = [];
    //   if (index == 0)
    //     tFake = textsSpeech.sublist(0, 1);
    //   else {
    //     if (index == textsSpeech.length - 2) {
    //       tFake = textsSpeech.sublist(index, index + 1);
    //     } else
    //       tFake = textsSpeech.sublist(index - 1, index + 1);
    //   }
    //
    //   return tFake.contains(w1);
    // }
    return check;
  }
}
