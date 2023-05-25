import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:quis_kebangsaan/injection.dart';
import 'package:quis_kebangsaan/src/domain/entities/Topic.dart';
import 'package:quis_kebangsaan/src/presentation/bloc/dashboard/dashboard_bloc.dart';
import 'package:quis_kebangsaan/src/presentation/bloc/dashboard/dashboard_event.dart';
import 'package:quis_kebangsaan/src/presentation/bloc/dashboard/dashboard_state.dart';

String _query = '';

class TopicScreen extends StatefulWidget {
  const TopicScreen({super.key});

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<DashboardBloc>(context, listen: false)
            .add(InitDashboardEvent()),);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Topic"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<DashboardBloc, DashboardState> (
            builder: (context, state) {
              return _topicList(context,state);
            }
        ),
      )
    );
  }

  Widget _topicList(BuildContext context, DashboardState state) {
    return Column(
      children: [
        // Search bar
        TextField(
          onChanged: (query) {
            _query = query;
            context.read<DashboardBloc>().add(OnQueryChanged(query));
          },
        ),
        SizedBox(height: 32),
        // List of topics
        Expanded(
          child: ListView.builder(
            itemCount: state is DashboardLoaded ? state.topics.length : 0,
            itemBuilder: (context, index) {
              return Padding(padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    var arg = {
                      "topic" :state is DashboardLoaded ? state.topics[index] : Topic(id: 0, name: "test", desc: "testtttttttt"),
                      "question_number" : 0,
                      "answer" : List<bool>.of([])
                    };
                    Navigator.pushReplacementNamed(
                        context,
                        '/question',
                        arguments: arg
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(state is DashboardLoaded ? state.topics[index].name ?? "" : ""),
                      const Icon(Icons.chevron_right),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
