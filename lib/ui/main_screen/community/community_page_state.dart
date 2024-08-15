import 'package:equatable/equatable.dart';
import 'package:monumental_habit_app/services/app_helpers.dart';

class CommunityPageState extends Equatable {
  final LoadStatus loadDataStatus;


  const CommunityPageState({
    this.loadDataStatus = LoadStatus.initial,
  });

  @override
  List<Object?> get props => [
        loadDataStatus,
      ];

  CommunityPageState copyWith({LoadStatus? loadDataStatus,}) {
    return CommunityPageState(
      loadDataStatus: loadDataStatus ?? this.loadDataStatus,
    );
  }
}
