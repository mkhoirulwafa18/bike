import 'package:auto_route/auto_route.dart';
import 'package:bike/features/home/home.dart';
// import 'package:bike/l10n/l10n.dart';
// import 'package:bike/routes/app_route.dart';
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
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final l10n = context.l10n;
    final selectedIndex = ref.watch(navigationIndexProvider);
    // final router = context.router;
    return BasePage.noPadding(
      body: Stack(
        children: [
          Positioned(
            bottom: 50,
            right: 20,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.57,
              width: 300,
              child: PageView.builder(
                clipBehavior: Clip.none,
                physics: const BouncingScrollPhysics(),
                controller: pageController,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Card(
                            child: SizedBox(
                              width: 210,
                              height: 350,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '⭐ 4.5',
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
                                    Text(
                                      'NMAX',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Rp.35jt',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                color: AppColors.white
                                                    .withOpacity(.5),
                                              ),
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
                              // IconButton(
                              //   onPressed: () {},
                              //   icon: const Icon(Icons.favorite_border),
                              // ),
                            ),
                          ),
                          Image.asset(
                            'assets/images/1.png',
                            fit: BoxFit.cover,
                            width: 310,
                          ),
                          // Positioned(
                          //   top: 20,
                          //   left: 50,
                          //   child:
                          // ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 70,
                            height: 70,
                            child: Card(),
                          ),
                          SizedBox(
                            width: 70,
                            height: 70,
                            child: Card(),
                          ),
                          SizedBox(
                            width: 70,
                            height: 70,
                            child: Card(),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              NavigationRail(
                backgroundColor: const Color(0xff2c2f31),
                labelType: NavigationRailLabelType.all,
                groupAlignment: 0.5,
                selectedIndex: selectedIndex,
                selectedLabelTextStyle: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: AppColors.white),
                unselectedLabelTextStyle: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: AppColors.white.withOpacity(.3)),
                onDestinationSelected: (index) => ref
                    .read(navigationIndexProvider.notifier)
                    .navigateTo(index),
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(null),
                    label: RotatedBox(
                      quarterTurns: 3,
                      child: Text('New Arrival'),
                    ),
                  ),
                  NavigationRailDestination(
                    icon: Icon(null),
                    label: RotatedBox(
                      quarterTurns: 3,
                      child: Text('Popular'),
                    ),
                  ),
                  NavigationRailDestination(
                    icon: Icon(null),
                    label: RotatedBox(
                      quarterTurns: 3,
                      child: Text('Best Sale'),
                    ),
                  ),
                ],
              ),
            ],
          ),
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
