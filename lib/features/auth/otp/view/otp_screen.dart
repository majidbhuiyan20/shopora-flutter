import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../widgets/primary_button.dart';
import '../../widgets/auth_background.dart';

class OtpScreen extends StatefulWidget {
  final bool isFromForgotPass;
  const OtpScreen({super.key, required this.isFromForgotPass});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _pinController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _pinController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: AppColors.titleColor,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.primaryColor),
      color: Colors.white,
    );

    return AuthBackground(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios, color: AppColors.titleColor),
            ),
            const SizedBox(height: 40),
            const Text(
              "Verify OTP",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.titleColor,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Enter the 6-digit code sent to your email address.",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textColor,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 48),
            
            // OTP Input
            Center(
              child: Pinput(
                length: 6,
                controller: _pinController,
                focusNode: _focusNode,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                separatorBuilder: (index) => const SizedBox(width: 8),
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: (pin) {
                  debugPrint('onCompleted: $pin');
                },
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(

                      width: 22,
                      height: 1,
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 40),
            
            // Verify Button
            PrimaryButton(
              text: "Verify",
              onPressed: () {
                if (widget.isFromForgotPass) {
                  Navigator.pushNamed(context, Routes.resetPasswordRoute);
                } else {
                  // If from Sign Up, go to Login
                  Navigator.pushNamedAndRemoveUntil(context, Routes.loginRoute, (route) => false);
                }
              },
            ),
            
            const SizedBox(height: 24),
            
            // Resend Code
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Didn't receive code? ",
                  style: TextStyle(color: AppColors.textColor),
                ),
                GestureDetector(
                  onTap: () {
                    // Logic to resend OTP
                  },
                  child: const Text(
                    "Resend",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
