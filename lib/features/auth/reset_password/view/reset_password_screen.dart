import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../widgets/primary_button.dart';
import '../../widgets/auth_background.dart';
import '../../widgets/custom_label.dart';
import '../../widgets/custom_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(height: 20),
            Center(
              child: Image.asset(
                AppAssets.appLogo,
                height: 80,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              "Reset Password",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.titleColor,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Please enter your new password to secure your account.",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textColor,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 40),
            
            // Password Field
            const CustomLabel(label: "New Password"),
            const SizedBox(height: 8),
            CustomTextField(
              controller: _passwordController,
              hint: "Enter new password",
              icon: Icons.lock_outline,
              isPassword: true,
            ),
            const SizedBox(height: 20),

            // Confirm Password Field
            const CustomLabel(label: "Confirm Password"),
            const SizedBox(height: 8),
            CustomTextField(
              controller: _confirmPasswordController,
              hint: "Repeat your password",
              icon: Icons.lock_reset_outlined,
              isPassword: true,
            ),
            
            const SizedBox(height: 40),
            
            // Reset Button
            PrimaryButton(
              text: "Reset Password",
              onPressed: () {
                // Logic to reset password
                Navigator.pushNamedAndRemoveUntil(context, Routes.loginRoute, (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
