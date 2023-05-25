import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final Map argument;
  const ResultScreen({super.key, required this.argument});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

  @override
  void initState() {
    super.initState();
    print(widget.argument["answer"]);
  }

  @override
  Widget build(BuildContext context) {
    var answer = widget.argument["answer"] as List<bool>;
    int correctAnswer = answer.where((item) => item).length;
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width * 0.75,
                  maxWidth: MediaQuery.of(context).size.width * 0.9,
                  minHeight: MediaQuery.of(context).size.height * 0.25,
                  maxHeight: MediaQuery.of(context).size.height * 0.4
              ),
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircularProgressIndicator(
                        value:  (answer.length - correctAnswer) / answer.length,
                        strokeWidth: 10.0,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                        backgroundColor: Colors.green,
                      ),
                      Text(
                        'Your correct answer is $correctAnswer/${answer.length}',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Home'),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
