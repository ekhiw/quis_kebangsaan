import 'package:equatable/equatable.dart';

class Topic extends Equatable {
  final int? id;
  final String? name, desc;

  const Topic({
    required this.id,
    required this.name,
    required this.desc,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    desc,
  ];
}
