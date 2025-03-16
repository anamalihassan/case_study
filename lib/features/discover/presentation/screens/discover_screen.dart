import 'package:case_study/features/discover/boc/discover_bloc.dart';
import 'package:case_study/features/discover/boc/discover_event.dart';
import 'package:case_study/features/discover/boc/discover_state.dart';
import 'package:case_study/features/discover/data/model/discover_item_dto.dart';
import 'package:case_study/features/discover/presentation/widgets/discover_listing_item_widget.dart';
import 'package:case_study/features/discover/presentation/widgets/header_slider_view.dart';
import 'package:case_study/features/discover/presentation/widgets/tab_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../common/widgets/info_widget.dart';
import '../widgets/search_widget.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  int selectedTabIndex = 0;
  List<DiscoverItemDto> discoverItems = [];

  void fetchData() async {
    Future.delayed(const Duration(seconds: 1), () {
      context.read<DiscoverBloc>().add(FetchDiscoverWorkplacesDataEvent());
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tabButtonWidth = MediaQuery.of(context).size.width / 2;
    return Container(
      color: AppColors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: SearchWidget(),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: HeaderSliderView(),
            ),
            Row(
              children: [
                TabButtonWidget(
                  title: AppLocalizations.of(Get.context!)!.discover,
                  isSelected: selectedTabIndex == 0,
                  width: tabButtonWidth,
                  onTap: () {
                    if (selectedTabIndex != 0) {
                      setState(() {
                        selectedTabIndex = 0;
                      });
                    }
                  },
                ),
                TabButtonWidget(
                  title: AppLocalizations.of(Get.context!)!.favourites,
                  isSelected: selectedTabIndex == 1,
                  width: tabButtonWidth,
                  onTap: () {
                    if (selectedTabIndex != 1) {
                      setState(() {
                        selectedTabIndex = 1;
                      });
                    }
                  },
                )
              ],
            ),
            if (selectedTabIndex == 0)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: _buildDiscoverListingBloc(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiscoverListingBloc() {
    return BlocBuilder<DiscoverBloc, DiscoverState>(
      builder: (context, state) {
        if (state is FetchDiscoverWorkplacesDataSuccess) {
          discoverItems = state.discoverItems;
        } else if (state is FetchDiscoverWorkplacesDataFailure) {
          return InfoWidget(
            title: AppLocalizations.of(context)!.failureTitle,
            message: state.networkException.statusMessage ?? AppLocalizations.of(context)!.tryAgainMessage,
          );
        } else if (state is FetchDiscoverWorkplacesDataLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.separated(
          itemCount: discoverItems.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return DiscoverListingItemWidget(discoverItemDto: discoverItems[index]);
          },
          separatorBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              color: AppColors.dividerGrey,
              height: 1,
            );
          },
        );
      },
    );
  }
}
