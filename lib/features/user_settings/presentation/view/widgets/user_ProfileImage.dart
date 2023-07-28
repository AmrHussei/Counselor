import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/assets_data.dart';

class UserProfileImage extends StatelessWidget {
  const UserProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: const AssetImage(
            AssetsData.amr,
          ),
          maxRadius: 60.w,
          minRadius: 57.w,
        ),
      ],
    );
  }
}
