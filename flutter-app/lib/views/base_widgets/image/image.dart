import 'package:book_net/configs/color_configs.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImage extends StatelessWidget {
  const CustomImage(
      {super.key,
      this.width = 360,
      this.height = 480,
      this.radius = 0,
      required this.imageUrl});
  final int width;
  final int height;
  final double radius;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(
          color: AppColors.greenLightestColor,
        ),
      ),
      errorWidget: (context, url, error) => const Text('error'),
      imageBuilder: (context, imageProvider) => Container(
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(radius.r),
            ),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.fitWidth,
            )),
      ),
    );
  }
}
