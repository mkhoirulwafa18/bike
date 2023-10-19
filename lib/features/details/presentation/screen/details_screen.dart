import 'package:auto_route/auto_route.dart';
import 'package:bike/constants/constant.dart';
import 'package:bike/features/details/presentation/screen/widgets/detail_info.dart';
import 'package:bike/features/home/data/bike.dart';
import 'package:bike/shared/theme/app_colors.dart';
import 'package:bike/shared/widgets/base_page.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DetailPage extends StatelessWidget {
  const DetailPage({required this.bike, super.key});
  final Bike bike;
  @override
  Widget build(BuildContext context) {
    return BasePage.noPadding(
      body: Stack(
        children: [
          Positioned(
            top: 50,
            right: -20,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(.2),
              ),
              width: 100,
              height: MediaQuery.of(context).size.width / 1.5,
            ),
          ),
          Positioned(
            top: 120,
            left: 20,
            child: Text(
              bike.name,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: Colors.white.withOpacity(.2),
                    fontSize: 70,
                  ),
            ),
          ),
          Positioned(
            top: 70,
            right: MediaQuery.of(context).size.width * 1.5 / -3,
            child: Hero(
              transitionOnUserGestures: true,
              tag: bike.image,
              child: Image.asset(
                bike.image,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width * 1.5,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  transitionOnUserGestures: true,
                  tag: bike.name,
                  child: Text(
                    bike.name,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                const SizedBox(
                  height: kSpacingLarge,
                ),
                Text(
                  bike.description,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(height: 1.5),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: kSpacingLarge,
                ),
                DetailInfo(
                  engine: bike.engine,
                  weight: bike.weight,
                  topSpeed: bike.topSpeed,
                ),
                const SizedBox(
                  height: kSpacingLarge,
                ),
                Row(
                  children: [
                    IconButton.filled(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_bag_outlined),
                    ),
                    const SizedBox(width: kSpacingMedium),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: SizedBox(
                          height: 60,
                          child: Card(
                            shadowColor: Colors.amber,
                            elevation: 10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'ADD TO CART',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: InkWell(
              onTap: () => context.router.pop(),
              child: Icon(
                Icons.arrow_back_ios,
                size: 30,
                color: AppColors.white.withOpacity(.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
