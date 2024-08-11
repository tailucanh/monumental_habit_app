import 'package:equatable/equatable.dart';

import '../../../services/app_helpers.dart';

class ResetPasswordState extends Equatable {
  final LoadStatus loadDataStatus;
  const ResetPasswordState({
    this.loadDataStatus = LoadStatus.initial,
  });

  @override
  List<Object?> get props => [
        loadDataStatus,
      ];

  ResetPasswordState copyWith({LoadStatus? loadDataStatus, int? index}) {
    return ResetPasswordState(
      loadDataStatus: loadDataStatus ?? this.loadDataStatus,
    );
  }
}
