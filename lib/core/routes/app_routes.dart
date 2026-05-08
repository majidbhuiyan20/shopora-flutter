import 'package:flutter/material.dart';
import '../../features/auth/forgot_password/view/forgot_password_screen.dart';
import '../../features/auth/otp/view/otp_screen.dart';
import '../../features/auth/reset_password/view/reset_password_screen.dart';
import '../../features/auth/sign_in/view/sign_in_screen.dart';
import '../../features/auth/sign_up/view/sign_up_screen.dart';
import '../../features/onboarding/view/onboarding_screen.dart';
import '../../features/splash/view/splash_screen.dart';
import '../constants/app_strings.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onboardingRoute = "/onboarding";
  static const String loginRoute = "/loginScreen";
  static const String registerRoute = "/RegisterScreen";
  static const String otpRoute = "/OtpScreen";
  static const String forgotPasswordRoute = "/ForgotPasswordScreen";
  static const String resetPasswordRoute = "/ResetPasswordScreen";
  static const String homeRoute = "/homeScreen";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onboardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case Routes.otpRoute:
        final bool isFromForgotPass = routeSettings.arguments as bool? ?? false;
        return MaterialPageRoute(
          builder: (_) => OtpScreen(isFromForgotPass: isFromForgotPass),
        );
      case Routes.resetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      default:
        return unDefineRoute();
    }
  }

  static Route<dynamic> unDefineRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRoute),
              ),
              body: const Center(
                child: Text(AppStrings.noRoute),
              ),
            ));
  }
}
