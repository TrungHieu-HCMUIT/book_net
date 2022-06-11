import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/color_configs.dart';

class DefaultCircleAvatar extends StatelessWidget {
  const DefaultCircleAvatar(
      {super.key,
      required this.width,
      required this.height,
      required this.imageUrl});
  final double width;
  final double height;
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return (imageUrl == null)
        ? _buildDefaultAvatar()
        : CachedNetworkImage(
            imageUrl: imageUrl!,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(
                color: AppColors.greenLightestColor,
              ),
            ),
            errorWidget: (context, url, error) => _buildDefaultAvatar(),
            imageBuilder: (context, imageProvider) => SizedBox(
              height: height,
              width: width,
              child: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl!),
              ),
            ),
          );
  }

  Widget _buildDefaultAvatar() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(width),
        child: Image.asset(
          'assets/images/default_avatar.png',
        ));
  }
}
