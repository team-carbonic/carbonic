import 'package:flutter/material.dart';
import 'package:sotwo/feature/onboarding/template_page.dart';
import 'package:sotwo/feature/route/route.dart';

// TODO : routing info 추가 후 적용
class SignInCompleteOnboardingPage extends StatelessWidget {
  const SignInCompleteOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingTemplatePage(
      title: '홍길동님\n반가워요!',
      description: [
        ('회원가입이 완료되었습니다\nSOTWO와 함께 미술의 세계를 경험해 보세요', false),
      ],
      nextRoute: SabRoute.home,
    );
  }
}
