import 'package:equatable/equatable.dart';
import 'package:monumental_habit_app/services/app_helpers.dart';

class SubscriptionPageState extends Equatable {
  final LoadStatus loadDataStatus;


  const SubscriptionPageState({
    this.loadDataStatus = LoadStatus.initial,
  });

  @override
  List<Object?> get props => [
        loadDataStatus,
      ];

  SubscriptionPageState copyWith({LoadStatus? loadDataStatus,}) {
    return SubscriptionPageState(
      loadDataStatus: loadDataStatus ?? this.loadDataStatus,
    );
  }
}
