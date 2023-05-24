
import 'package:quis_kebangsaan/src/domain/entities/Topic.dart';

abstract class BaseRepository {
    Future<List<Topic>> getAllTopics();
}