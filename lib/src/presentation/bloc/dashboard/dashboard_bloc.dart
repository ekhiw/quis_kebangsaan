import 'package:bloc/bloc.dart';

import 'dashboard_event.dart';
import 'dashboard_state.dart';
import 'package:quis_kebangsaan/src/domain/usecases/get_all_topics.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetAllTopics getAllTopics;
  DashboardBloc(this.getAllTopics) : super(DashboardState().init()) {
    on<InitDashboardEvent>(_init);
  }

  // FutureOr<void> _getAllTopics(


  void _init(InitDashboardEvent event, Emitter<DashboardState> emit) async {
    emit(state.clone());
  }
}
