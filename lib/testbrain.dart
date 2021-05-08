import 'questions.dart';

class TestBrain {
  int _questionNum = 0;

  List<Question> _questionBank = [
    Question(
      'Do you love Programming? ',
      true,
    ),
    Question(
      'Do you get angry ?',
      false,
    ),
    Question(
      'Do you have girlfriend? ',
      false,
    ),
    Question(
      'Do you love music? ',
      true,
    ),
    Question(
      'Do you respect others? ',
      true,
    ),
    Question(
      ' Are you a rapper ?',
      true,
    ),
  ];

  void getNextQuestion() {
    if (_questionNum < _questionBank.length - 1) {
      _questionNum++;
    }
  }

  String getNextQuestionText(){

    return  _questionBank[_questionNum].questionText;

  }

  bool isFinished(){

    if(_questionNum >= _questionBank.length-1){

      return true;

    }
    else{

      return false;
    }


  }

  bool getNextQuestionAnswer(){

    return _questionBank[_questionNum].questionAnswer;
  }


  void reset(){

    _questionNum =0;

  }

}
