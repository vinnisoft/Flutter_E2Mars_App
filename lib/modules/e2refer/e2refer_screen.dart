import 'package:e2mars/export.dart';

class E2referScreen extends GetView<E2ReferController> {
  E2referScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitleText: keyE2Refer.tr,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AssetImageWidget(
              AppImages.iconsReferFriend
            ),
            InkWell(
              onTap: () async {
                final result = await SharePlus.instance.share(
                    ShareParams(text: '$baseUrl${controller.loginDataModel.value.referralCode ?? ''}')
                );

                if (result.status == ShareResultStatus.success) {
                  print('Thank you for sharing my website!');
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.secondaryTextColor,
                    width: 0.5.h
                  ),
                  borderRadius: BorderRadius.circular(8.r)
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "$baseUrl${controller.loginDataModel.value.referralCode ?? ''}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textStyleTitleSmall(),
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_right,
                    size: 12.h,
                    color: Colors.black,)
                  ],
                ),
              ),
            ).paddingSymmetric(vertical: 15.h)

          ],
        ).paddingSymmetric(horizontal: 25.h, vertical: 20.h),
      ),
    );
  }
}
