import 'package:flutter/material.dart';
import 'package:quis_kebangsaan/src/domain/entities/Topic.dart';

class QuestionScreen extends StatefulWidget {
  final Map argument;
  const QuestionScreen({super.key,required this.argument});


  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {

  @override
  void initState() {
    super.initState();
    print(widget.argument["topic"]);
    print(widget.argument["question_number"]);
    print(widget.argument["answer"]);
  }

  @override
  Widget build(BuildContext context) {
    var topic = widget.argument["topic"] as Topic;
    var questionNumber = widget.argument["question_number"] as int;
    var answer = widget.argument["answer"] as List<bool>;

    handleAnswer(bool correct) {
      if (answer.length<=questionNumber) {
        answer.add(correct);
      } else {
        answer[questionNumber] = correct;
      }
      var arg = {
        "topic" :topic,
        "question_number" : questionNumber + 1,
        "answer" : answer
      };
      if (questionNumber>=4) {
        Navigator.pushNamedAndRemoveUntil(
            context,
            '/',
            (route) {
              print(route);
              return route.isFirst;
            }
        );
      } else {
        Navigator.pushNamed(
            context,
            '/question',
            arguments: arg);
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz - ${topic.name}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width * 0.75,
                  maxWidth: MediaQuery.of(context).size.width * 0.9,
                  minHeight: MediaQuery.of(context).size.height * 0.35,
                  maxHeight: MediaQuery.of(context).size.height * 0.5
              ),
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/image1.png'),
                      const SizedBox(height: 8),
                      Text('This is a quiz question number ${questionNumber + 1}',
                          style: TextStyle(fontSize: 18)),
                    ],
                  ),
                )
              ),
            ),
            SizedBox(height: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  onPressed: () {
                    handleAnswer(true);
                  },
                  child: Text('Correct Answer',
                    style: TextStyle(fontSize: 18),),
                  minWidth: MediaQuery.of(context).size.width * 0.7,
                  height : 50,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  color: Colors.blue,
                ),
                SizedBox(height: 16),
                MaterialButton(
                  onPressed: () {
                    handleAnswer(false);
                  },
                  child: Text('Wrong Answer',
                    style: TextStyle(fontSize: 18),),
                  minWidth: MediaQuery.of(context).size.width * 0.7,
                  height : 50,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  color: Colors.blue,
                ),
                SizedBox(height: 16),
                MaterialButton(
                  onPressed: () {
                    handleAnswer(false);
                  },
                  child: Text('Wrong Answer',
                    style: TextStyle(fontSize: 18),),
                  minWidth: MediaQuery.of(context).size.width * 0.7,
                  height : 50,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  color: Colors.blue,
                ),
                SizedBox(height: 16),
                MaterialButton(
                  onPressed: () {
                    handleAnswer(false);
                  },
                  child: Text('Wrong Answer',
                    style: TextStyle(fontSize: 18),),
                  minWidth: MediaQuery.of(context).size.width * 0.7,
                  height : 50,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  color: Colors.blue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
