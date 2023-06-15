import 'package:ehoa/app/components/headings.dart';
import 'package:ehoa/config/translations/strings_enum.dart';
import 'package:ehoa/utils/constants.dart';
import 'package:flutter/material.dart';

class GoodJobDialog extends StatelessWidget {
  const GoodJobDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          Image.asset(AppImages.gdjdlgdsg),
          headingText(Strings.miharo)
        ],
      ),
    );
  }
}