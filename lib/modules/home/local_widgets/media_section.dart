import 'package:animelist/modules/home/home_controller.dart';
import 'package:animelist/modules/home/local_widgets/media_item_loading.dart';
import 'package:flutter/material.dart';

// Utilities
import 'package:animelist/utils/size_config.dart';
import 'package:get/get.dart';

// Local Widgets
import 'media_item.dart';

// Models
import 'package:animelist/data/models/media_model.dart';

class MediaSection extends StatelessWidget {
  final String title;
  final bool isFirst, loading;
  final List<MediaModel> mediaList;
  final String messageError;

  MediaSection({
    Key key,
    this.isFirst = false,
    @required this.loading,
    @required this.title,
    @required this.mediaList,
    this.messageError,
  }) : super(key: key);

  // ====================================================================
  // Build Widget
  // ====================================================================
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GetBuilder<HomeController>(
      builder: (controller) {
        if (messageError != "null") {
          print(messageError);
          // controller.showError(message: messageError);
        }

        return Stack(
          children: [
            // Color Primary
            Container(
              height: SizeConfig.safeBlockVertical * 5,
              width: SizeConfig.safeBlockHorizontal * 100,
              color: Theme.of(context).primaryColor,
            ),

            // Content List
            Container(
              height: _heightContainer(),
              width: SizeConfig.safeBlockHorizontal * 100,
              margin: EdgeInsets.zero,
              padding: EdgeInsets.only(
                top: _validatePaddingTop(),
                left: SizeConfig.safeBlockHorizontal * 8,
              ),
              decoration: BoxDecoration(
                borderRadius: _validateRadius(),
                color: Theme.of(context).backgroundColor,
              ),
              child: Column(
                children: [
                  // Title Section
                  _titleSection(context),

                  // Anime List
                  _animeList(context),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  // ====================================================================
  // Title Section
  // ====================================================================
  Widget _titleSection(BuildContext context) {
    // Font Size Title (Responsive)
    double _fontSizeTitle = SizeConfig.safeBlockHorizontal * 3;
    // Font Size Button "See all" (Responsive)
    double _fontSizeBtn = SizeConfig.safeBlockHorizontal * 2.8;
    if (SizeConfig.orientation == Orientation.landscape) {
      _fontSizeTitle = SizeConfig.safeBlockHorizontal * 2;
      _fontSizeBtn = SizeConfig.safeBlockHorizontal * 1.9;
    }

    return Container(
      padding: EdgeInsets.only(
        right: SizeConfig.safeBlockHorizontal * 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title.toUpperCase(),
            style: Theme.of(context).textTheme.headline5.merge(
                  TextStyle(
                    fontSize: _fontSizeTitle,
                  ),
                ),
          ),
          Text(
            "see_all".tr,
            style: Theme.of(context).textTheme.subtitle2.merge(
                  TextStyle(
                    fontSize: _fontSizeBtn,
                  ),
                ),
          ),
        ],
      ),
    );
  }

  // ====================================================================
  // Anime List
  // ====================================================================
  Widget _animeList(BuildContext context) {
    if (loading || messageError != "null") {
      return _loadingAnimeList();
    }

    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(
          top: SizeConfig.safeBlockVertical * 2.4,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: mediaList.length,
        itemBuilder: (context, index) {
          return MediaItem(
            media: mediaList[index],
          );
        },
      ),
    );
  }

  // ====================================================================
  // Loading Anime List
  // ====================================================================
  Widget _loadingAnimeList() {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(
          top: SizeConfig.safeBlockVertical * 2.4,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return MediaItemLoading();
        },
        itemCount: 10,
      ),
    );
  }

  // ====================================================================
  // Validate Border Radius First Category
  // ====================================================================
  BorderRadius _validateRadius() {
    if (isFirst) {
      return BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      );
    }

    return BorderRadius.zero;
  }

  // ====================================================================
  // Validate Padding Top First Category
  // ====================================================================
  double _validatePaddingTop() {
    if (isFirst) {
      // Responsive
      if (SizeConfig.orientation == Orientation.landscape) {
        return SizeConfig.safeBlockVertical * 8;
      }

      return SizeConfig.safeBlockVertical * 4;
    }

    // Responsive
    if (SizeConfig.orientation == Orientation.landscape) {
      return SizeConfig.safeBlockVertical * 6;
    }

    return SizeConfig.safeBlockVertical * 3;
  }

  // ====================================================================
  // Height Container (Responsive)
  // ====================================================================
  double _heightContainer() {
    if (SizeConfig.orientation == Orientation.landscape) {
      return SizeConfig.safeBlockVertical * 75;
    }

    return SizeConfig.safeBlockVertical * 35.8;
  }
}
