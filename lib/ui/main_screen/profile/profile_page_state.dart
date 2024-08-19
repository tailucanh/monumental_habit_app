import 'package:equatable/equatable.dart';
import 'package:monumental_habit_app/services/app_helpers.dart';

class ProfilePageState extends Equatable {
  final LoadStatus loadDataStatus;


  const ProfilePageState({
    this.loadDataStatus = LoadStatus.initial,
  });

  @override
  List<Object?> get props => [
        loadDataStatus,
      ];

  ProfilePageState copyWith({LoadStatus? loadDataStatus,}) {
    return ProfilePageState(
      loadDataStatus: loadDataStatus ?? this.loadDataStatus,
    );
  }
}
