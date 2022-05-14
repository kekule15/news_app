import 'package:flutter/material.dart';
import 'package:newsapp/styles/appColors.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoader extends StatelessWidget {
  final dynamic customWidth;
  final dynamic customHeight;
  final dynamic borderRadius;

  const CustomLoader(
      {Key? key, this.customWidth, this.customHeight, this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        child: Shimmer.fromColors(
          baseColor: AppColors.gray,
          highlightColor: Colors.white,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            width: customWidth,
            height: customHeight,
          ),
        ),
      ),
    );
  }
}
