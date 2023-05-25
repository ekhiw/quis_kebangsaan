import 'package:flutter/material.dart';
import 'package:quis_kebangsaan/src/domain/entities/Topic.dart';

class QuestionScreen extends StatefulWidget {
  final Topic argument;
  const QuestionScreen({super.key,required this.argument});


  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {

  @override
  void initState() {
    super.initState();
    print(widget.argument);
    // Future.microtask(() =>
    //     Provider.of<ArticleCategoryBloc>(context, listen: false)
    //         .add(FetchArticleCategory(widget.category)),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
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
                      Text('This is a quiz question.This is a quiz question.This is a quiz question.This is a quiz question.',
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
                  onPressed: () {},
                  child: Text('Option 1',
                    style: TextStyle(fontSize: 18),),
                  minWidth: MediaQuery.of(context).size.width * 0.7,
                  height : 50,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  color: Colors.blue,
                ),
                SizedBox(height: 16),
                MaterialButton(
                  onPressed: () {},
                  child: Text('Option 2',
                    style: TextStyle(fontSize: 18),),
                  minWidth: MediaQuery.of(context).size.width * 0.7,
                  height : 50,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  color: Colors.blue,
                ),
                SizedBox(height: 16),
                MaterialButton(
                  onPressed: () {},
                  child: Text('Option 3',
                    style: TextStyle(fontSize: 18),),
                  minWidth: MediaQuery.of(context).size.width * 0.7,
                  height : 50,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  color: Colors.blue,
                ),
                SizedBox(height: 16),
                MaterialButton(
                  onPressed: () {},
                  child: Text('Option 4',
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
