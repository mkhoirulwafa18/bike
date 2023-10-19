import 'package:bike/features/home/presentation/provider/home_provider.dart';
import 'package:bike/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavRail extends ConsumerWidget {
  const NavRail({
    required this.selectedIndex,
    super.key,
  });

  final int selectedIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
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
          onDestinationSelected: (index) {
            ref.read(navigationIndexProvider.notifier).navigateTo(index);
          },
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
    );
  }
}
