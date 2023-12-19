import 'package:flutter/material.dart';
import 'package:todoapp/utils/extensions.dart';

class CommonContainer extends StatelessWidget {
  const CommonContainer({
    super.key,
    this.child,
    this.height,
  });

  final Widget? child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    
    return Container(
      width: deviceSize.width,
      height: height,
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
