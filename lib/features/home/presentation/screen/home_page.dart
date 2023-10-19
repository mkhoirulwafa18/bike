import 'package:auto_route/auto_route.dart';
import 'package:bike/features/home/home.dart';
import 'package:bike/features/home/presentation/screen/widgets/bike_list.dart';
import 'package:bike/features/home/presentation/screen/widgets/navrail.dart';
import 'package:bike/shared/theme/app_colors.dart';
import 'package:bike/shared/widgets/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late PageController popularPageController;
  late PageController newArrivalPageController;
  late PageController bestSalePageController;

  @override
  void initState() {
    super.initState();
    popularPageController = PageController();
    newArrivalPageController = PageController();
    bestSalePageController = PageController();
  }

  @override
  void dispose() {
    popularPageController.dispose();
    newArrivalPageController.dispose();
    bestSalePageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(navigationIndexProvider);
    final bikeList = ref.watch(bikeProvider);
    return BasePage.noPadding(
      body: Stack(
        children: [
          Visibility(
            visible: selectedIndex == 0,
            child: BikeList(
              pageController: newArrivalPageController,
              bikeList: bikeList[0],
            ),
          ),
          Visibility(
            visible: selectedIndex == 1,
            child: BikeList(
              pageController: popularPageController,
              bikeList: bikeList[1],
            ),
          ),
          Visibility(
            visible: selectedIndex == 2,
            child: BikeList(
              pageController: bestSalePageController,
              bikeList: bikeList[2],
            ),
          ),
          NavRail(selectedIndex: selectedIndex),
          Positioned(
            top: 40,
            left: 10,
            child: Icon(
              Icons.blur_on,
              size: 50,
              color: AppColors.white.withOpacity(.5),
            ),
          ),
          Positioned(
            top: 40,
            right: 16,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Positioned(
            top: 150,
            left: 20,
            child: Text(
              'BIKES\nCOLLECTION',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
        ],
      ),
    );
  }
}
