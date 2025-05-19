import 'package:e2mars/export.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NetworkImageWidget(imageUrl: "",
                  imageHeight: 100.h,
                  imageWidth: 100.h),
              Text(
                controller.loginResponseModel.value.data?.name ?? '',
                style: textStyleHeadlineLarge(),
              ),

            ],
          ).paddingOnly(bottom: 30.h),
        ),
    );
  }

}
