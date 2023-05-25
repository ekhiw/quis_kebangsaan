import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quis_kebangsaan/src/domain/usecases/search_topic.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';
import 'package:quis_kebangsaan/src/domain/usecases/get_all_topics.dart';
import 'package:rxdart/rxdart.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetAllTopics getAllTopics;
  final SearchTopic searchTopic;
  DashboardBloc({
    required this.getAllTopics,
    required this.searchTopic
  }) : super(DashboardEmpty()) {
    on<InitDashboardEvent>((event, emit) async {
      emit(DashboardLoading());
      final result = await getAllTopics.execute();
      if(result.isEmpty) {
        emit(DashboardEmpty());
      } else {
        emit(DashboardLoaded(result));
      }
    });
    on<OnQueryChanged>((event, emit) async {
      final query = event.query;
      if(query.isNotEmpty) {
        emit(DashboardLoading());
        final result = await searchTopic.execute(query);
        if(result.isEmpty) {
          emit(DashboardEmpty());
        } else {
          emit(DashboardLoaded(result));
        }
      } else {
        final result = await getAllTopics.execute();
        if(result.isEmpty) {
          emit(DashboardEmpty());
        } else {
          emit(DashboardLoaded(result));
        }
      }
    }, transformer: debounce(const Duration(milliseconds: 800)),);
  }
}


EventTransformer<MyEvent> debounce<MyEvent>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
