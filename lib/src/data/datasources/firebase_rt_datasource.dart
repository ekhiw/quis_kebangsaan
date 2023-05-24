import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:quis_kebangsaan/src/data/model/TopicModel.dart';

abstract class BaseFirebaseDataSource {
  Future<List<Object>> getAllTopics();
}

class FirebaseDataSourceImpl implements BaseFirebaseDataSource {

  @override
  Future<List<Object>> getAllTopics() async {

    print('testttt');
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('topic_list').get();
    if (snapshot.exists) {
      var list = List<TopicModel>.empty(growable: true);
      for (var element in snapshot.children) {
        Map<String, dynamic> item = Map<String, dynamic>.from(element.value! as Map<Object?, Object?>);
        var topic = TopicModel.fromJson(item);
        print(topic);
      }
    } else {
      print('No data available.');
    }

    return List.empty();
  }


}