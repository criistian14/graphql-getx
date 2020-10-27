import 'package:flutter/material.dart';

// Utilities
import 'package:animelist/app/utils/size_config.dart';

// Global Widgets
import 'package:animelist/app/global_widgets/star_rating.dart';

// Libraries
import 'package:shimmer/shimmer.dart';

class MediaItemLoading extends StatelessWidget {
  MediaItemLoading({Key key}) : super(key: key);

  // ====================================================================
  // Build Widget
  // ====================================================================
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      width: _widthContainer(),
      margin: EdgeInsets.only(
        right: SizeConfig.safeBlockHorizontal * 5,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _thumbnailMovie(),
          _titleMovie(context),
          StarRating(
            loading: true,
          ),
        ],
      ),
    );
  }

  // ====================================================================
  // Thumbnail Movie
  // ====================================================================
  Widget _thumbnailMovie() {
    // Size Thumbnail (Responsive)
    double _widthThumbnail = SizeConfig.safeBlockHorizontal * 35;
    double _heightThumbnail = SizeConfig.safeBlockVertical * 21;
    if (SizeConfig.orientation == Orientation.landscape) {
      _widthThumbnail = SizeConfig.safeBlockHorizontal * 23;
      _heightThumbnail = SizeConfig.safeBlockVertical * 45;
    }

    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[50],
      child: Container(
        width: _widthThumbnail,
        height: _heightThumbnail,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  // ====================================================================
  // Title Movie
  // ====================================================================
  Widget _titleMovie(BuildContext context) {
    // Size Thumbnail (Responsive)
    double _widthContainer = SizeConfig.safeBlockHorizontal * 30;
    double _heightContainer = SizeConfig.safeBlockVertical * 2;
    if (SizeConfig.orientation == Orientation.landscape) {
      _widthContainer = SizeConfig.safeBlockHorizontal * 20;
      _heightContainer = SizeConfig.safeBlockVertical * 5;
    }

    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[50],
      child: Container(
        width: _widthContainer,
        height: _heightContainer,
        margin: EdgeInsets.only(
          top: SizeConfig.safeBlockVertical * 1.5,
        ),
        color: Colors.white,
      ),
    );
  }

  // ====================================================================
  // Width Container (Responsive)
  // ====================================================================
  double _widthContainer() {
    if (SizeConfig.orientation == Orientation.landscape) {
      return SizeConfig.safeBlockHorizontal * 23;
    }

    return SizeConfig.safeBlockHorizontal * 35;
  }
}
