import 'package:case_study/features/discover/data/model/discover_item_dto.dart';
import 'package:case_study/features/discover/presentation/widgets/discover_listing_item_widget.dart';
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
            if (selectedTabIndex == 0)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ListView.separated(
                  itemCount: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return DiscoverListingItemWidget(
                        discoverItemDto: DiscoverItemDto(
                      name: "Workflow coworking space",
                      rating: "4,5",
                      totalReviews: "2,3k",
                      address: "2972 Westheimer Rd. Santa Ana, Illinois 85486 ",
                      distance: "12 mins away",
                      images: [
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRIdlSHHfXm8huSipD0zbQWx9M46YlAz_4UA&s",
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmEycEAFZejXANuC-pFHTYeiqckr2BQBSSKg&s",
                        "https://cdn.prod.website-files.com/605baba32d94435376625d33/65140a113ae5c3d234d3bda3_cebu_cowork-workplace_cafe_ramos.jpg",
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqFekJ2Hz64XqlcuTLPtso90EJySQAUdHS0Q&s",
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYcwJ2w58MvhvdNH4ziqZSY_ZwstEdJqmFPw&s",
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6icCpJIHvnl-iwCFg7nvhY7HmjS9Y-rK6hg&s",
                        "https://www.visitdubai.com/-/media/gathercontent/article/c/coworking-space/coworking-space-modern-working-website.jpg?rev=aa3d1d122684480a86984660cbda4ab2&cx=0.5&cy=0.5&cw=1180&ch=590",
                        "https://images.squarespace-cdn.com/content/v1/5866ad621b631bf419f9c2d9/1707517818179-BY2IM8DTK1E440GNNDN9/20190808_CLOUDROOM_GILLETT-7367.jpg?format=1000w",
                      ],
                    ));
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 16.0),
                      color: AppColors.dividerGrey,
                      height: 1,
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
