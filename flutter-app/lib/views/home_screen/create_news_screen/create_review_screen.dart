import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/dto/book/book_dto.dart';
import 'package:book_net/view_models/user/curr_user.dart';
import 'package:book_net/views/base_widgets/button/raised_gradient_button.dart';
import 'package:book_net/views/base_widgets/image/default_circle_avatar.dart';
import 'package:book_net/views/base_widgets/image/image.dart';
import 'package:book_net/views/base_widgets/rating_stars/base_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/style_configs.dart';
import '../../../configs/text_configs.dart';
import '../../base_widgets/bar/bar.dart';

class CreateReviewScreen extends StatefulWidget {
  static const id = 'CreateReviewScreen';
  const CreateReviewScreen({Key? key, required this.book}) : super(key: key);
  final BookDto book;

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  double value = 0;
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      value = widget.book.rate;
    });

    // super.initState();
  }

  _onChangeValue(double? newValue) {
    setState(() {
      value = newValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.book.name);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, AppStyles.appBarHeight),
        child: const Bars(
          title: 'New post',
        ),
      ),
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            SizedBox(
              height: AppStyles.defaultMarginVertical,
            ),
            _buildBookTextField(),
            Button(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBookTextField() {
    return SizedBox(
      // height: 500.h,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomImage(
                imageUrl: widget.book.imageUrl,
                width: 120,
                height: 180,
              ),
              SizedBox(
                height: AppStyles.defaultMarginVertical,
              ),
              Text(
                widget.book.name,
                style: TextConfigs.bold16,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                widget.book.author,
                style: TextConfigs.regular12,
              ),
              SizedBox(
                height: 32.h,
              ),
              BaseRatingStar(
                starSize: 28,
                value: value,
                onValueChanged: _onChangeValue,
              ),
              Padding(
                padding: EdgeInsets.all(AppStyles.defaultMarginVertical),
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: 130.h,
                    width: double.infinity - 32.w,
                    child: TextFormField(
                      style: TextConfigs.regular16,
                      cursorColor: AppColors.green1Color,
                      maxLines: null,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Write a review...',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 40.h,
      padding:
          EdgeInsets.symmetric(horizontal: AppStyles.defaultMarginHorizontal),
      child: Row(
        children: [
          DefaultCircleAvatar(
              width: 40.w,
              height: 40.h,
              imageUrl: CurrUserData().user!.imageUrl),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppStyles.smallMarginHorizontal),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  CurrUserData().user!.alias,
                  style: TextConfigs.regular16,
                ),
                Text(
                  CurrUserData().user!.name,
                  style: TextConfigs.regular14Grey2,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget Button(BuildContext context) {
    return RaisedGradientButton(
      child: Text(
        'Post',
        style: TextConfigs.medium16.copyWith(color: AppColors.whiteColor),
      ),
      gradient: const LinearGradient(
        colors: AppColors.gradientPrimary,
      ),
      onPressed: () => {},
    );
  }
}
