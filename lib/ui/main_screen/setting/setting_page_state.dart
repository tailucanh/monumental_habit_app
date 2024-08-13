import 'package:equatable/equatable.dart';
import 'package:monumental_habit_app/services/app_helpers.dart';

class SettingPageState extends Equatable {
  final LoadStatus loadDataStatus;


  const SettingPageState({
    this.loadDataStatus = LoadStatus.initial,
  });

  @override
  List<Object?> get props => [
        loadDataStatus,
      ];

  SettingPageState copyWith({LoadStatus? loadDataStatus,}) {
    return SettingPageState(
      loadDataStatus: loadDataStatus ?? this.loadDataStatus,
    );
  }
}
