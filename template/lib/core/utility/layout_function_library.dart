import 'package:flutter/widgets.dart';
import 'package:sotwo/core/theme/design_constant.dart';

class LayoutFunctionLibrary {
  const LayoutFunctionLibrary._();

  static double getProportionalWidth(
    BuildContext context,
    double width,
  ) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return (width / DesignConstant.designWith) * screenWidth;
  }

  static double getProportionalHeight(
    BuildContext context,
    double height,
  ) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return (height / DesignConstant.designHeight) * screenHeight;
  }
}
