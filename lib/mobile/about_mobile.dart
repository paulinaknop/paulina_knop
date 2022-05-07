import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({Key? key}) : super(key: key);

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  tealContainer(String text) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.tealAccent,
            style: BorderStyle.solid,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(5.0)),
      padding: EdgeInsets.all(7.0),
      child: Text(
        text,
        style: GoogleFonts.openSans(fontSize: 15.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(size: 35.0, color: Colors.black),
        ),
        endDrawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DrawerHeader(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2.0, color: Colors.black)),
                  child: Image.asset(
                    'assets/profile2-circle.png',
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
              TabsMobile(text: "Home", route: '/'),
              SizedBox(height: 20.0),
              TabsMobile(text: "Works", route: '/works'),
              SizedBox(height: 20.0),
              TabsMobile(text: "Blog", route: '/blog'),
              SizedBox(height: 20.0),
              TabsMobile(text: "About", route: '/about'),
              SizedBox(height: 20.0),
              TabsMobile(text: "Contact", route: '/contact'),
              SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () async =>
                        await launch("https://www.instagram.com/tomcruise"),
                    icon: SvgPicture.asset(
                      "assets/instagram.svg",
                      color: Colors.black,
                      width: 35.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () async =>
                        await launch("https://www.twitter.com/tomcruise"),
                    icon: SvgPicture.asset(
                      "assets/twitter.svg",
                      color: Colors.black,
                      width: 35.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () async =>
                        await launch("https://www.github.com/paulinaknop"),
                    icon: SvgPicture.asset(
                      "assets/github.svg",
                      color: Colors.black,
                      width: 35.0,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              //Introduction, first section
              CircleAvatar(
                radius: 117.0,
                backgroundColor: Colors.tealAccent,
                child: CircleAvatar(
                  radius: 113.0,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 110.0,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      "assets/profile2-circle.png",
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold("About me", 35.0),
                    SizedBox(height: 10.0),
                    Sans(
                        "Hello! I'm Paulina Knop I specialize in flutter development",
                        15.0),
                    Sans(
                        "I strive to ensure astounding performance with state of ",
                        15.0),
                    Sans("the art security for Android, Ios, Web, Mac,Linux",
                        15.0),
                    SizedBox(height: 15.0),
                    Wrap(
                      spacing: 7.0,
                      runSpacing: 7.0,
                      children: [
                        tealContainer("Flutter"),
                        tealContainer("Firebase"),
                        tealContainer("Android"),
                        tealContainer("Windows"),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 40.0),

              //Web development, second section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedCard(
                    imagePath: "assets/webL.png",
                    width: 200.0,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  SansBold("Web development", 20.0),
                  SizedBox(height: 10.0),
                ],
              ),
              Sans(
                  "I'm here to build your presence online with state of the art web apps",
                  15.0),

              //App development, third section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  AnimatedCard(
                    imagePath: "assets/app.png",
                    width: 200.0,
                    reverse: true,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  SansBold("App development.", 20.0),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
              Sans(
                  "Do you need a high-performance, responsive and beautiful app? Don't worry, I've got you covered.",
                  15.0),

              //Back end development, forth section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  AnimatedCard(
                    imagePath: "assets/firebase.png",
                    width: 200.0,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  SansBold("Back-end development.", 20.0),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
              Sans(
                  "Do you want your back-end to be highly scalable and secure? Let's have a conversation on how I can help you with that.",
                  15.0),
              SizedBox(
                height: 20.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
