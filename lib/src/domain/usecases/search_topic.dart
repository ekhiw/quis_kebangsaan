import 'package:quis_kebangsaan/src/domain/entities/Topic.dart';
import 'package:quis_kebangsaan/src/domain/repository/base_repository.dart';

class SearchTopic {
  final BaseRepository repository;

  SearchTopic(this.repository);

  Future<List<Topic>> execute(String query) {
    return repository.searchTopic(query);
  }
}