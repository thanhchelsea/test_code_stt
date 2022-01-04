import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogComponent extends StatelessWidget {
  const DialogComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: InkWell(
        onTap: (){
        },
        child:Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "KOOL",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: "SOFT",
                        style: TextStyle(
                          color: Colors.orangeAccent,
                          fontSize: 24,   fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Listening...",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
