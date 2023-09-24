import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:library_management/main.dart';

class HomeBody extends StatefulWidget{
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final List<String> imagList = [
    'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
    'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
    'https://images.unsplash.com/photo-1586951144438-26d4e072b891?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586953983027-d7508a64f4bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
  ];
  late VideoPlayerController videoPlayerController;
   @override
  void initState() {
     super.initState();
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse('https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4'))
      ..initialize().then((_) {
        videoPlayerController.setLooping(true);
        videoPlayerController.play();
        setState(() {});
      });
   }
  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.black,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(6),
                     color: Colors.black
                   ),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        autoPlay: true
                      ),
                      items: imagList.map((item) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                             child: Center(
                              child: Image.network(item, fit: BoxFit.cover, width: 1000)),
                        ),
                      )).toList(),
                    )),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height:400,
                  width: 315,
                    decoration: BoxDecoration(
                     color: Colors.black
                    ),
                    child: Stack(
                    children: <Widget>[
                           VideoPlayer(videoPlayerController),
                           Padding(
                             padding: EdgeInsets.fromLTRB(28, 180, 0, 0),
                             child: AnimatedTextKit(
                               repeatForever: true,
                               animatedTexts: [
                                 TyperAnimatedText('Me Harsh ki Girlfriend Hu!',
                                     textStyle:TextStyle(
                                       fontSize: 20,
                                       fontWeight: FontWeight.w400,
                                       wordSpacing: 2
                                     ) ),
                               ],
                             ),
                           ),
                           Padding(
                             padding: EdgeInsets.fromLTRB(97, 205, 0, 0),
                             child: ElevatedButton(
                               style: ElevatedButton.styleFrom(
                                 elevation: double.infinity,
                                backgroundColor: Colors.greenAccent
                               ),
                               onPressed: () {
                                   Get.toNamed('/addPhotos');
                               },
                               child: Text("Know More"),
                             ),
                           )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}