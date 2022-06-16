import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../configs/color_configs.dart';
import '../../../configs/style_configs.dart';
import '../../../configs/text_configs.dart';
import '../../base_widgets/button/raised_gradient_button.dart';

class ImageAndPostWidget extends StatefulWidget {
  const ImageAndPostWidget({Key? key, required this.onPostTap})
      : super(key: key);

  final Function(List<File> images) onPostTap;

  @override
  State<ImageAndPostWidget> createState() => _ImageAndPostWidgetState();
}

class _ImageAndPostWidgetState extends State<ImageAndPostWidget> {
  int _activeIndex = 0;
  final ImagePicker _imagePicker = ImagePicker();
  final List<XFile> _imageXFilesList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CarouselSlider.builder(
              itemCount: _imageXFilesList.length,
              options: _buildImageOption(_imageXFilesList.length),
              itemBuilder: (context, index, realIndex) {
                int totalImage = _imageXFilesList.length;
                return (totalImage > 0)
                    ? _buildImage(_imageXFilesList[index])
                    : const SizedBox();
              },
            ),
            (_imageXFilesList.length > 1)
                ? Padding(
                    padding:
                        EdgeInsets.only(bottom: AppStyles.smallMarginVertical),
                    child: AnimatedSmoothIndicator(
                      activeIndex: _activeIndex,
                      count: _imageXFilesList.length,
                      effect: WormEffect(
                          dotColor: AppColors.grayColor,
                          activeDotColor: AppColors.green1Color,
                          dotWidth: 6.w,
                          dotHeight: 6.h),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
        GestureDetector(
          onTap: () => _selectImage(),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppStyles.defaultMarginHorizontal,
                vertical: AppStyles.smallMarginVertical),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add to post',
                  style: TextConfigs.semibold16DarkGrey,
                ),
                SizedBox(
                  width: 24.w,
                  child: Image.asset(
                    'assets/icons/ic_image.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppStyles.defaultMarginHorizontal),
          child: RaisedGradientButton(
              child: Text(
                'Post',
                style:
                    TextConfigs.medium16.copyWith(color: AppColors.whiteColor),
              ),
              gradient: const LinearGradient(
                colors: AppColors.gradientPrimary,
              ),
              onPressed: () {
                List<File> imageFiles = [];
                for (XFile xFile in _imageXFilesList) {
                  imageFiles.add(File(xFile.path));
                }
                widget.onPostTap.call(imageFiles);
              }),
        ),
      ],
    );
  }

  CarouselOptions _buildImageOption(int imageListLength) {
    double viewportFraction = (imageListLength > 1) ? 0.85 : 1;
    return CarouselOptions(
      height: 232.h,
      enlargeCenterPage: true,
      viewportFraction: viewportFraction,
      enableInfiniteScroll: false,
      onPageChanged: (index, reason) => setState(() {
        _activeIndex = index;
      }),
    );
  }

  Widget _buildImage(XFile file) {
    return SizedBox(
      width: double.infinity,
      child: Image.file(
        File(file.path),
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  void _selectImage() async {
    final List<XFile>? selectedImage = await _imagePicker.pickMultiImage();
    if (selectedImage == null) {
      return;
    }

    if (selectedImage.isNotEmpty) {
      setState(() {
        _imageXFilesList.clear();
        _imageXFilesList.addAll(selectedImage);
      });
    }
  }
}
