import 'package:animelist/modules/home/local_widgets/lists/popular_list.dart';
import 'package:animelist/modules/home/local_widgets/lists/upcoming_list.dart';
import 'package:flutter/material.dart';

// Controllers
import 'package:animelist/modules/home/home_controller.dart';

// Libraries
import 'package:get/get.dart';

// Utilities
import 'package:animelist/utils/size_config.dart';

// Local Widgets
import 'local_widgets/app_bar.dart';
import 'local_widgets/lists/trending_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => Scaffold(
        body: SafeArea(
          top: false,
          child: CustomScrollView(
            slivers: [
              // App Bar With Search
              AppBarHome(),

              // List Movies
              SliverList(
                delegate: SliverChildListDelegate([
                  // Trending List
                  TrendingList(),

                  // Popular List
                  PopularList(),

                  // Upcoming List
                  UpcomingList(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
