import 'package:flutter/material.dart';
import 'package:truefalse/question.dart';
import 'question.dart';
import 'bzain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Bzain bzain = Bzain();

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Icon> score = [];
  // List<String> cauhoi = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.'
  // ];
  // List<bool> kq = [false, true, true];
  // Question q1 = Question(
  //     questext: 'You can lead a cow down stairs but not up stairs.',
  //     quesresuft: false);

  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 4,
            child: Center(
              child: Text(
                bzain.getquestiontext(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white, fontFamily: 'Pacifico', fontSize: 40),
              ),
            )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FlatButton(
            onPressed: () {
              bool resust = bzain.getquestionresuft();
              int num = bzain.getnum();
              if (resust == true) {
                print('true');
                score.add(const Icon(Icons.check, color: Colors.blueAccent));
              } else {
                print('false');
                score.add(const Icon(Icons.close, color: Colors.redAccent));
              }
              if (num == bzain.bank.length - 1) {
                Alert(
                  context: context,
                  type: AlertType.error,
                  title: "RFLUTTER ALERT",
                  desc: "Flutter is more awesome with RFlutter Alert.",
                  buttons: [
                    DialogButton(
                      child: const Text(
                        "COOL",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                      width: 120,
                    )
                  ],
                ).show();
              }
              setState(() {
                bzain.nextquestion();
              });
            },
            child: const Text(
              'true',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Pacifico', fontSize: 15),
            ),
            color: Colors.blueAccent,
          ),
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FlatButton(
            onPressed: () {
              bool resust = bzain.getquestionresuft();
              int num = bzain.getnum();
              if (resust == false) {
                print('true');
                score.add(const Icon(Icons.check, color: Colors.blueAccent));
              } else {
                print('false');
                score.add(const Icon(Icons.close, color: Colors.redAccent));
              }
              if (num == bzain.bank.length - 1) {
                Alert(
                  context: context,
                  type: AlertType.error,
                  title: "RFLUTTER ALERT",
                  desc: "Flutter is more awesome with RFlutter Alert.",
                  buttons: [
                    DialogButton(
                      child: const Text(
                        "Continue",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                      width: 120,
                    )
                  ],
                ).show();
              }
              setState(() {
                bzain.nextquestion();
              });
            },
            child: const Text(
              'flase',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Pacifico', fontSize: 15),
            ),
            color: Colors.redAccent,
          ),
        )),
        Container(
          margin: const EdgeInsets.all(20),
          height: 20,
          child: Row(
            children: score,
          ),
        )
      ],
    );
  }
}
