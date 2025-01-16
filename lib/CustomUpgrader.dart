import 'package:flutter/material.dart';
import 'package:indian_talent_olympiad/components/upgrader_widget.dart';
import 'package:upgrader/upgrader.dart';


class CustomUpgrader extends Upgrader {
  CustomUpgrader({super.debugLogging, super.debugDisplayAlways});

  @override
  void showTheDialog({required BuildContext context}) async {
   if (shouldDisplayUpgrade()) {
      // Show bottom sheet
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
        ),
        builder: (context) => UpgraderWidget(),
      );
    } else {
      debugPrint('No upgrade required. App is up to date.');
    }
  }
}
