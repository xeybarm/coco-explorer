import 'package:coco_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(8.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.appBarColor,
      elevation: 0,
      title: const Text('COCO Explorer'),
    );
  }
}
