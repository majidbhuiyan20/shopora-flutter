import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/routes/app_routes.dart';
import '../../widgets/auth_background.dart';
import '../../widgets/custom_label.dart';
import '../../widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
            const SizedBox(height: 20),
            Center(
              child: Image.asset(
                AppAssets.appLogo,
                height: 70,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Create Account",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.titleColor,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Join Shopora and start shopping today!",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textColor,
              ),
            ),
            const SizedBox(height: 30),
            
            // Name Field
            const CustomLabel(label: "Full Name"),
            const SizedBox(height: 8),
            CustomTextField(
              controller: _nameController,
              hint: "Enter your full name",
              icon: Icons.person_outline,
              isPassword: false,
            ),
            const SizedBox(height: 16),

            // Email Field
            const CustomLabel(label: "Email Address"),
            const SizedBox(height: 8),
            CustomTextField(
              controller: _emailController,
              hint: "Enter your email",
              icon: Icons.email_outlined,
              isPassword: false,
            ),
            const SizedBox(height: 16),
            
            // Password Field
            const CustomLabel(label: "Password"),
            const SizedBox(height: 8),
            CustomTextField(
              controller: _passwordController,
              hint: "Create a password",
              icon: Icons.lock_outline,
              isPassword: true,
            ),
            const SizedBox(height: 16),

            // Confirm Password Field
            const CustomLabel(label: "Confirm Password"),
            const SizedBox(height: 8),
            CustomTextField(
              controller: _confirmPasswordController,
              hint: "Repeat your password",
              icon: Icons.lock_reset_outlined,
              isPassword: true,
            ),
            
            const SizedBox(height: 32),
            
            // Sign Up Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 2,
                  shadowColor: AppColors.primaryColor.withOpacity(0.3),
                ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Login Link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(color: AppColors.textColor),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacementNamed(context, Routes.loginRoute),
                  child: const Text(
                    "Sign In",
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
