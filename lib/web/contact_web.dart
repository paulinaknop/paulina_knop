import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';
import 'package:paulina_knop/components.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWeb extends StatefulWidget {
  const ContactWeb({Key? key}) : super(key: key);

  @override
  State<ContactWeb> createState() => _ContactWebState();
}

class _ContactWebState extends State<ContactWeb> {
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
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 72.0,
              backgroundColor: Colors.tealAccent,
              child: CircleAvatar(
                radius: 70.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/image.png"),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            SansBold("Paulina Knop", 30.0),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () async {
                      await launch("https://www.instagram.com/tomcruise");
                    },
                    icon: SvgPicture.asset(
                      "assets/instagram.svg",
                      color: Colors.black,
                      width: 35.0,
                    )),
                IconButton(
                    onPressed: () async {
                      await launch("https://www.twitter.com/tomcruise");
                    },
                    icon: SvgPicture.asset(
                      "assets/twitter.svg",
                      color: Colors.black,
                      width: 35.0,
                    )),
                IconButton(
                    onPressed: () async {
                      await launch("https://www.github.com/paulinaknop");
                    },
                    icon: SvgPicture.asset(
                      "assets/github.svg",
                      color: Colors.black,
                      width: 35.0,
                    )),
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 500.0,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(size: 25.0, color: Colors.black),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/contact_image.jpg",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
              title: Row(
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  TabsWeb(
                    title: "Home",
                    route: '/',
                  ),
                  Spacer(),
                  TabsWeb(
                    title: "Works",
                    route: '/works',
                  ),
                  Spacer(),
                  TabsWeb(
                    title: "Blog",
                    route: '/blog',
                  ),
                  Spacer(),
                  TabsWeb(
                    title: "About",
                    route: '/about',
                  ),
                  Spacer(),
                  TabsWeb(
                    title: 'Contact',
                    route: '/contact',
                  ),
                  Spacer()
                ],
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 30.0),
                SansBold("Contact me", 40.0),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        TextForm(
                          text: "First Name",
                          containerWidth: 350.0,
                          hintText: "Please type first name",
                          controller: _firstNameController,
                          validator: (text) {
                            if (text.toString().isEmpty) {
                              return "First name is required";
                            }
                          },
                        ),
                        SizedBox(height: 15.0),
                        TextForm(
                            text: "Email",
                            containerWidth: 350.0,
                            hintText: "Please type email address",
                            controller: _emailController,
                            validator: (text) {
                              if (text.toString().isEmpty) {
                                return "Email is required";
                              }
                            }),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextForm(
                          text: "Last Name",
                          containerWidth: 350.0,
                          hintText: "Please type last name",
                          controller: _lastNameController,
                        ),
                        SizedBox(height: 15.0),
                        TextForm(
                          text: "Phone number",
                          containerWidth: 350.0,
                          hintText: "Please type phone number",
                          controller: _phoneController,
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                TextForm(
                  text: "Message",
                  containerWidth: widthDevice / 1.5,
                  hintText: "Please type your message",
                  maxLines: 10,
                  controller: _messageController,
                  validator: (text) {
                    if (text.toString().isEmpty) {
                      return "Message is required";
                    }
                  },
                ),
                SizedBox(height: 20.0),
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
                        formKey.currentState!.reset();
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
                  minWidth: 200.0,
                  color: Colors.tealAccent,
                  child: SansBold("Submit", 20.0),
                ),
                SizedBox(height: 10.0)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
