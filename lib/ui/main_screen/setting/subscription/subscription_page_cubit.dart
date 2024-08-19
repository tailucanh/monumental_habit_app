import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:monumental_habit_app/models/purchase_package_profile.dart';
import 'package:monumental_habit_app/services/app_language_constants.dart';
import 'package:monumental_habit_app/ui/main_screen/setting/subscription/subscription_page_navigator.dart';
import 'package:monumental_habit_app/ui/main_screen/setting/subscription/subscription_page_state.dart';

class SubscriptionPageCubit extends Cubit<SubscriptionPageState> {
  final SubscriptionPageNavigator navigator;

  SubscriptionPageCubit({
    required this.navigator,
  }) : super(const SubscriptionPageState());


  void onBackPage() {
    navigator.onBackPage();
  }

  List<PurchasePackageProfile> dataPurchase(BuildContext context){
    List<PurchasePackageProfile> list = [
      PurchasePackageProfile(id: "1", strTime: translation(context).text_premium_monthly, title: "", price: 19.00,
          contentPrice: "6 ${translation(context).text_premium_content_price} ${39.99} usd", discount: 0, ),
      PurchasePackageProfile(id: "2", strTime: translation(context).text_premium_yearly, title: translation(context).text_premium_most_popular,
        price: 29.00, contentPrice: "6 ${translation(context).text_premium_content_price} ${39.99} usd", discount: 0, ),
      PurchasePackageProfile(id: "1", strTime: translation(context).text_premium_lifetime, title: "", price: 49.00,
        contentPrice: "6 ${translation(context).text_premium_content_price} ${39.99} usd", discount: -75, ),
    ];
    return list;
  }

}