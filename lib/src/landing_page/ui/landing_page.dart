import 'package:flutter/material.dart';
import 'package:loyalty_card_web_app/src/login/ui/login.dart';
import 'package:loyalty_card_web_app/src/register/ui/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Loyal Customers"),
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0.0,
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ),
                  );
                },
                child: const Text("Log In")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SignUp(),
                    ),
                  );
                },
                child: const Text("Sign Up"))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.9,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/head.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                width: size.width,
                height: size.height * 0.7,
                color: Colors.grey[100],
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(flex: 1),
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.screen_lock_landscape,
                            size: 100,
                          ),
                          Text(
                            "Fully Responsive",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                              "This theme will look great on any device, no matter the size!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              )),
                        ],
                      ),
                    ),
                    Spacer(flex: 2),
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.book,
                            size: 100,
                          ),
                          Text(
                            "Bootstrap 4 Ready",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                              "Featuring the latest build of the new Bootstrap 4 framework!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              )),
                        ],
                      ),
                    ),
                    Spacer(flex: 2),
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.done_all_rounded,
                            size: 100,
                          ),
                          Text(
                            "Easy to Use",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                              "Ready to use with your own content, or customize the source files!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              )),
                        ],
                      ),
                    ),
                    Spacer(flex: 1),
                  ],
                ),
              ),
              Container(
                width: size.width,
                height: size.height * 0.8,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(flex: 1),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Fully Responsive Design",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                              "When you use a theme created by Start Bootstrap, you know that the theme will look great on any device, whether it's a phone, tablet, or desktop the page will behave responsively!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              )),
                        ],
                      ),
                    ),
                    Spacer(flex: 1),
                    Expanded(
                        flex: 5,
                        child: Image(
                          image: AssetImage("assets/images/showcase_1.jpg"),
                          width: double.maxFinite,
                          height: double.maxFinite,
                          fit: BoxFit.fill,
                        )),
                  ],
                ),
              ),
              Container(
                width: size.width,
                height: size.height * 0.8,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 5,
                        child: Image(
                          image: AssetImage("assets/images/showcase_2.jpg"),
                          width: double.maxFinite,
                          height: double.maxFinite,
                          fit: BoxFit.fill,
                        )),
                    Spacer(flex: 1),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Updated For Bootstrap 4",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                              "Newly improved, and full of great utility classes, Bootstrap 4 is leading the way in mobile responsive web development! All of the themes on Start Bootstrap are now using Bootstrap 4!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              )),
                        ],
                      ),
                    ),
                    Spacer(flex: 1),
                  ],
                ),
              ),
              Container(
                width: size.width,
                height: size.height * 0.8,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(flex: 1),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Easy to Use & Customize",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                              "Landing Page is just HTML and CSS with a splash of SCSS for users who demand some deeper customization options. Out of the box, just add your content and images, and your new landing page will be ready to go!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              )),
                        ],
                      ),
                    ),
                    Spacer(flex: 1),
                    Expanded(
                        flex: 5,
                        child: Image(
                          image: AssetImage("assets/images/showcase_3.jpg"),
                          width: double.maxFinite,
                          height: double.maxFinite,
                          fit: BoxFit.fill,
                        )),
                  ],
                ),
              ),
              Container(
                width: size.width,
                height: size.height * 0.8,
                color: Colors.grey[100],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "What people are saying...",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(flex: 1),
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(75.0),
                                child: const Image(
                                  image:
                                      AssetImage("assets/images/person_1.jpg"),
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const Text("Margaret E.",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              const Text(
                                  "This is fantastic! Thanks so much guys!",
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                            ],
                          ),
                        ),
                        const Spacer(flex: 1),
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(75.0),
                                child: const Image(
                                  image:
                                      AssetImage("assets/images/person_2.jpg"),
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const Text("Fred S.",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              const Text(
                                  "Bootstrap is amazing. I've been using it to create lots of super nice landing pages.",
                                  style: TextStyle(fontSize: 20)),
                            ],
                          ),
                        ),
                        const Spacer(flex: 1),
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(75.0),
                                child: const Image(
                                  image:
                                      AssetImage("assets/images/person_3.jpg"),
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const Text("Sarah W.",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              const Text(
                                  "Thanks so much for making these free resources available to us!",
                                  style: TextStyle(fontSize: 20)),
                            ],
                          ),
                        ),
                        const Spacer(flex: 1),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: size.width,
                height: size.height * 0.4,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/head.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Ready to get started? Sign up now!",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Container(
                width: size.width,
                height: size.height * 0.4,
                color: Colors.grey[100],
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(flex: 1),
                      Expanded(
                        flex: 7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: const Text("About")),
                                TextButton(
                                    onPressed: () {},
                                    child: const Text("Contact")),
                                TextButton(
                                    onPressed: () {},
                                    child: const Text("Terms of Use")),
                                TextButton(
                                    onPressed: () {},
                                    child: const Text("Privacy Policy"))
                              ],
                            ),
                            const Text(
                                "© Your Website 2024. All Rights Reserved.",
                                style: TextStyle(fontSize: 14))
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.snapchat)),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.facebook)),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.whatshot)),
                          ],
                        ),
                      )
                    ]),
              ),
            ],
          ),
        ));
  }
}
