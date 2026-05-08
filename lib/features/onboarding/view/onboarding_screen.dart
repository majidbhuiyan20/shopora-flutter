import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/routes/app_routes.dart';
import '../../widgets/primary_button.dart';
import '../models/onboarding_model.dart';
import '../providers/onboarding_provider.dart';
import '../widgets/dot_indicator.dart';
import '../widgets/onboarding_content.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  late PageController _pageController;

  final List<OnboardingData> _onboardingData = [
    OnboardingData(
      title: "Discover Latest Trends",
      description: "Explore a wide range of products from top brands and stay ahead of the fashion curve.",
      imageUrl: "https://img.freepik.com/free-vector/online-shopping-concept-illustration_114360-1084.jpg",
    ),
    OnboardingData(
      title: "Secure Payments",
      description: "Shop with confidence using our multiple secure payment methods and encrypted transactions.",
      imageUrl: "https://img.freepik.com/free-vector/mobile-payments-concept-illustration_114360-1191.jpg",
    ),
    OnboardingData(
      title: "Fast Delivery",
      description: "Get your orders delivered to your doorstep quickly and efficiently with real-time tracking.",
      imageUrl: "https://img.freepik.com/free-vector/delivery-service-concept-illustration_114360-1205.jpg",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNextPressed(int currentIndex) {
    if (currentIndex == _onboardingData.length - 1) {
      Navigator.pushReplacementNamed(context, Routes.loginRoute);
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = ref.watch(onboardingPageIndexProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Skip Button
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, Routes.loginRoute),
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingData.length,
                onPageChanged: (index) {
                  ref.read(onboardingPageIndexProvider.notifier).state = index;
                },
                itemBuilder: (context, index) {
                  return OnboardingContent(
                    data: _onboardingData[index],
                  );
                },
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  // Dot Indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _onboardingData.length,
                      (index) => DotIndicator(
                        index: index,
                        currentPage: currentPage,
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  
                  // Main Action Button (Using global PrimaryButton)
                  PrimaryButton(
                    text: currentPage == _onboardingData.length - 1 ? "Get Started" : "Continue",
                    onPressed: () => _onNextPressed(currentPage),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
