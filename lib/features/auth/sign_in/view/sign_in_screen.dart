import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/routes/app_routes.dart';
import '../../widgets/auth_background.dart';
import '../../widgets/custom_label.dart';
import '../../widgets/custom_text_field.dart';
import '../../../widgets/primary_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Center(
              child: Image.asset(
                AppAssets.appLogo,
                height: 80,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              "Welcome Back!",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.titleColor,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Sign in to continue your shopping journey",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textColor,
              ),
            ),
            const SizedBox(height: 40),

            // Email Field
            const CustomLabel(label: "Email Address"),
            const SizedBox(height: 8),
            CustomTextField(
              controller: _emailController, 
              hint: "Enter your email", 
              icon: Icons.email_outlined, 
              isPassword: false,
            ),

            const SizedBox(height: 20),

            // Password Field
            const CustomLabel(label: "Password"),
            const SizedBox(height: 8),
            CustomTextField(
              controller: _passwordController, 
              hint: "Enter your password", 
              icon: Icons.lock_outline, 
              isPassword: true,
            ),

            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Navigator.pushNamed(context, Routes.forgotPasswordRoute),
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Sign In Button
            PrimaryButton(
              text: "Sign In",
              onPressed: () {
                 Navigator.pushReplacementNamed(context, Routes.homeRoute);
              },
            ),

            const SizedBox(height: 24),

            // Register Link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(color: AppColors.textColor),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, Routes.registerRoute),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
