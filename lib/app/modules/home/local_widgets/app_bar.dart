import 'package:flutter/material.dart';

// Utilities
import 'package:animelist/app/utils/size_config.dart';

// Local Widgets
import 'top_card.dart';

class AppBarHome extends StatelessWidget {
  AppBarHome({Key key}) : super(key: key);

  // ====================================================================
  // Build Widget
  // ====================================================================
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: false,
      elevation: 0,
      stretch: false,
      expandedHeight: _heightAppBar(),
      backgroundColor: Theme.of(context).backgroundColor,
      toolbarHeight: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: TopCardHome(),
      ),
    );
  }

  // ====================================================================
  // Height App Bar Container (Responsive)
  // ====================================================================
  double _heightAppBar() {
    if (SizeConfig.orientation == Orientation.landscape) {
      return SizeConfig.safeBlockVertical * 45;
    }

    return SizeConfig.safeBlockVertical * 25;
  }
}
