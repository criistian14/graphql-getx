import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Global Widget
import 'package:animelist/app/global_widgets/change_theme.dart';
import 'package:animelist/app/global_widgets/select_lang.dart';

// Utilities
import 'package:animelist/app/utils/size_config.dart';

// Libraries
import 'package:get/get.dart';

class TopCardHome extends StatelessWidget {
  TopCardHome({Key key}) : super(key: key);

  // ====================================================================
  // Build Widget
  // ====================================================================
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      width: SizeConfig.safeBlockHorizontal * 100,
      height: SizeConfig.safeBlockVertical * 25,
      padding: EdgeInsets.only(
        bottom: SizeConfig.safeBlockVertical * 4,
        left: SizeConfig.safeBlockHorizontal * 14,
        right: SizeConfig.safeBlockHorizontal * 10,
        top: MediaQuery.of(context).padding.top,
      ),
      color: Theme.of(context).primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _actions(),
          _titleHome(context),
          _search(),
        ],
      ),
    );
  }

  // ====================================================================
  // Title Home
  // ====================================================================
  Widget _titleHome(BuildContext context) {
    // Font Size Title (Responsive)
    double _fontSize = SizeConfig.safeBlockHorizontal * 5.7;
    // Height Titlte (Responsive)
    double _heightSize = SizeConfig.safeBlockVertical * 0.19;
    if (SizeConfig.orientation == Orientation.landscape) {
      _fontSize = SizeConfig.safeBlockHorizontal * 3.9;
      _heightSize = SizeConfig.safeBlockVertical * .3;
    }

    return Container(
      child: Text(
        "home_title".tr,
        style: Theme.of(context).textTheme.headline1.merge(
              TextStyle(
                fontSize: _fontSize,
                height: _heightSize,
              ),
            ),
      ),
    );
  }

  // ====================================================================
  // Search
  // ====================================================================
  Widget _search() {
    // Height Container Search (Responsive)
    double _heightContainerSearch = SizeConfig.safeBlockVertical * 4;
    if (SizeConfig.orientation == Orientation.landscape) {
      _heightContainerSearch = SizeConfig.safeBlockVertical * 9.4;
    }

    return Container(
      height: _heightContainerSearch,
      margin: EdgeInsets.only(
        top: SizeConfig.safeBlockVertical * 2,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          hintText: "search".tr,
          prefixIcon: _iconSearch(),
        ),
      ),
    );
  }

  // ====================================================================
  // Actions
  // ====================================================================
  Widget _actions() {
    // Height Container Actions (Responsive)
    double _heightContainerIcon = SizeConfig.safeBlockVertical * 3.4;
    if (SizeConfig.orientation == Orientation.landscape) {
      _heightContainerIcon = SizeConfig.safeBlockVertical * 9;
    }

    return Container(
      height: _heightContainerIcon,
      width: SizeConfig.safeBlockHorizontal * 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Select Lang app
          SelectLang(),

          // Change Theme (Dark or Light)
          ChangeTheme(),
        ],
      ),
    );
  }

  // ====================================================================
  // Icon Search (iOS or Android)
  // ====================================================================
  Widget _iconSearch() {
    if (Platform.isIOS) return Icon(CupertinoIcons.search);

    return Icon(Icons.search);
  }
}
