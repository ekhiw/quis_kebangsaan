import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:quis_kebangsaan/src/data/model/TopicModel.dart';
import 'package:quis_kebangsaan/src/domain/entities/Topic.dart';

abstract class BaseFirebaseDataSource {
  Future<List<Topic>> getAllTopics();
}

class FirebaseDataSourceImpl implements BaseFirebaseDataSource {

  @override
  Future<List<Topic>> getAllTopics() async {

    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('topic_list').get();
    var list = List<Topic>.empty(growable: true);
    if (snapshot.exists) {
      for (var element in snapshot.children) {
        Map<String, dynamic> item = Map<String, dynamic>.from(element.value! as Map<Object?, Object?>);
        var topic = TopicModel.fromJson(item);
        list.add(topic.toEntity());
      }
    } else {
      print('No data available.');
    }

    return list;
  }


}