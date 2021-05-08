import 'package:flutter/material.dart';
import 'package:simpletest/testbrain.dart';

void main()=> runApp(SimpleTest(),);

TestBrain _testBrain = new TestBrain();


class SimpleTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        appBar: AppBar(title: Text('SIMPLE TEST'),),
        body: QuizPage(),
      ),
    );

  }
}


class QuizPage extends StatefulWidget {



  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Widget> icons =[];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          Expanded(
              flex: 5,
              child: Center(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _testBrain.getNextQuestionText(),),
              ),),),

          Expanded(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              child: Text("Yo homie"),
              onPressed: (){

                setState(() {
                  checkAnswer(true);

                });
              },color: Colors.pink, ),
          ),),
          Expanded(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              child: Text("Nah homie"),
              onPressed: (){

                setState(() {
                  checkAnswer(false);
                });
              },color: Colors.blue, ),
          ),),

          Expanded(
            child: Row(
              children: icons,
            ),
          ),

        ],
      ),
    );
  }

void checkAnswer( bool userPickedAnswer){

    bool correctAnswer = _testBrain.getNextQuestionAnswer();

    setState(() {
      if(_testBrain.isFinished()== true){

        _testBrain.reset();
        icons =[];
      }

      else{
        if(  userPickedAnswer == correctAnswer) {
          print("Correct");
      icons.add(Icon(Icons.ac_unit,color: Colors.tealAccent,),);
        }else{

          print("wrong");
          icons.add(Icon(Icons.sanitizer,color: Colors.amber,),);
        }
      }
    });


    _testBrain.getNextQuestion();

}

}

