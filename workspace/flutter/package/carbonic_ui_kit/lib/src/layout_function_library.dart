part of carbonic_ui_kit;

class LayoutFunctionLibrary {
  const LayoutFunctionLibrary._();

  static double getProportionalWidth(
    final BuildContext context,
    final double width,
    final double designWidth,
  ) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return (width / designWidth) * screenWidth;
  }

  static double getProportionalHeight(
    final BuildContext context,
    final double height,
    final double designHeight,
  ) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return (height / designHeight) * screenHeight;
  }
}
