
import 'package:equatable/equatable.dart';

import '../../../services/app_helpers.dart';

class LoginState extends Equatable {
  final LoadStatus loadDataStatus;
  const LoginState({
    this.loadDataStatus = LoadStatus.initial,
  });

  @override
  List<Object?> get props => [
        loadDataStatus,
      ];

  LoginState copyWith({
    LoadStatus? loadDataStatus,
    int? index
  }) {
    return LoginState(
      loadDataStatus: loadDataStatus ?? this.loadDataStatus,
    );
  }

}
