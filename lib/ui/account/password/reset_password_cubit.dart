import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monumental_habit_app/ui/account/login/login_navigator.dart';
import 'package:monumental_habit_app/ui/account/login/login_state.dart';
import 'package:monumental_habit_app/ui/account/password/reset_password_navigator.dart';
import 'package:monumental_habit_app/ui/account/password/reset_password_state.dart';
import 'package:monumental_habit_app/ui/account/signup/sign_up_navigator.dart';
import 'package:monumental_habit_app/ui/account/signup/sign_up_state.dart';
import '../../../services/app_helpers.dart';


class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordNavigator navigator;

  ResetPasswordCubit({
    required this.navigator,
  }) : super(const ResetPasswordState());

  Future<void> loadInitialData() async {
    emit(state.copyWith(loadDataStatus: LoadStatus.initial));
    try {
       emit(state.copyWith(loadDataStatus: LoadStatus.success));
    } catch (e) {
      emit(state.copyWith(loadDataStatus: LoadStatus.failure));
    }
  }

  void onBackLoginPage() {
    navigator.onBackLoginPage();
  }
}
