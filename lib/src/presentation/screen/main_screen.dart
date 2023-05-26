import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:quis_kebangsaan/src/presentation/bloc/dashboard/dashboard_bloc.dart';
import 'package:quis_kebangsaan/src/presentation/bloc/dashboard/dashboard_event.dart';
import 'package:quis_kebangsaan/src/presentation/bloc/dashboard/dashboard_state.dart';
import 'package:share_plus/share_plus.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainPageState();
}

class _MainPageState extends State<MainScreen> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<DashboardBloc>(context, listen: false)
            .add(InitDashboardEvent()),);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Quiz"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<DashboardBloc, DashboardState> (
              builder: (context, state) {
                return _buildPage(context,state);
              }
          ),
        )
    );
  }

  Widget _buildPage(BuildContext context, DashboardState state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/image1.png'),
          SizedBox(height: 16),
          Text('This is a quiz.'),
          SizedBox(height: 16),
          MaterialButton(
            onPressed: () {
              var topics = state is DashboardLoaded ? state.topics : null;
              if (topics != null) {
                var selectedTopic = topics[Random().nextInt(topics.length)];
                var arg = {
                  "topic" :selectedTopic,
                  "question_number" : 0,
                  "answer" : List<bool>.of([])
                };
                Navigator.pushNamed(
                    context,
                    '/question',
                    arguments: arg
                );
              }
            },
            child: Text('Play',
              style: TextStyle(fontSize: 20),),
            minWidth: 200,
            height : 50,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            color: Colors.blue,
          ),
          SizedBox(height: 16),
          OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/topics');
            },
            child: Text('Options'),
            style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.blue),
                backgroundColor: Colors.transparent,
                minimumSize: Size(200, 50)
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton.icon(
                onPressed: () {
                  Share.share('Halo, kuis kebangsaan passwordnya?');
                },
                icon:Icon(Icons.share),
                label: Text("Share"),
              ),
              TextButton.icon(
                onPressed: () {

                },
                icon:Icon(Icons.star),
                label: Text("Rate us"),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
