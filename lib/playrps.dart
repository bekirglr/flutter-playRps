import 'package:flutter/material.dart';
import 'package:playrps/selection.dart';

class PlayRps extends StatefulWidget {
  const PlayRps({Key? key}) : super(key: key);

  @override
  State<PlayRps> createState() => _PlayRpsState();
}

class _PlayRpsState extends State<PlayRps> {
  String infom =
      "This application will allow the user to play rock-paper-scissors against a bot. The bot will randomly choose one of three options.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        title:
            const Text("WELCOME", style: TextStyle(fontFamily: "PressStart2P")),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Image.asset("assets/rps.gif"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: Text(infom,
                  style: const TextStyle(fontFamily: "PressStart2P")),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 1000),
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      Selection(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    var begin = Offset(0.0, -1.0);
                    var end = Offset.zero;
                    var curve = Curves.easeInOut;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));

                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                ),
              );
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              fixedSize: Size.fromRadius(
                MediaQuery.of(context).size.height * 0.06,
              ),
            ),
            child:
                const Text("GO!", style: TextStyle(fontFamily: "PressStart2P")),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.0,
          )
        ],
      ),
    );
  }
}
