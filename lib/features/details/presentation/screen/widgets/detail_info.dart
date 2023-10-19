import 'package:bike/shared/widgets/custom_info_card.dart';
import 'package:flutter/material.dart';

class DetailInfo extends StatelessWidget {
  const DetailInfo({
    required this.topSpeed,
    required this.weight,
    required this.engine,
    super.key,
  });

  final int topSpeed;
  final int weight;
  final int engine;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomInfoCard(
          width: 100,
          height: 70,
          icon: const Icon(Icons.speed),
          label: '$topSpeed MPH',
        ),
        CustomInfoCard(
          width: 100,
          height: 70,
          icon: const Icon(Icons.rocket_launch),
          label: '$engine CC',
        ),
        CustomInfoCard(
          width: 100,
          height: 70,
          icon: const Icon(Icons.motorcycle_rounded),
          label: '$weight KG',
        ),
      ],
    );
  }
}
