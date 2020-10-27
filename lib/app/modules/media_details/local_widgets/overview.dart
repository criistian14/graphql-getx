import 'package:flutter/material.dart';


// Utilities
import 'package:animelist/app/utils/size_config.dart';

// Libraries
import 'package:get/get.dart';

// Controllers 
import '../media_details_controller.dart';

class OverviewMediaDetails extends StatelessWidget {
  OverviewMediaDetails({
    Key key,
  }) : super(key: key);

  // =====================================================================
  // Build Widget
  // =====================================================================
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GetBuilder<MediaDetailsController>(
      builder: (controller) {
        if (controller.loading.value) {
          return Container();
        }

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeBlockHorizontal * 8,
          ),
          margin: EdgeInsets.only(
            top: SizeConfig.safeBlockVertical * 3,
          ),
          child: Text(
            controller.media?.description,
            style: Theme.of(context).textTheme.bodyText1.merge(
                  TextStyle(
                    fontSize: _fontSize(),
                  ),
                ),
          ),
        );
      },
    );
  }

  // ====================================================================
  // Font Size (Responsive)
  // ====================================================================
  double _fontSize() {
    if (SizeConfig.orientation == Orientation.landscape) {
      return SizeConfig.safeBlockHorizontal * 2.2;
    }

    return SizeConfig.safeBlockHorizontal * 3.2;
  }
}
