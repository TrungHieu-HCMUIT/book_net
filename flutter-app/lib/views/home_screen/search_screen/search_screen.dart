import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/configs/style_configs.dart';
import 'package:book_net/views/base_widgets/bar/bar.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, AppStyles.appBarHeight),
        child: Bars(
          widget:
              // const Text('dsd'),
              TextField(
            controller: searchController,
            decoration: InputDecoration(
              filled: true, //<-- SEE HERE
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_rounded,
                  color: AppColors.amazonColor,
                ),
              ),

              fillColor: AppColors.lightestSkyColor,
              border: InputBorder.none,
              hintText: 'Input search... ',

              focusedBorder: UnderlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(AppStyles.radiusXxs),
                ),
                borderSide: BorderSide(width: 1.w, color: Colors.transparent),
              ),
            ),
          ),
          // CustomTextField
          //     CustomTextField(
          //   text: 'Current password',
          //   controller: searchController,
          //   validator: null,
          // ),
          // list: [
          //   CustomIconButton(
          //       icon: Image.asset('assets/icons/ic_search.png'),
          //       color: AppColors.whiteColor,
          //       onPressed: () => {
          //             // Navigator.pushNamed(context, SearchScreen.id),
          //           })
          // ],
        ),
      ),
    );
  }
}
