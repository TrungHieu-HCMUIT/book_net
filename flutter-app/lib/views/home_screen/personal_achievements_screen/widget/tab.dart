import 'package:book_net/configs/color_configs.dart';
import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Column(children: [
        SizedBox(
          height: 50,
          child: AppBar(
            backgroundColor: AppColors.whiteColor,
            bottom: const TabBar(
              indicatorColor: AppColors.amazonColor,
              labelColor: AppColors.amazonColor,
              automaticIndicatorColorAdjustment: false,
              unselectedLabelColor: AppColors.amazonColor,
              tabs: [
                Tab(text: 'To read'),
                Tab(text: 'Reading'),
                Tab(text: 'Read'),
              ],
            ),
          ),
        ),

        // create widgets for each tab bar here
        TabBarView(
          children: [
            // first tab bar view widget
            Container(
              color: AppColors.whiteColor,
              child: const Center(
                child: Text(
                  'To read',
                ),
              ),
            ),

            // second tab bar viiew widget
            Container(
              color: AppColors.whiteColor,
              child: const Center(
                child: Text(
                  'Reading',
                ),
              ),
            ),
            Container(
              color: AppColors.whiteColor,
              child: const Center(
                child: Text(
                  'Read',
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
