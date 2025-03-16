import 'package:carousel_slider/carousel_slider.dart';
import 'package:case_study/core/constants/app_colors.dart';
import 'package:case_study/features/discover/boc/discover_event.dart';
import 'package:case_study/features/discover/presentation/widgets/header_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../common/widgets/info_widget.dart';
import '../../boc/discover_bloc.dart';
import '../../boc/discover_state.dart';
import '../../data/model/discover_item_dto.dart';

class HeaderSliderView extends StatefulWidget {
  const HeaderSliderView({super.key});

  @override
  State<HeaderSliderView> createState() => _HeaderSliderViewState();
}

class _HeaderSliderViewState extends State<HeaderSliderView> {
  int _currentSliderPage = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  List<DiscoverItemDto> discoverItems = [];

  void fetchData() async {
    context.read<DiscoverBloc>().add(FetchDiscoverHeaderPromotionDataEvent());
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverBloc, DiscoverState>(
      builder: (context, state) {
        if (state is FetchDiscoverHeaderPromotionDataSuccess) {
          discoverItems = state.discoverItems;
        } else if (state is FetchDiscoverHeaderPromotionDataFailure) {
          return InfoWidget(
            title: AppLocalizations.of(context)!.failureTitle,
            message: state.networkException.statusMessage ?? AppLocalizations.of(context)!.tryAgainMessage,
          );
        } else if (state is FetchDiscoverHeaderPromotionDataLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return _buildHeaderSliderWidget();
      },
    );
  }

  Widget _buildHeaderSliderWidget() {
    return Stack(
      children: [
        CarouselSlider(
          items: discoverItems.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return HeaderItemWidget(discoverItemDto: item);
              },
            );
          }).toList(),
          options: CarouselOptions(
              height: 196,
              aspectRatio: 16 / 9,
              viewportFraction: 1.0,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentSliderPage = index;
                });
              }),
        ),
        Positioned(
          bottom: 24,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: discoverItems.asMap().entries.map((entry) {
              if (_currentSliderPage != entry.key) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 6.0,
                    height: 6.0,
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(shape: BoxShape.circle, color: (Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white).withOpacity(0.5)),
                  ),
                );
              }
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 18.0,
                  height: 6.0,
                  margin: const EdgeInsets.only(top: 0.0, left: 4.0, right: 4.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: AppColors.backgroundGreen,
                  ),
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
