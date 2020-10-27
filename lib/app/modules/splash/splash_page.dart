import 'package:flutter/material.dart';

// Libraries
import 'package:get/state_manager.dart';

// Controllers
import 'package:animelist/app/modules/splash/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Center(
            child: Text("Splash"),
          ),
        ),
      ),
    );
  }
}
