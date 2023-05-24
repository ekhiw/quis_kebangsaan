import 'package:equatable/equatable.dart';
import 'package:quis_kebangsaan/src/domain/entities/Topic.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Topic> get props => [];
}

class DashboardEmpty extends DashboardState {}

class DashboardError extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final List<Topic> topics;

  const DashboardLoaded(this.topics);

  @override
  List<Topic> get props => topics;
}
