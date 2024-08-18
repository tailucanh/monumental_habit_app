import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monumental_habit_app/models/habit_frequency.dart';
import 'package:monumental_habit_app/services/app_helpers.dart';
import 'package:monumental_habit_app/ui/account/login/login_navigator.dart';
import 'package:monumental_habit_app/ui/account/login/login_state.dart';
import 'package:monumental_habit_app/ui/account/signup/sign_up_navigator.dart';
import 'package:monumental_habit_app/ui/account/signup/sign_up_state.dart';


class SignUpCubit extends Cubit<SignUpState> {
  final SignUpNavigator navigator;

  SignUpCubit({
    required this.navigator,
  }) : super(const SignUpState());

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
