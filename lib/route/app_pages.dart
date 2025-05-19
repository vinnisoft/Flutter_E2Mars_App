import 'package:e2mars/export.dart';

class AppPages {
  AppPages();

  static const int _transitionDuration = 300;
  static const initial = AppRoutes.routeSplash;

  static var pages = <GetPage>[
    GetPage(
        name: AppRoutes.routeSplash,
        transition: Transition.rightToLeft,
        curve: Curves.ease,
        transitionDuration: const Duration(milliseconds: _transitionDuration),
        page: () => const SplashScreen()),
    GetPage(
        name: AppRoutes.routeRoleSelection,
        transition: Transition.rightToLeft,
        curve: Curves.ease,
        transitionDuration: const Duration(milliseconds: _transitionDuration),
        page: () => const RoleSelectionScreen(),
        binding: RoleSelectionBinding()),
    GetPage(
      name: AppRoutes.routeOnBoarding,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => const OnBoardingScreen(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: AppRoutes.routeLogin,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.routeSignup,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => SignupScreen(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: AppRoutes.routeForgotPassword,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => ForgotPasswordScreen(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.routeOtpVerification,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => OtpVerificationScreen(),
      binding: OtpVerificationBinding(),
    ),
    GetPage(
      name: AppRoutes.routeResetPassword,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => ResetPasswordScreen(),
      binding: RestPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.routePasswordResetSuccessful,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => PasswordResetSuccessful(),
    ),
    GetPage(
      name: AppRoutes.routeDashboard,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => DashboardScreen(),
      binding: DashboardBinding(),
    ),


    GetPage(
      name: AppRoutes.routeE2Refer,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => E2referScreen(),
      binding: E2ReferBinding(),
    ),

    GetPage(
      name: AppRoutes.routeUploadDocuments,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => UploadDocumentsScreen(),
      binding: UploadDocumentsBinding(),
    ),

    GetPage(
      name: AppRoutes.routeVehicleFormInfo,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => VehicleInfoFormScreen(),
      binding: VehicleInfoBinding(),
    ),

    GetPage(
      name: AppRoutes.routeBankInfoForm,
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      transitionDuration: const Duration(milliseconds: _transitionDuration),
      page: () => BankInfoFromScreen(),
      binding: BankInfoFormBinding(),
    ),
  ];
}
