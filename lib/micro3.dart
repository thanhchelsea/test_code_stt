// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:test_code/controller.dart';
// import 'package:test_code/micro_component.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// class Micro3Ui extends StatefulWidget {
//   const Micro3Ui({Key? key}) : super(key: key);
//
//   @override
//   _Micro3UiState createState() => _Micro3UiState();
// }
//
// class _Micro3UiState extends State<Micro3Ui> {
//   @override
//   Widget build(BuildContext context) {
//     return GetX<TextToSpeechController>(
//       builder: (controller) {
//         return Column(
//           children: [
//             Container(
//               margin: EdgeInsets.only(top: 20.w),
//               child: Text(
//                 "Speech To Text 3",
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.w800,
//                   color: Colors.deepPurple,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: MicroComponent(
//                 textTrans: controller.textTrans3.value,
//                 colorButton: Colors.orangeAccent,
//                 onTapSpeech: () {
//                   // controller.lis.value ? controller.stopListen():controller.startListen();
//                   controller.start3();
//                 },
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
