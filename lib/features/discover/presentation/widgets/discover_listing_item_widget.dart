import 'package:case_study/core/constants/app_icons.dart';
import 'package:case_study/features/common/widgets/app_images.dart';
import 'package:case_study/features/discover/data/model/discover_item_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_fonts.dart';
import '../../../../core/theme/custom_theme.dart';

class DiscoverListingItemWidget extends StatelessWidget {
  const DiscoverListingItemWidget({
    super.key,
    required this.discoverItemDto,
  });

  final DiscoverItemDto discoverItemDto;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 120,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: discoverItemDto.images?.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(left: index == 0 ? 16.0 : 4.0, right: index == discoverItemDto.images!.length - 1 ? 16.0 : 4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: AppImages.getCachedImage(
                    imageUrl: discoverItemDto.images![index],
                    width: 106,
                    height: 106,
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Text(
                  discoverItemDto.name ?? "-",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: AppFonts.bodySize,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Row(
                  children: [
                    SvgPicture.asset(iconStar, height: 16, width: 16, fit: BoxFit.scaleDown),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        "${discoverItemDto.rating} (${discoverItemDto.totalReviews} reviews)",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: AppFonts.captionSize,
                          color: Theme.of(context).extension<CustomAppTheme>()?.textBodyColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Text(
                  discoverItemDto.address ?? "-",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: AppFonts.captionSize,
                    color: Theme.of(context).extension<CustomAppTheme>()?.secondaryColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Row(
                  children: [
                    SvgPicture.asset(iconPersonSimpleWalk, height: 16, width: 16, fit: BoxFit.scaleDown),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        discoverItemDto.distance ?? "-",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: AppFonts.captionSize,
                          color: Theme.of(context).extension<CustomAppTheme>()?.secondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
