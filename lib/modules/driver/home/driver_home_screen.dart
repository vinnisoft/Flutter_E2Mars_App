import 'package:e2mars/export.dart';

class DriverHomeScreen extends GetView<RiderHomeController> {
  DriverHomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
