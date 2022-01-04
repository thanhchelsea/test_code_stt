//@dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_code/micro1.dart';
import 'package:test_code/micro2.dart';
import 'package:test_code/micro3.dart';

import 'controller.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Directionality(textDirection: TextDirection.ltr, child: child);
      },
      title: 'GNav',
      theme: ThemeData(
        primaryColor: Colors.grey[800],
      ),
      home: Example(),
    ));

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  var stt = Get.put(TextToSpeechController());
var homeC = Get.put(HomeController());
    List<Widget> _widgetOptions = <Widget>[
    Micro1Ui(),
    InputDocument(),
    // Micro3Ui(),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(360, 690),
        orientation: Orientation.portrait);
    return GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/home',
      getPages: [
        GetPage(
          name: '/home',
          page: () => GetX<HomeController>(
              builder: (controller) {
              return SafeArea(
                child: Scaffold(
                  backgroundColor: Colors.white,
                  body: Center(
                    child: _widgetOptions.elementAt(controller.selectedIndex.value),
                  ),
                  bottomNavigationBar: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          color: Colors.black.withOpacity(.1),
                        )
                      ],
                    ),
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                      child: GNav(
                        rippleColor: Colors.grey[300],
                        hoverColor: Colors.grey[100],
                        gap: 8,
                        activeColor: Colors.white,
                        iconSize: 24,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        duration: Duration(milliseconds: 400),
                        tabBackgroundColor: Colors.grey[100],
                        color: Colors.black,
                        tabs: [
                          GButton(
                            icon: Icons.wifi_tethering,
                            text: 'Micro',
                            backgroundColor: Colors.blue,
                          ),
                          GButton(
                            icon: Icons.article_outlined,
                            text: 'Document',
                            backgroundColor: Colors.red,
                          ),
                          // GButton(
                          //   icon: Icons.mic_none,
                          //   text: 'micro 3',
                          //   backgroundColor: Colors.orangeAccent,
                          // ),
                        ],
                        selectedIndex: controller.selectedIndex.value,
                        onTabChange: (index) {
                          controller.changeIndex(index);
                        },
                      ),
                    ),
                  ),
                ),
              );
            }
          ),
        ),
      ],
    );
  }
}

class HomeController extends GetxController{
  RxInt selectedIndex = 0.obs;
  void changeIndex(int index){
    selectedIndex.value = index;
  }
}
