import 'package:flutter/material.dart';

import 'question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

int num = 0;

class Bzain {
  List<Question> bank = [
    Question(
        questext: 'You can lead a cow down stairs but not up stairs.',
        quesresuft: false),
    Question(
        questext: 'Approximately one quarter of human bones are in the feet.',
        quesresuft: true),
    Question(questext: 'A slug\'s blood is green.', quesresuft: true),
    Question(
        questext: 'Buzz Aldrin\'s mother\'s maiden name was "Moon".',
        quesresuft: true),
    Question(
        questext: 'It is illegal to pee in the Ocean in Portugal.',
        quesresuft: true),
    Question(
        questext:
            'No piece of square dry paper can be folded in half more than 7 times.',
        quesresuft: false),
    Question(
        questext:
            'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        quesresuft: true),
    Question(
        questext:
            'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        quesresuft: false),
    Question(
        questext:
            'The total surface area of two human lungs is approximately 70 square metres.',
        quesresuft: true),
    Question(
        questext: 'Google was originally called "Backrub".', quesresuft: true),
    Question(
        questext:
            'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        quesresuft: true),
    Question(
        questext:
            'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        quesresuft: true)
  ];

  void nextquestion() {
    if (num < bank.length - 1) {
      num++;
    }
    var context;
  }

  String getquestiontext() {
    return bank[num].questext;
  }

  bool getquestionresuft() {
    return bank[num].quesresuft;
  }

  int getnum() {
    return num;
  }
}
