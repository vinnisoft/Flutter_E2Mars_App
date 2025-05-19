import 'package:e2mars/export.dart';

class HelpScreen extends GetView<HelpController> {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          ],
        ).paddingOnly(bottom: 30.h),
      ),
    );
  }
}