import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sotwo/core/theme/theme.dart';

enum MobileCarrierType {
  skt('SKT'),
  kt('KT'),
  lg('LG U+'),
  sktAffordable('SKT 알뜰폰'),
  ktAffordable('KT 알뜰폰'),
  lgAffordable('LG U+ 알뜰폰'),
  ;

  final String text;
  const MobileCarrierType(this.text);
}

class MobileCarrier extends StatelessWidget {
  const MobileCarrier({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '통신사를 선택해주세요',
            style: SabTextTheme.legacyXL.copyWith(
              color: SabColorTheme.black1,
            ),
          ),
          const Gap(20),
          for (final type in MobileCarrierType.values)
            _MobileCarrierElement(
              type: type,
            ),
        ],
      ),
    );
  }
}

class _MobileCarrierElement extends StatelessWidget {
  const _MobileCarrierElement({
    super.key,
    required this.type,
  });

  final MobileCarrierType type;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: SabColorTheme.black6,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        // TODO : 디자인 시스템 상 버튼으로 변경
        child: TextButton(
          style: SabButtonTheme.textButton,
          onPressed: () => context.pop(type),
          child: Text(
            type.text,
            style: SabTextTheme.legacyL.copyWith(
              color: SabColorTheme.black1,
            ),
          ),
        ),
      ),
    );
  }
}
