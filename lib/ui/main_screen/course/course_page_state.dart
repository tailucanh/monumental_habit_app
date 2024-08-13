import 'package:equatable/equatable.dart';
import 'package:monumental_habit_app/services/app_helpers.dart';

class CoursePageState extends Equatable {
  final LoadStatus loadDataStatus;


  const CoursePageState({
    this.loadDataStatus = LoadStatus.initial,
  });

  @override
  List<Object?> get props => [
        loadDataStatus,
      ];

  CoursePageState copyWith({LoadStatus? loadDataStatus,}) {
    return CoursePageState(
      loadDataStatus: loadDataStatus ?? this.loadDataStatus,
    );
  }
}
