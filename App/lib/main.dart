import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management/screens/ChatBot.dart';
import 'package:library_management/screens/Homescreen.dart';
import 'package:library_management/screens/add_photos.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized(

  );
  await Firebase.initializeApp(

  ).then((value) => print("Complete"));
  runApp(MyApp());


}


class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/home',
        getPages: [
          GetPage(
              name: '/home',
              page: ()=>HomeScreen()
          ),
          GetPage(
              name: '/chat-bot',
              page: ()=>ChatBot()
          ),
          GetPage(
              name: '/addPhotos',
              page: ()=>Addphotos()
          ),
        ],
      theme: ThemeData(
          brightness: Brightness.dark),
          debugShowCheckedModeBanner: false,
    );
  }
}
