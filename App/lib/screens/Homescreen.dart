import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:library_management/Widgets/home_body.dart';
class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Drawer(
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text('!NDIA'),
      ),
      bottomNavigationBar: GNav(rippleColor: Colors.grey.shade800, // tab button ripple color when pressed
          hoverColor: Colors.grey.shade700, // tab button hover color
          haptic: true, // haptic feedback
          tabBorderRadius: 15,
          tabActiveBorder: Border.all(color: Colors.black, width: 1), // tab button border
          tabBorder: Border.all(color: Colors.grey, width: 1), // tab button border
          tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
          curve: Curves.easeOutExpo, // tab animation curves
          duration: Duration(milliseconds: 300), // tab animation duration
          gap: 8, // the tab button gap between icon and text
          color: Colors.grey[800], // unselected icon color
          activeColor: Colors.white, // selected icon and text color
          iconSize: 24, // tab button icon size
          tabBackgroundColor: Colors.black, // selected tab background color
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5), // navigation bar padding
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
              onPressed: (){},
            ),
            GButton(
              icon: Icons.travel_explore,
              text: 'Travel with us',
              onPressed: (){},
            ),
            GButton(
              icon: Icons.chat,
              text: 'Chat bot',
              onPressed: () {
                  Get.toNamed('/chat-bot');
              }),
          ]),
        body: HomeBody(),
    );
  }

}