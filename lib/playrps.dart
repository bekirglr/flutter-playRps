import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        title: Text("WELCOME", style: GoogleFonts.pressStart2p()),
      ),
      body: Column(
        children: [
          SizedBox(
              child: Image.asset("rps.gif"),
              height: MediaQuery.of(context).size.height * 0.5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: Text(infom, style: GoogleFonts.pressStart2p(fontSize: 12)),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          TextButton(
            onPressed: () => {},
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              fixedSize: Size.fromRadius(
                MediaQuery.of(context).size.height * 0.06,
              ),
            ),
            child: Text("GO!", style: GoogleFonts.pressStart2p(fontSize: 15)),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.0,
          )
        ],
      ),
    );
  }
}
