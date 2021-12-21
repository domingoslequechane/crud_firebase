import 'package:crud_firebase/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String? uid;
  const AppBarWidget({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: uid == null ? AppColors.white : AppColors.blueDark900,
      iconTheme: IconThemeData(
        color: uid == null ? AppColors.black : AppColors.white,
      ),
      elevation: 0,
    );
  }
}
