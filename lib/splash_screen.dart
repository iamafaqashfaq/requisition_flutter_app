import 'package:flutter/material.dart';
import 'package:requisition_app/CustomWidgets/sizeconfig.dart';
import 'package:requisition_app/CustomWidgets/splash_screen_widget.dart';
import 'package:requisition_app/Screens/Account/auth_company_code.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  Future<dynamic> loadFromFuture() async {
    // <fetch data from server. ex. login>
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("token") != null) {
      var response = await Future.delayed(const Duration(seconds: 3), () {
        return Future.value(const Scaffold());
      });
      return response;
    }
    var response = await Future.delayed(const Duration(seconds: 3), () {
      return Future.value(const AuthCompanyCode());
    });
    return response;
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);

    return SplashScreenWidget(
      navigateAfterFuture: loadFromFuture(),
      title: Text(
        'Please wait while Requisition App Loads',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: MySize.size16!,
            color: Theme.of(context).colorScheme.onBackground),
      ),
      // image: Image.asset(
      //   "assets/Sushi-Tei-Logo-200.png",
      //   fit: BoxFit.cover,
      // ),
      backgroundColor: Theme.of(context).colorScheme.background,
      styleTextUnderTheLoader: const TextStyle(),
      photoSize: 100.0,
      loaderColor: Theme.of(context).colorScheme.onBackground,
    );
  }
}
