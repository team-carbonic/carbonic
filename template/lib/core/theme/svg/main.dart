import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

part 'component/system.dart';

/// svg파일의 raw text를 변수화하여 관리한다.
/// 피그마 토큰 상, 시스템화되지 않은 아이콘, 즉 특정 feature에서만 사용하는 아이콘의 경우에는 /component 폴더 내에 기능별로 class를 만들어 관리한다.
/// 피그마 토큰 상, 시스템화된 아이콘의 경우에는 [_SystemIcon] class 내에 변수를 추가하여 관리한다. 자세한 내용은 [_SystemIcon]의 주석을 참고할 것.
/// [_SystemIcon] class 내의 변수명을 제외하고, 나머지 변수명은 svg 원본 파일의 이름과는 무관하게, 해당 아이콘의 기능이나 영역과 관련된 이름으로 작성한다.
/// [_SystemIcon] class 내의 아이콘을 제외하고 나머지는 사이즈와 색상 등을 변경하지 않고 그대로 사용하는 것을 원칙으로 한다.
class SvgData {
  const SvgData._();

  // TODO : test용 삭제 필요
  static const test =
      '''<svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
    <defs>
        <path id="ieuc6ftd2a" d="M0 .259h17.741V18H0z"/>
    </defs>
    <g fill="none" fill-rule="evenodd">
        <path d="M0 0h24v24H0z"/>
        <g transform="translate(3 2.689)">
            <mask id="1c6lko3gtb" fill="#fff">
                <use xlink:href="#ieuc6ftd2a"/>
            </mask>
            <path d="M17.741 9.13A8.871 8.871 0 1 1 0 9.13a8.871 8.871 0 0 1 17.742 0" fill="#AEB6C0" mask="url(#1c6lko3gtb)"/>
        </g>
        <path stroke="#FFF" stroke-linecap="round" d="m8.68 8.628 6.381 6.381M15.061 8.628 8.68 15.009"/>
    </g>
</svg>''';

  static final system = _SystemIcon();
}

/// [data]에는 일반적으로 [SvgData]에 정의된 값을 사용한다.
/// 크기를 명시할 필요가 있다면, [width]나 [height] 중 하나만 지정해 data가 제공하는 비율을 사용하는 것을 권장한다.
class SabSvg extends StatelessWidget {
  final String data;
  final Color? color;
  final double? width;
  final double? height;
  final BoxFit fit;

  const SabSvg(
    this.data, {
    super.key,
    this.color,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) => SvgPicture.string(
        data,
        colorFilter: color == null
            ? null
            : ColorFilter.mode(
                color!,
                BlendMode.srcIn,
              ),
        width: width,
        height: height,
        fit: fit,
      );
}
