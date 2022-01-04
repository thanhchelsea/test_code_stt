import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_code/controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_code/main.dart';

class InputDocument extends StatefulWidget {
  @override
  _InputDocumentState createState() => _InputDocumentState();
}

class _InputDocumentState extends State<InputDocument> {
  TextEditingController editingController = TextEditingController();

  @override
  void initState() {
    editingController.text = (Get.find<TextToSpeechController>().pu.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 22.h),
              child: TextFormField(
                minLines: 1,
                maxLines: 5,
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.multiline,
                controller: editingController,
                decoration: InputDecoration(
                  hintText: "Type document...",
                  border: InputBorder.none,
                ),
                style: TextStyle(),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          FloatingActionButton.extended(
            onPressed: () {
              if (editingController.text.trim().isNotEmpty) {
                Get.find<TextToSpeechController>()
                    .setTextOrigin(editingController.text.trim());
                Get.find<HomeController>().changeIndex(0);
              }
            },
            icon: Icon(Icons.arrow_back_outlined),
            label: Text("Speech To Text"),
          ),
        ],
      ),
    );
  }
}
