import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piano_app/data/sounds_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String name = '.';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: MediaQuery.of(context).size.width < 600
            ? Center(child: Slide())
            : SafeArea(
                child: Container(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                      child: Text(name, style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        height: MediaQuery.of(context).size.height / 1.8,
                        child: Stack(
                          children: [
                            Container(
                              width: 40 * 35,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: WhiteButton.length,
                                itemBuilder: (context, index) {
                                  return Containers_Numbering_Button(context, WhiteButton[index].name,
                                      WhiteButton[index].audio,
                                      index);
                                },
                              ),
                            ),
                            SizedBox(
                                height: MediaQuery.of(context).size.height / 3,
                                width: 40 * 35,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: BlackButtonList.length,
                                  itemBuilder: (contex, index) {
                                    return Black_Button(
                                        context,
                                        BlackButtonList[index].margin,
                                        BlackButtonList[index].name,
                                        BlackButtonList[index].audio,
                                        index);
                                  },
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )));
  }

  Widget Black_Button(
      BuildContext context, double left, String text, String audio, int index) {
    return InkWell(
      onTap: () {
        final player = AudioPlayer();
        player.play(
          AssetSource(BlackButtonList[index].audio),
        );
        setState(() {
          name = BlackButtonList[index].name;
        });
      },
      hoverColor: Colors.greenAccent,
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        width: 20,
        margin: EdgeInsets.only(left: left),
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 2,
                  spreadRadius: 2,
                  offset: Offset.zero),
            ],
            border: Border.all(
                color: Colors.black,
                width: 1.0,
                style: BorderStyle.solid,
                strokeAlign: BorderSide.strokeAlignInside),
            color: Colors.black,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(8),
                bottomLeft: Radius.circular(8))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 30),
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget Slide() {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/rotateScreen.jpg'),
        )),
      ),
    );
  }
  Widget Containers_Numbering_Button(
      BuildContext context, String text, String audio, int index) {
    return InkWell(
      onTap: () {
        final player = AudioPlayer();
        player.play(AssetSource(audio));
        setState(() {
          name = WhiteButton[index].name;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: 40,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 2,
                  spreadRadius: 2,
                  offset: Offset.zero),
            ],
            border: Border.all(
                color: Colors.black,
                width: 1.0,
                style: BorderStyle.solid,
                strokeAlign: BorderSide.strokeAlignInside),
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(8),
                bottomLeft: Radius.circular(8))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: Text(
                text,
                style: const TextStyle(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
