import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizbrain.dart';

void main() {
  runApp(Trivia());
}

class Trivia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[800],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: QuizArea(),
          ),
        ),
      ),
    );
  }
}

class QuizArea extends StatefulWidget {
  @override
  _QuizAreaState createState() => _QuizAreaState();
}

class _QuizAreaState extends State<QuizArea> {
//  List<String> questions=['Delhi is the capital of India','Los Angeles is the capital of USA','Humans have a tail'];
//  List<bool> answers=[true,false,false];
  QuizBrain qBrain = QuizBrain();

  List<Icon> scoreKeeper = [];
  int i = 0;
  void quizFinished() {
    int s = qBrain.getScore();
    Alert(
        context: context,
        title: 'Trivia finished!',
        desc: 'Your score: $s',
        buttons: [
          DialogButton(
            child: Text(
              "Reset",
              style: TextStyle(color: Color(0xfffff580), fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: Colors.grey[800],
          )
        ]).show();
  }

  Icon rightAnswer() {
    return Icon(
      Icons.check,
      color: Colors.green,
    );
  }

  Icon wrongAnswer() {
    return Icon(
      Icons.close,
      color: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              qBrain.getQuestion(i),
              style: TextStyle(color: Color(0xfffff580), fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              child: Container(
                color: Colors.green,
                alignment: Alignment.center,
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
              onPressed: () {
                setState(() {
                  if (qBrain.getAnswer(i)) {
                    qBrain.increaseScore();
                    scoreKeeper.add(rightAnswer());
                  } else {
                    scoreKeeper.add(wrongAnswer());
                  }
                  if (i < (qBrain.getLength() - 1)) {
                    i++;
                  } else {
                    i = 0;
                    quizFinished();
                    scoreKeeper.clear();
                    qBrain.resetScore();
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              child: Container(
                color: Colors.red,
                alignment: Alignment.center,
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              onPressed: () {
                setState(() {
                  if (!(qBrain.getAnswer(i))) {
                    qBrain.increaseScore();
                    scoreKeeper.add(rightAnswer());
                  } else {
                    scoreKeeper.add(wrongAnswer());
                  }
                  if (i < (qBrain.getLength() - 1)) {
                    i++;
                  } else {
                    i = 0;
                    quizFinished();
                    scoreKeeper.clear();
                    qBrain.resetScore();
                  }
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
