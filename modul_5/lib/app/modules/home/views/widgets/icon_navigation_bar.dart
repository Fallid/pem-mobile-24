import 'package:flutter/material.dart';

import '../../../../utils/resources.dart';

class IconNavigationBar extends StatelessWidget {
 final IconData icon;

  const IconNavigationBar({required this.icon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 30,
      color: Resources.color.whiteColor,
    );
  }
}
