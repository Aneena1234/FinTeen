import 'new.dart';
class QuizBank{

int questionNumber = 0;
final List<Question> questionBank = [ 
  Question(q:  'Online banking is risk-free and doesn’t require any precautions.', a: false),
  Question(q:  'Taking out a loan always harms your credit score.', a: false),
  Question(q:  'Impulse buying can lead to poor financial decisions.', a: true),
  Question(q:  'You can lose money when you invest in stocks.', a: true),
  Question(q:  'All investments are risk-free', a: false),
];

 String getQuestionText(int questionNumber){
  return questionBank[questionNumber].questionText;
}

 bool getQuestionAnswer(int questionNumber){
  return questionBank[questionNumber].questionAnswer;
}
 }