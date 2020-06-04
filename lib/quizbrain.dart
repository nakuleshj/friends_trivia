import 'question.dart';
class QuizBrain{
  int _score;
  List<Question> _qBank=[
    Question('Monica\'s grandmother used to live in Monica\'s apartment.',true),
    Question('Joey dresses up as a priest to officiate Monica and Chandler\'s wedding.',false),
    Question('Phoebe, the musician in the group, is known for playing the bongo drums.',false),
    Question('In the pilot, Rachel watches a rerun of Joanie and Chachi\'s wedding.',true),
    Question('Ross is an anthropologist in the series.',false),
    Question('You always knew Janice was around when you heard her signature phrase: "Oh ... my ... God!"',true),
    Question('Monica dances with a raw turkey on her head during a Thanksgiving episode.',true),
    Question('Rachel has one item in the kitchen that belongs to her, a bottle opener.',true),
    Question('In one episode, Phoebe thought her mom had reincarnated as a dog.',false),
    Question('After Monica\'s dad ruins her childhood possessions, he gives her a Porsche as a way of apologizing.',true)
  ];
  QuizBrain(){
    _score=0;
  }
  String getQuestion(int qNumber){
    return _qBank[qNumber].questionText;
  }
  bool getAnswer(int qNumber){
    return _qBank[qNumber].questionAnswer;
  }
  int getLength(){
    return _qBank.length;
  }
  int increaseScore(){
    _score++;
    return _score;
  }
  int resetScore(){
    return _score=0;
  }
  int getScore(){
    return _score;
  }
}