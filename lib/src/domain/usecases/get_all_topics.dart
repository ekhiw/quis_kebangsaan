
import 'package:quis_kebangsaan/src/domain/repository/base_repository.dart';

class GetAllTopics {
  final BaseRepository repository;

  GetAllTopics(this.repository);

  Future<List<Object>> execute() {
    return repository.getAllTopics();
  }
}