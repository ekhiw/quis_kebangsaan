import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quis_kebangsaan/injection.dart';
import 'package:quis_kebangsaan/src/domain/entities/Topic.dart';
import 'package:quis_kebangsaan/src/presentation/bloc/dashboard/dashboard_bloc.dart';
import 'package:quis_kebangsaan/src/presentation/bloc/dashboard/dashboard_event.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainPageState();
}

class _MainPageState extends State<MainScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<DashboardBloc>()..add(InitDashboardEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Quiz"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/image1.png'),
            SizedBox(height: 16),
            Text('This is a quiz.'),
            SizedBox(height: 16),
            MaterialButton(
              onPressed: () {
                  Navigator.pushNamed(
                      context,
                      '/question',
                      arguments: const Topic(id: 0, name: "test", desc: "testtttttttt"));
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.share),
                    ),
                    const Text("Share")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.star),
                    ),
                    const Text("Rate us")
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
