import 'package:equatable/equatable.dart';
import 'package:monumental_habit_app/services/app_helpers.dart';

class HomeScreenState extends Equatable {
  final LoadStatus loadDataStatus;
  const HomeScreenState({
    this.loadDataStatus = LoadStatus.initial,
  });

  @override
  List<Object?> get props => [
        loadDataStatus,
      ];

  HomeScreenState copyWith({LoadStatus? loadDataStatus, int? index}) {
    return HomeScreenState(
      loadDataStatus: loadDataStatus ?? this.loadDataStatus,
    );
  }
}
