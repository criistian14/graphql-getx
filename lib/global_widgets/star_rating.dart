import 'package:flutter/material.dart';

// Utilities
import 'package:animelist/app_config.dart';
import 'package:animelist/utils/size_config.dart';

// Libraries
import 'package:shimmer/shimmer.dart';

class StarRating extends StatefulWidget {
  final int rating;
  final bool loading;

  StarRating({
    Key key,
    this.rating,
    this.loading = false,
  }) : super(key: key);

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  // ====================================================================
  // Build Widget
  // ====================================================================
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    if (widget.rating == null) {
      return Container(
        width: _sizeContainer().width,
        height: _sizeContainer().height,
      );
    }

    if (widget.loading) {
      return _loadingStars();
    }

    return Container(
      width: _sizeContainer().width,
      height: _sizeContainer().height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Icon(
            Icons.star,
            size: _sizeIcon(),
            color: _validateColor(index),
          );
        },
        itemCount: 5,
      ),
    );
  }

  // ====================================================================
  // Validate Color Star By Rating
  // ====================================================================
  Color _validateColor(int index) {
    if (widget.rating > index) {
      return Colors.yellow;
    }

    return Colors.yellow[100];
  }

  // ====================================================================
  // Size Container (Responsive)
  // ====================================================================
  Size _sizeContainer() {
    if (SizeConfig.orientation == Orientation.landscape) {
      return Size(
        SizeConfig.safeBlockHorizontal * 11,
        SizeConfig.safeBlockVertical * 6,
      );
    }

    return Size(
      SizeConfig.safeBlockHorizontal * 20,
      SizeConfig.safeBlockVertical * 2,
    );
  }

  // ====================================================================
  // Size Icon Star (Responsive)
  // ====================================================================
  double _sizeIcon() {
    if (SizeConfig.orientation == Orientation.landscape) {
      return SizeConfig.safeBlockHorizontal * 2.2;
    }

    return SizeConfig.safeBlockHorizontal * 4;
  }

  // ====================================================================
  // If loading stars
  // ====================================================================
  Widget _loadingStars() {
    return Shimmer.fromColors(
      baseColor: AppConfig.baseLoadingColor,
      highlightColor: AppConfig.highlightLoadingColor,
      child: Container(
        width: _sizeContainer().width,
        height: _sizeContainer().height,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Icon(
              Icons.star,
              size: _sizeIcon(),
              color: _validateColor(index),
            );
          },
          itemCount: 5,
        ),
      ),
    );
  }
}
