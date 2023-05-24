import 'package:equatable/equatable.dart';
import 'package:quis_kebangsaan/src/domain/entities/Topic.dart';

class TopicModel extends Equatable{
  final int? id;
  final String? name;
  final String? desc;

  const TopicModel({
    this.id,
    this.name,
    this.desc,
  });

  factory TopicModel.fromJson(Map<String, dynamic> json) => TopicModel(
    id: json["id"],
    name: json["name"],
    desc: json["desc"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "desc": desc,
  };

  Topic toEntity() {
    return Topic(
      id: id,
      name: name,
      desc: desc,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    desc,
  ];
}