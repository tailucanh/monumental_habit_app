import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:monumental_habit_app/ui/main_screen/community/community_page_navigator.dart';
import 'package:monumental_habit_app/ui/main_screen/community/community_page_state.dart';

class CommunityPageCubit extends Cubit<CommunityPageState> {
  final CommunityPageNavigator navigator;

  CommunityPageCubit({
    required this.navigator,
  }) : super(const CommunityPageState());

}