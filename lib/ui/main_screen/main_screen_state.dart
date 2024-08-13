import 'package:equatable/equatable.dart';
import 'package:monumental_habit_app/services/app_helpers.dart';

class MainScreenState extends Equatable {
  final LoadStatus loadDataStatus;
  final int selectedIndex;


  const MainScreenState({
    this.loadDataStatus = LoadStatus.initial,
    this.selectedIndex = 0,
  });

  @override
  List<Object?> get props => [
        loadDataStatus,
        selectedIndex
      ];

  MainScreenState copyWith({LoadStatus? loadDataStatus,  int? selectedIndex,}) {
    return MainScreenState(
      loadDataStatus: loadDataStatus ?? this.loadDataStatus,
        selectedIndex: selectedIndex ?? this.selectedIndex
    );
  }
}
