import 'package:case_study/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_fonts.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/theme/custom_theme.dart';
import '../../../common/widgets/app_images.dart';
import '../../data/model/discover_item_dto.dart';

class HeaderItemWidget extends StatelessWidget {
  const HeaderItemWidget({
    super.key,
    required this.discoverItemDto,
  });

  final DiscoverItemDto discoverItemDto;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppImages.getCachedImage(
          imageUrl: discoverItemDto.thumbnail ?? "",
          width: MediaQuery.of(context).size.width,
          height: 196,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            color: AppColors.white,
            width: MediaQuery.of(context).size.width * 0.525,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
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
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w400,
                      fontSize: AppFonts.captionSize,
                      color: Theme.of(context).extension<CustomAppTheme>()?.secondaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
