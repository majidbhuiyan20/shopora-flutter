import 'package:flutter/material.dart';
import '../constants/app_strings.dart';

class Routes{
  static const String splashRoute="/";
  static const String loginRoute="/loginScreen";
  static const String registerRoute="/RegisterScreen";
  static const String otpRoute="/OtpScreen";
  static const String forgotPasswordRoute="/ForgotPasswordScreen";
  static const String resetPasswordRoute="/ResetPasswordScreen";
  static const String homeRoute="/homeScreen";
}

class RouteGenerator{
  static Route<dynamic>getRoute(RouteSettings routeSettings){
    switch (routeSettings.name) {
      case Routes.splashRoute:
        // return MaterialPageRoute(builder: (_)=> SplashScreen());

      default:
        return unDefineRoute();
    }

  }
  static Route<dynamic>unDefineRoute(){
    return MaterialPageRoute(builder: (_)=>Scaffold(
      appBar: AppBar(title: Text(AppStrings.noRoute),),
      body: Center(child: Text(AppStrings.noRoute),),
    ));
  }
}