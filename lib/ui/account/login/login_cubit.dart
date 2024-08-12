import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monumental_habit_app/ui/account/login/login_navigator.dart';
import 'package:monumental_habit_app/ui/account/login/login_state.dart';
import '../../../services/app_helpers.dart';


class LoginCubit extends Cubit<LoginState> {
  final LoginNavigator navigator;

  LoginCubit({
    required this.navigator,
  }) : super(const LoginState());

  Future<void> loadInitialData() async {
    emit(state.copyWith(loadDataStatus: LoadStatus.initial));
    try {
       emit(state.copyWith(loadDataStatus: LoadStatus.success));
    } catch (e) {
      emit(state.copyWith(loadDataStatus: LoadStatus.failure));
    }
  }


  void openSignUpPage() {
    navigator.openSignUpPage();
  }

  void openForgotPasswordPage() {
    navigator.openForgotPasswordPage();
  }
  void openHomePage() {
    navigator.openHomePage();
  }

}
