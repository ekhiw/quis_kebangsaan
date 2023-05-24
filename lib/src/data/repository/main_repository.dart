
import 'package:quis_kebangsaan/src/domain/entities/Topic.dart';
import 'package:quis_kebangsaan/src/domain/repository/base_repository.dart';
import 'package:quis_kebangsaan/src/data/datasources/firebase_rt_datasource.dart';

class MainRepository extends BaseRepository {

    final BaseFirebaseDataSource firebaseDataSource;

    MainRepository({
        required this.firebaseDataSource,
    });

    @override
    Future<List<Topic>> getAllTopics() async {
        // handle data source here
        print('GET DATA');
        return firebaseDataSource.getAllTopics();
    }
}