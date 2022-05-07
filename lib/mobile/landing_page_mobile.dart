import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:paulina_knop/components.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({Key? key}) : super(key: key);

  @override
  _LandingPageMobileState createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
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

  var logger = Logger();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
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
        body: ListView(
          children: [
            //Intro, First section
            CircleAvatar(
              radius: 117.0,
              backgroundColor: Colors.tealAccent,
              child: CircleAvatar(
                radius: 113.0,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 110.0,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/image-circle.png"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.tealAccent,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0))),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: SansBold("Hello I'm", 15.0),
                      ),
                      SansBold("Paulina Knop", 40.0),
                      Sans("Flutter developer", 20.0),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 3.0,
                        children: [
                          Icon(Icons.email),
                          Icon(Icons.call),
                          Icon(Icons.location_pin),
                        ],
                      ),
                      SizedBox(width: 40.0),
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 9.0,
                        children: [
                          Sans("paulinaknop@gmail.com", 15.0),
                          Sans("+48 942 564 985", 15.0),
                          Sans("13/3, Szczecin, Poland", 15.0),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 90.0),
            //About me, Second section

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SansBold("About me", 35.0),
                  Sans(
                      "Hello! I'm Paulina Knop I specialize in flutter development",
                      15.0),
                  Sans(
                      "I strive to ensure astounding performance with state of ",
                      15.0),
                  Sans("the art security for Android, Ios, Web, Mac,Linux",
                      15.0),
                  SizedBox(height: 10.0),
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
            SizedBox(height: 60.0),
            //Third section What I do?
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SansBold("What I do?", 35.0),
                AnimatedCard(
                  imagePath: "assets/webL.png",
                  text: "Web development",
                  width: 300.0,
                ),
                SizedBox(height: 35.0),
                AnimatedCard(
                  imagePath: "assets/app.png",
                  text: "App development",
                  fit: BoxFit.contain,
                  reverse: true,
                  width: 300.0,
                ),
                SizedBox(height: 35.0),
                AnimatedCard(
                  imagePath: "assets/firebase.png",
                  text: "Back-end development",
                  width: 300.0,
                ),
                SizedBox(height: 60.0),
                //Contact Forth section
                Form(
                  key: formKey,
                  child: Wrap(
                    runSpacing: 20.0,
                    spacing: 20.0,
                    alignment: WrapAlignment.center,
                    children: [
                      SansBold("Contact me", 35.0),
                      TextForm(
                        text: "First Name",
                        containerWidth: widthDevice / 1.4,
                        hintText: "Please type first name",
                        controller: _firstNameController,
                        validator: (text) {
                          if (text.toString().isEmpty) {
                            return "First name is required";
                          }
                        },
                      ),
                      TextForm(
                        text: "Last name",
                        containerWidth: widthDevice / 1.4,
                        hintText: "Please type last name",
                        controller: _lastNameController,
                      ),
                      TextForm(
                          text: "Email",
                          containerWidth: widthDevice / 1.4,
                          hintText: "Please type email address",
                          controller: _emailController,
                          validator: (text) {
                            if (text.toString().isEmpty) {
                              return "Email is required";
                            }
                          }),
                      TextForm(
                        text: "Phone number",
                        containerWidth: widthDevice / 1.4,
                        hintText: "Please type you phone number",
                        controller: _phoneController,
                      ),
                      TextForm(
                        text: "Message",
                        containerWidth: widthDevice / 1.4,
                        hintText: "Message",
                        maxLines: 10,
                        controller: _messageController,
                        validator: (text) {
                          if (text.toString().isEmpty) {
                            return "Message is required";
                          }
                        },
                      ),
                      MaterialButton(
                        onPressed: () async {
                          logger.d(_firstNameController.text);
                          final addData = new AddDataFirestore();
                          if (formKey.currentState!.validate()) {
                            if (await addData.addResponse(
                                _firstNameController.text,
                                _lastNameController.text,
                                _emailController.text,
                                _phoneController.text,
                                _messageController.text)) {
                              // formKey.currentState!.reset();
                              DialogError(context, "Message sent successfully");
                            } else {
                              DialogError(context, "Message failed to sent");
                            }
                          }
                        },
                        elevation: 20.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        height: 60.0,
                        minWidth: widthDevice / 2.2,
                        color: Colors.tealAccent,
                        child: SansBold("Submit", 20.0),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            )
          ],
        ),
      ),
    );
  }
}
