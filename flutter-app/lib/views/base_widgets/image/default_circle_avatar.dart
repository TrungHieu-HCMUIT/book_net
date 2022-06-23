import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/color_configs.dart';

class DefaultCircleAvatar extends StatelessWidget {
  const DefaultCircleAvatar(
      {super.key, this.width = 64, this.height = 64, required this.imageUrl});
  final double width;
  final double height;
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return (imageUrl == null)
        ? _buildDefaultAvatar()
        : SizedBox(
            height: height,
            child: CachedNetworkImage(
              imageUrl: imageUrl!,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  color: AppColors.greenLightestColor,
                ),
              ),
              errorWidget: (context, url, error) => _buildDefaultAvatar(),
              imageBuilder: (context, imageProvider) => SizedBox(
                height: height.h,
                width: width.w,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl!),
                ),
              ),
            ),
          );
  }

  Widget _buildDefaultAvatar() {
    return SizedBox(
      height: height,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(width.w),
          child: Image.asset(
            'assets/images/default_avatar.png',
          )),
    );
  }
}
