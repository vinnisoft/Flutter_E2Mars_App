import 'package:e2mars/export.dart';

class MyRidesScreen extends GetView<MyRidesController> {
  const MyRidesScreen({super.key});


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