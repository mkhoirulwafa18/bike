import 'package:bike/constants/constant.dart';
import 'package:flutter/material.dart';

class CustomInfoCard extends StatelessWidget {
  const CustomInfoCard({
    required this.width,
    required this.height,
    required this.icon,
    required this.label,
    super.key,
  });

  final double width;
  final double height;
  final Widget icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Hero(
      transitionOnUserGestures: true,
      tag: label,
      child: SizedBox(
        width: width,
        height: height,
        child: Card(
          shadowColor: Colors.amber,
          elevation: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(height: kSpacingXSmall),
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
