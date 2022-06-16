import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/configs/style_configs.dart';
import 'package:book_net/dto/book/book_dto.dart';
import 'package:book_net/dto/news/base_news_dto.dart';
import 'package:book_net/dto/user/user_dto.dart';
import 'package:book_net/views/base_widgets/bar/bar.dart';
import 'package:book_net/views/base_widgets/book/book.dart';
import 'package:book_net/views/base_widgets/empty_book/empty_book.dart';
import 'package:flutter/material.dart';

class BookShelfScreen extends StatelessWidget {
  static const id = "BookShelfScreen";

  const BookShelfScreen({super.key, required this.user});
  final UserDto user;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, AppStyles.appBarHeight),
          child: Bars(
            title: "${user.alias}'s book shelf",
          ),
        ),
        body: Column(children: [
          SizedBox(
            height: 50,
            child: AppBar(
              backgroundColor: AppColors.whiteColor,
              bottom: const TabBar(
                indicatorColor: AppColors.amazonColor,
                labelColor: AppColors.amazonColor,
                unselectedLabelColor: AppColors.oceanGreenColor,
                tabs: [
                  Tab(text: 'To read'),
                  Tab(text: 'Reading'),
                  Tab(text: 'Read'),
                ],
              ),
            ),
          ),

          // create widgets for each tab bar here
          Expanded(
            child: TabBarView(
              children: [
                // first tab bar view widget
                Container(
                  color: AppColors.whiteColor,
                  child: Center(child: _buildBookShelf(listBook)),
                ),

                // second tab bar viiew widget
                Container(
                  color: AppColors.whiteColor,
                  child: Center(child: _buildBookShelf(listBook)),
                ),
                Container(
                  color: AppColors.whiteColor,
                  child: Center(child: _buildBookShelf(listBook)),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildBookShelf(List<BookDto> listBook) {
    if (listBook.isEmpty) return const EmptyBook();
    return Expanded(
      // height: 340.h,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: listBook.length,
          itemBuilder: (context, i) {
            return Book(
              isHorizontal: true,
              book: listBook[i],
            );
          }),
    );
  }
}
