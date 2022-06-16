import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/configs/style_configs.dart';
import 'package:book_net/configs/text_configs.dart';
import 'package:book_net/dto/book/book_dto.dart';
import 'package:book_net/views/base_widgets/image/image.dart';
import 'package:book_net/views/base_widgets/rating_stars/base_rating_stars.dart';
import 'package:book_net/views/home_screen/detail_book_screen/detail_book_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Book extends StatelessWidget {
  const Book(
      {super.key,
      required this.book,
      this.progress = -1,
      this.isHorizontal = false});
  final BookDto book;
  final bool isHorizontal;
  final double progress;
  @override
  Widget build(BuildContext context) {
    onTap() {
      print('object' + book.name);
      Navigator.pushNamed(context, DetailBookScreen.id, arguments: book);
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(right: 8.h),
        decoration: const BoxDecoration(color: AppColors.whiteColor),
        child: SizedBox(
          width: 140.w,

          // height: 284.h,
          child: isHorizontal ? _buildHorizontal() : _buildVertical(),
        ),
      ),
    );

    //  isHorizontal ? _buildHorizontal() : _buildVertical();
  }

  Widget _buildVertical() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImage(
            imageUrl: book.imageUrl,
            height: 188,
            width: 140,
            radius: AppStyles.radiusXss,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildInformation(),
          ),
        ]);
  }

  Widget _buildHorizontal() {
    return Container(
      padding: EdgeInsets.all(16.h),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImage(
              imageUrl: book.imageUrl,
              height: 188,
              width: 140,
              radius: AppStyles.radiusXss,
            ),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildInformation()),
            ),
          ]),
    );
  }

  List<Widget> _buildInformation() {
    return [
      Text(
        book.name,
        style: TextConfigs.bold16,
      ),
      SizedBox(
        height: 4.h,
      ),
      Text(book.author,
          style:
              TextConfigs.regular12.copyWith(color: AppColors.darkGrayColor)),
      SizedBox(
        height: 8.h,
      ),
      BaseRatingStar(
        value: book.rate,
      ),
      SizedBox(
        height: 4.h,
      ),
      Text(
        book.numberOfRating.toString() + ' votes',
        style: TextConfigs.regular10.copyWith(color: AppColors.darkGrayColor),
      ),
      SizedBox(
        height: 16.h,
      ),
      _buildProgress()
    ];
  }

  Widget _buildProgress() {
    return progress >= 0
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 112.w,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40.0))),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: LinearProgressIndicator(
                    minHeight: 10.h,
                    value: progress >= 0 ? (progress / 100) : 0,
                    color: AppColors.oceanGreenColor,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.oceanGreenColor),
                    backgroundColor: AppColors.lightGrayColor,
                  ),
                ),
              ),
              // const SizedBox.expand(),
              // SizedBox(
              //   width: 4.w,
              // ),
              Text(
                progress.round().toString() + '%',
                style: TextConfigs.regular12,
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
