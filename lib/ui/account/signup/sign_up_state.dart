import 'package:equatable/equatable.dart';

import '../../../services/app_helpers.dart';

class SignUpState extends Equatable {
  final LoadStatus loadDataStatus;
  const SignUpState({
    this.loadDataStatus = LoadStatus.initial,
  });

  @override
  List<Object?> get props => [
        loadDataStatus,
      ];

  SignUpState copyWith({LoadStatus? loadDataStatus, int? index}) {
    return SignUpState(
      loadDataStatus: loadDataStatus ?? this.loadDataStatus,
    );
  }
}
