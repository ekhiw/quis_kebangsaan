import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:quis_kebangsaan/injection.dart';
import 'package:quis_kebangsaan/src/domain/entities/Topic.dart';
import 'package:quis_kebangsaan/src/presentation/bloc/dashboard/dashboard_bloc.dart';
import 'package:quis_kebangsaan/src/presentation/bloc/dashboard/dashboard_event.dart';
import 'package:quis_kebangsaan/src/presentation/bloc/dashboard/dashboard_state.dart';

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
              if(state is DashboardLoaded) {
                return _topicList(context,state.topics);
              } else {
                return const Text("hehehe");
              }
            }
        ),
      )
    );
  }

  Widget _topicList(BuildContext context, List<Topic> topics) {
    return Column(
      children: [
        // Search bar
        TextField(
          onChanged: (value) {
            // Filter topics by name
            List<Topic> filteredTopics = topics;
            if (value.isNotEmpty) {
              print("EKHIW $value");
              filteredTopics = topics.where((topic) {
                return (topic.name ?? '').toLowerCase().contains(value.toLowerCase());
              }).toList();
            }
            topics = filteredTopics;

            print("EKHIW TOPICS $topics");
          },
        ),
        SizedBox(height: 32),
        // List of topics
        Expanded(
          child: ListView.builder(
            itemCount: topics.length,
            itemBuilder: (context, index) {
              return Padding(padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(topics[index].name ?? ""),
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
