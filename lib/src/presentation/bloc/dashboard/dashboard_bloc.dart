import 'package:bloc/bloc.dart';

import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardState().init()) {
    on<InitDashboardEvent>(_init);
  }

  void _init(InitDashboardEvent event, Emitter<DashboardState> emit) async {
    emit(state.clone());
  }
}
