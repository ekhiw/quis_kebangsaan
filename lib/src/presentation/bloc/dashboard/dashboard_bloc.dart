import 'package:bloc/bloc.dart';

import 'dashboard_event.dart';
import 'dashboard_state.dart';
import 'package:quis_kebangsaan/src/domain/usecases/get_all_topics.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetAllTopics getAllTopics;
  DashboardBloc(this.getAllTopics) : super(DashboardEmpty()) {
    on<InitDashboardEvent>((event, emit) async {
      emit(DashboardLoading());
      final result = await getAllTopics.execute();
      if(result.isEmpty) {
        emit(DashboardEmpty());
      } else {
        emit(DashboardLoaded(result));
      }
    });
  }
}
