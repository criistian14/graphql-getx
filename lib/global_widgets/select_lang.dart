import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Utilities
import 'package:animelist/utils/size_config.dart';

// Libraries
import 'package:get/get.dart';

class SelectLang extends StatelessWidget {
  const SelectLang({Key key}) : super(key: key);

  // ====================================================================
  // Build Widget
  // ====================================================================
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      child: FlatButton(
        padding: EdgeInsets.zero,
        minWidth: 0,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: _openSheet,
        child: Image.asset(
          _imgLocation(),
        ),
      ),
    );
  }

  // ====================================================================
  // Open Sheet
  // ====================================================================
  void _openSheet() {
    if (Platform.isIOS) {
      var sheet = CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () => _changeLocale(Locale("es", "CO")),
            child: Text("lang_spanish".tr),
          ),
          CupertinoActionSheetAction(
            onPressed: () => _changeLocale(Locale("en", "US")),
            child: Text("lang_english".tr),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Get.back(),
          child: Text("cancel".tr),
        ),
      );

      showCupertinoModalPopup(
        context: Get.overlayContext,
        builder: (context) => sheet,
      );
    }

    var sheet = Container(
      child: Wrap(
        children: [
          ListTile(
            onTap: () => _changeLocale(Locale("es", "CO")),
            leading: Image.asset(
              "assets/images/colombia.png",
              height: SizeConfig.safeBlockVertical * 3.7,
            ),
            title: Text("lang_spanish".tr),
          ),
          ListTile(
            onTap: () => _changeLocale(Locale("en", "US")),
            leading: Image.asset(
              "assets/images/united-states.png",
              height: SizeConfig.safeBlockVertical * 3.7,
            ),
            title: Text("lang_english".tr),
          ),
        ],
      ),
    );

    showModalBottomSheet(
      context: Get.overlayContext,
      builder: (context) => sheet,
    );
  }

  // ====================================================================
  // Change Locale
  // ====================================================================
  void _changeLocale(Locale locale) {
    Get.updateLocale(locale);
    Get.back();
  }

  // ====================================================================
  // Get Image By Language
  // ====================================================================
  String _imgLocation() {
    String text;

    switch (Get.locale.languageCode) {
      case "es":
        text = "assets/images/colombia.png";
        break;

      default:
        text = "assets/images/united-states.png";
    }

    return text;
  }
}
