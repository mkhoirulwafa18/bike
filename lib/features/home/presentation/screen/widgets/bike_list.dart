import 'dart:math' as math;
import 'package:auto_route/auto_route.dart';
import 'package:bike/constants/constant.dart';
import 'package:bike/features/home/data/bike.dart';
import 'package:bike/features/home/presentation/screen/widgets/card_list.dart';
import 'package:bike/routes/app_route.dart';
import 'package:bike/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BikeList extends StatelessWidget {
  const BikeList({
    required this.pageController,
    required this.bikeList,
    super.key,
  });

  final PageController pageController;
  final List<Bike> bikeList;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50,
      right: 20,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.57,
        width: 300,
        child: PageView.builder(
          clipBehavior: Clip.none,
          physics: const BouncingScrollPhysics(),
          controller: pageController,
          itemCount: bikeList.length,
          itemBuilder: (context, index) {
            return AnimatedBuilder(
              animation: pageController,
              builder: (context, child) {
                var pageOffset = 0.0;
                if (pageController.position.haveDimensions) {
                  pageOffset = pageController.page! - index.toDouble();
                }
                final gauss =
                    math.exp(-(math.pow(pageOffset.abs() - 0.5, 2) / 0.08));
                return Transform.translate(
                  offset: Offset(-32 * gauss * pageOffset.sign, 0),
                  child: GestureDetector(
                    onTap: () =>
                        context.router.push(DetailRoute(bike: bikeList[index])),
                    child: Column(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Card(
                              shadowColor: Colors.amber,
                              elevation: 10,
                              child: SizedBox(
                                width: 210,
                                height: 350,
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '⭐ ${bikeList[index].rating}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                          ),
                                          IconButton.outlined(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.favorite_border,
                                              size: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Hero(
                                                transitionOnUserGestures: true,
                                                tag: bikeList[index].name,
                                                child: Text(
                                                  bikeList[index].name,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: kSpacingXSmall,
                                              ),
                                              Text(
                                                '\$${bikeList[index].price}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                      color: AppColors.white
                                                          .withOpacity(.5),
                                                    ),
                                              ),
                                            ],
                                          ),
                                          IconButton.outlined(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.shopping_bag_outlined,
                                              size: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Hero(
                              transitionOnUserGestures: true,
                              tag: bikeList[index].image,
                              child: Image.asset(
                                bikeList[index].image,
                                fit: BoxFit.cover,
                                width: 310,
                                alignment: Alignment(pageOffset, 0),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: kSpacingMedium),
                        CardList(
                          engine: bikeList[index].engine,
                          weight: bikeList[index].weight,
                          topSpeed: bikeList[index].topSpeed,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
