import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/configs/style_configs.dart';
import 'package:book_net/dto/news/base_news_dto.dart';
import 'package:book_net/views/base_widgets/bar/bar.dart';
import 'package:book_net/views/home_screen/search_screen/widget/result_user_card/result_user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatefulWidget {
  static const String id = 'SearchScreen';

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List listResult = [];
  @override
  Widget build(BuildContext context) {
    // log('object' + searchController.text);
    onSubmitted(String value) {
      // xu ly search o day
      setState(() {
        listResult = listUser;
      });
    }

    Widget _buildSearchBar() {
      return SizedBox(
        height: 36.h,
        child: TextField(
          autofocus: true,
          onChanged: ((value) => setState(() {})),
          textInputAction: TextInputAction.search,
          onSubmitted: (value) {
            onSubmitted(value);
          },
          controller: searchController,
          decoration: InputDecoration(
            filled: true, //<-- SEE HERE
            suffixIcon: searchController.text != ''
                ? IconButton(
                    onPressed: searchController.clear,
                    icon: const Icon(
                      Icons.clear,
                      color: AppColors.amazonColor,
                      size: 20,
                    ),
                  )
                : const SizedBox.shrink(),
            prefixIcon: const Icon(
              Icons.search_rounded,
              color: AppColors.amazonColor,
              size: 20,
            ),
            fillColor: AppColors.lightestSkyColor,
            border: InputBorder.none,
            hintText: 'Input search... ',
            enabledBorder: UnderlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(AppStyles.radiusXxs),
              ),
              borderSide: BorderSide(width: 1.w, color: Colors.transparent),
            ),
            focusedBorder: UnderlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(AppStyles.radiusXxs),
              ),
              borderSide: BorderSide(width: 1.w, color: Colors.transparent),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, AppStyles.appBarHeight),
        child: Bars(widget: _buildSearchBar()),
      ),
      body: ListView.builder(
          itemCount: listResult.length,
          itemBuilder: ((context, index) => ResultUserCard(
                user: listResult[index],
              ))),
    );
  }
}
