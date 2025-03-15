import 'package:case_study/features/discover/presentation/widgets/tab_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/search_widget.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabButtonWidth = MediaQuery.of(context).size.width / 2;
    return Container(
      color: AppColors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: SearchWidget(),
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
            ListView.separated(
              itemCount: 100,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('$index workplace'),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
            ),
          ],
        ),
      ),
    );
  }
}
