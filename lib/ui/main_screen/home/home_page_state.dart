import 'package:equatable/equatable.dart';
import 'package:monumental_habit_app/services/app_helpers.dart';

class HomePageState extends Equatable {
  final LoadStatus loadDataStatus;


  const HomePageState({
    this.loadDataStatus = LoadStatus.initial,
  });

  @override
  List<Object?> get props => [
        loadDataStatus,
      ];

  HomePageState copyWith({LoadStatus? loadDataStatus,}) {
    return HomePageState(
      loadDataStatus: loadDataStatus ?? this.loadDataStatus,
    );
  }
}
