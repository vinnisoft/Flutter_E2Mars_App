import 'package:e2mars/export.dart';

class OnBoardingController extends GetxController {
  RxInt selectedPageIndex = 0.obs;

  List riderData = [
    {
      "imageUrl": AppImages.imagesRiderOnBoarding1,
      "headingText": keyRiderOnboardingHeading1.tr,
      "bodyText": keyRiderOnboardingDesc1.tr,
    },
    {
      "imageUrl": AppImages.imagesRiderOnBoarding2,
      "headingText": keyRiderOnboardingHeading2.tr,
      "bodyText": keyRiderOnboardingDesc2.tr,
    },
    {
      "imageUrl": AppImages.imagesRiderOnBoarding3,
      "headingText": keyRiderOnboardingHeading3.tr,
      "bodyText": keyRiderOnboardingDesc3.tr,
    }
  ];

  List driverData = [
    {
      "imageUrl": AppImages.imagesDriverOnBoarding1,
      "headingText": keyDriverOnboardingHeading1.tr,
      "bodyText": keyDriverOnboardingDesc1.tr,
    },
    {
      "imageUrl": AppImages.imagesDriverOnBoarding2,
      "headingText": keyDriverOnboardingHeading2.tr,
      "bodyText": keyDriverOnboardingDesc2.tr,
    },
    {
      "imageUrl": AppImages.imagesDriverOnBoarding3,
      "headingText": keyDriverOnboardingHeading3.tr,
      "bodyText": keyDriverOnboardingDesc3.tr,
    }
  ];

  PageController pageController = PageController();

  @override
  void onInit() {
    super.onInit();
  }

  movePageAction() {
    if (selectedPageIndex.value < 2) {
      selectedPageIndex.value++;
      pageController.animateToPage(selectedPageIndex.value,
          curve: Curves.decelerate,
          duration: const Duration(
              milliseconds: 500)); // for animated jump. Requires a cu
    } else {
      moveToLoginScreen();
    }
  }

  movePageActionBack() {
    selectedPageIndex.value--;
    pageController.animateToPage(selectedPageIndex.value,
        curve: Curves.decelerate,
        duration: const Duration(
            milliseconds: 500)); // for animated jump. Requires a cu
  }

  moveToLoginScreen() {
    Get.find<LocalStorage>().firstLaunch(true);
    Get.offAllNamed(AppRoutes.routeLogin);
  }

  onSwipePage(index) {
    selectedPageIndex.value = index;
    update();
  }

  @override
  void refresh() {
    super.refresh();
  }
}
