import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/configs/style_configs.dart';
import 'package:book_net/configs/text_configs.dart';
import 'package:book_net/dto/news/base_news_dto.dart';
import 'package:book_net/view_models/guild_bloc/guild_event.dart';
import 'package:book_net/view_models/guild_bloc/guild_state.dart';
import 'package:book_net/view_models/status.dart';
import 'package:book_net/views/base_widgets/bar/bar.dart';
import 'package:book_net/views/base_widgets/guild/guild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../view_models/guild_bloc/guild_bloc.dart';

class GuildScreen extends StatelessWidget {
  static const id = "GuildScreen";
  const GuildScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GuildBloc()..add(const GetAllGuildEvent()),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, AppStyles.appBarHeight),
          child: const Bars(
            title: 'Guild',
            leading: SizedBox(),
          ),
        ),
        body: BlocBuilder<GuildBloc, GuildState>(
          builder: (context, state) {
            switch (state.status) {
              case Status.inProgress:
                return const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: AppColors.green1Color,
                  ),
                );
              case Status.success:
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(24.h),
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 250,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.result.length,
                        itemBuilder: (context, i) {
                          return SizedBox(
                            child: Guild(
                              guild: state.result[i],
                            ),
                          );
                        }),
                  ),
                );
              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
