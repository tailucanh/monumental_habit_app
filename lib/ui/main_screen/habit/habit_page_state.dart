import 'package:equatable/equatable.dart';
import 'package:monumental_habit_app/services/app_helpers.dart';

class HabitPageState extends Equatable {
  final LoadStatus loadDataStatus;


  const HabitPageState({
    this.loadDataStatus = LoadStatus.initial,
  });

  @override
  List<Object?> get props => [
        loadDataStatus,
      ];

  HabitPageState copyWith({LoadStatus? loadDataStatus,}) {
    return HabitPageState(
      loadDataStatus: loadDataStatus ?? this.loadDataStatus,
    );
  }
}
