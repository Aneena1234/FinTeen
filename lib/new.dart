import 'package:flutter/material.dart';

class Question{
   late String questionText;
   late bool questionAnswer;
   Question({required String q, required bool a}){
    this.questionText = q;
    this.questionAnswer = a;
   }
}