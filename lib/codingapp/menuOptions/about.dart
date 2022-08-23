import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider/provider.dart';
import 'package:voltrac/codingapp/theme-storage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:voltrac/codingapp/drawer.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) => Scaffold(
              extendBodyBehindAppBar: true,
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      size: 50.0,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => Drawers(),
                        ),
                      );
                    },
                  ),
                ),
              ),
              backgroundColor: themeNotifier.isDark
                  ? Color.fromARGB(255, 16, 16, 16)
                  : Color.fromARGB(255, 204, 204, 204),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 120.0, vertical: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 5, top: 50),
                        child: Text(
                          translate("About.aboutpage"),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: themeNotifier.isDark
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                      Builder(
                          builder: (context) => IconButton(
                              icon: Image.asset('assets/volcano.png'),
                              iconSize: 150,
                              onPressed: null)),
                      Linkify(
                        onOpen: _onOpen,
                        text: translate("About.author"),
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                            color: themeNotifier.isDark
                                ? Colors.white
                                : Colors.black),
                        linkStyle: TextStyle(
                          color: themeNotifier.isDark
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  _launchURL(Uri.parse(
                                      'https://www.linkedin.com/in/yash-raj-bharti-5693b6183/'));
                                },
                                child: Text(
                                  "LinkedIn",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24,
                                      color: Color.fromARGB(255, 97, 146, 245)),
                                )),
                            GestureDetector(
                                onTap: () {
                                  _launchURL(Uri.parse(
                                      'https://twitter.com/YashRaj49744398'));
                                },
                                child: Text(
                                  ", Twitter",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24,
                                      color: Color.fromARGB(255, 97, 146, 245)),
                                )),
                            GestureDetector(
                                onTap: () {
                                  _launchURL(Uri.parse(
                                      'https://github.com/yashrajbharti'));
                                },
                                child: Text(
                                  ", Github",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24,
                                      color: Color.fromARGB(255, 97, 146, 245)),
                                )),
                            GestureDetector(
                                onTap: () {
                                  _launchURL(Uri.parse(
                                      'https://yashrajbharti.github.io/portfolio/'));
                                },
                                child: Text(
                                  ", Portfolio",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24,
                                      color: Color.fromARGB(255, 97, 146, 245)),
                                )),
                          ]),
                      Text(
                        translate("About.lab"),
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                            color: themeNotifier.isDark
                                ? Colors.white
                                : Colors.black),
                        textAlign: TextAlign.start,
                      ),
                      Transform.scale(
                          scale: 1.6,
                          child: Builder(
                              builder: (context) => IconButton(
                                  icon: Image.asset('assets/icons/logos.png'),
                                  iconSize: 580,
                                  onPressed: null))),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              translate("About.all"),
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Linkify(
                          onOpen: _onOpen,
                          text: translate("About.points"),
                          style: TextStyle(
                            color: themeNotifier.isDark
                                ? Colors.white
                                : Colors.black,
                            fontSize: 18,
                          ),
                          linkStyle: TextStyle(
                              color: themeNotifier.isDark
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 18),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.40,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    translate("About.learn"),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 15.0),
                                    child: Text(
                                      translate("About.check"),
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _launchURL(Uri.parse(
                                          'https://github.com/LiquidGalaxyLAB/VolTrac'));
                                    },
                                    child: Text(
                                      translate("About.github"),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color.fromARGB(
                                              255, 97, 146, 245)),
                                    ),
                                  ),
                                  Text(
                                    '\n',
                                    style: TextStyle(fontSize: 4),
                                    textAlign: TextAlign.start,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _launchURL(Uri.parse(
                                          'https://github.com/LiquidGalaxyLAB/VolTrac/Privacy_Policy.md'));
                                    },
                                    child: Text(
                                      translate("About.privacy"),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color.fromARGB(
                                              255, 97, 146, 245)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 160,
                              child: VerticalDivider(
                                color: Color.fromARGB(120, 74, 74, 74),
                                thickness: 1,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.40,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    translate("About.attribute"),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 15.0),
                                    child: Text(
                                      translate("About.resource"),
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _launchURL(Uri.parse(
                                          'https://www.flaticon.com'));
                                    },
                                    child: Text(
                                      translate("Flaticon | Freepik"),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color.fromARGB(
                                              255, 97, 146, 245)),
                                    ),
                                  ),
                                  Text(
                                    '\n',
                                    style: TextStyle(fontSize: 4),
                                    textAlign: TextAlign.start,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _launchURL(Uri.parse(
                                          'https://iconarchive.com/show/noto-emoji-travel-places-icons-by-google/42463-volcano-icon.html'));
                                    },
                                    child: Text(
                                      translate("Icon Archive"),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color.fromARGB(
                                              255, 97, 146, 245)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  Future<void> _onOpen(LinkableElement link) async {
    if (await canLaunchUrl(Uri.parse(link.url))) {
      await launchUrl(Uri.parse(link.url));
    } else {
      throw 'Could not launch $link';
    }
  }
}
