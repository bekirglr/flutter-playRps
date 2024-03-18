import 'dart:math';
import 'package:flutter/material.dart';

class Selection extends StatefulWidget {
  const Selection({super.key});

  @override
  State<Selection> createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  String result = '';
  String userChoice = '';
  String computerChoice = '';
  Color appBarTextColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("R-P-S Game",
            style: TextStyle(fontFamily: "PressStart2P", color: Colors.white)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Computer's Choice: $computerChoice",
            style: const TextStyle(fontFamily: "PressStart2P"),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: computerChoice == 'Rock'
                      ? Colors.blue
                      : null, // Bilgisayarın seçtiği renk
                ), // Buton işlevsiz hale getirildi
                child: Text("Rock (Bot)",
                    style: TextStyle(
                        fontFamily: "PressStart2P",
                        color: computerChoice == 'Rock' ? Colors.white : null)),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: computerChoice == 'Paper'
                      ? Colors.blue
                      : null, // Bilgisayarın seçtiği renk
                ), // Buton işlevsiz hale getirildi
                child: Text("Paper (Bot)",
                    style: TextStyle(
                        fontFamily: "PressStart2P",
                        color:
                            computerChoice == 'Paper' ? Colors.white : null)),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: computerChoice == 'Scissors'
                      ? Colors.blue
                      : null, // Bilgisayarın seçtiği renk
                ), // Buton işlevsiz hale getirildi
                child: Text("Scissors (Bot)",
                    style: TextStyle(
                        fontFamily: "PressStart2P",
                        color: computerChoice == 'Scissors'
                            ? Colors.white
                            : null)),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  result = '';
                  userChoice = ''; // Kullanıcının seçimini sıfırlama
                  computerChoice = ''; // Computer'ın seçimini sıfırlama
                  appBarTextColor = Colors.white;
                });
              },
              child: Text(result,
                  style: TextStyle(
                      fontFamily: "PressStart2P", color: appBarTextColor)),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Text(
            "Your's Choice: $userChoice",
            style: const TextStyle(fontFamily: "PressStart2P"),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _playGame("Rock"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: userChoice == 'Rock'
                      ? Colors.blue
                      : null, // Kullanıcının seçtiği renk
                ),
                child: Text("Rock",
                    style: TextStyle(
                        fontFamily: "PressStart2P",
                        color: userChoice == 'Rock' ? Colors.white : null)),
              ),
              const SizedBox(width: 15),
              ElevatedButton(
                onPressed: () => _playGame("Paper"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: userChoice == 'Paper'
                      ? Colors.blue
                      : null, // Kullanıcının seçtiği renk
                ),
                child: Text("Paper",
                    style: TextStyle(
                        fontFamily: "PressStart2P",
                        color: userChoice == 'Paper' ? Colors.white : null)),
              ),
              const SizedBox(width: 15),
              ElevatedButton(
                onPressed: () => _playGame("Scissors"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: userChoice == 'Scissors'
                      ? Colors.blue
                      : null, // Kullanıcının seçtiği renk
                ),
                child: Text("Scissors",
                    style: TextStyle(
                        fontFamily: "PressStart2P",
                        color: userChoice == 'Scissors' ? Colors.white : null)),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          //********** */
        ],
      ),
    );
  }

  void _playGame(String userChoice) {
    // Bilgisayarın rastgele bir seçim yapması için seçenekleri belirleyelim
    var choices = ['Rock', 'Paper', 'Scissors'];

    // Bilgisayarın rastgele bir seçim yapması için bir rastgele sayı oluşturalım
    var random = Random().nextInt(3);

    // Bilgisayarın seçtiği seçeneği belirleyelim
    var computerChoice = choices[random];

    // Bilgisayarın seçtiği seçeneği setState ile güncelleyelim
    setState(() {
      setState(() {
        this.userChoice = userChoice; // Kullanıcının seçimini güncelle
        this.computerChoice = computerChoice; // Bilgisayarın seçimini güncelle
      });
    });

    // Oyunun sonucunu kontrol edelim
    if (userChoice == computerChoice) {
      // Eğer kullanıcı ve bilgisayarın seçimi aynıysa, berabere durumu
      setState(() {
        result = 'It\'s a tie!';
        appBarTextColor = Colors.orange;
      });
    } else if ((userChoice == 'Rock' && computerChoice == 'Scissors') ||
        (userChoice == 'Paper' && computerChoice == 'Rock') ||
        (userChoice == 'Scissors' && computerChoice == 'Paper')) {
      // Eğer kullanıcı kazanırsa
      setState(() {
        result = 'You win!';
        appBarTextColor = Colors.green;
      });
    } else {
      // Eğer kullanıcı kaybederse
      setState(() {
        result = 'You lose!';
        appBarTextColor = Colors.red;
      });
    }
  }
}
