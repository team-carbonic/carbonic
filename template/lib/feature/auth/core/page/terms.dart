import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sotwo/core/theme/svg/main.dart';
import 'package:sotwo/core/theme/theme.dart';
import 'package:sotwo/core/utility/cast.dart';
import 'package:sotwo/core/utility/time/time.dart';
import 'package:sotwo/feature/auth/core/page/terms_detail.dart';
import 'package:sotwo/feature/route/route.dart';

enum RequiredType {
  required('필수'),
  optional('선택'),
  ;

  final String text;
  const RequiredType(this.text);
}

enum TermsType {
  service('서비스 이용약관', RequiredType.required),
  personalInformation('개인정보취급방침', RequiredType.required),
  thirdParty('제 3자 정보 제공 동의', RequiredType.required),
  marketing('마케팅 정보 수신 동의', RequiredType.optional),
  ;

  final String text;
  final RequiredType requiredType;
  const TermsType(this.text, this.requiredType);

  factory TermsType.fromName(final String name) => values.firstWhere(
        (e) => e.name == name,
        orElse: () => throw Exception('Unknown TermsType: $name'),
      );

  static List<TermsType> get requiredTypes =>
      values.where((e) => e.requiredType == RequiredType.required).toList();
}

class Terms extends StatefulWidget {
  const Terms({super.key});

  @override
  State<Terms> createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  final _isAllAgreed = ValueNotifier<bool>(false);
  final _isRequirementsAgreed = ValueNotifier<bool>(false);
  final _agreedTermsTypes = <TermsType>{};

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          child: Text(
            'SOTWO 서비스\n이용약관 동의가 필요합니다',
            style: SabTextTheme.basic.bottomSheetBold20.copyWith(
              color: SabColorTheme.black1,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          // TODO : 디자인 시스템 상 버튼으로 변경
          child: TextButton(
            style: SabButtonTheme.textButton.copyWith(
              side: MaterialStateProperty.all(
                const BorderSide(
                  color: SabColorTheme.black5,
                ),
              ),
            ),
            onPressed: () {
              if (_agreedTermsTypes.length == TermsType.values.length) {
                _agreedTermsTypes.clear();
                _isAllAgreed.value = false;
                _isRequirementsAgreed.value = false;
              } else {
                _agreedTermsTypes.addAll(TermsType.values.toSet());
                _isAllAgreed.value = true;
                _isRequirementsAgreed.value = true;
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  ValueListenableBuilder(
                    valueListenable: _isAllAgreed,
                    builder: (_, isAllAgreed, ___) => SabSvg(
                      isAllAgreed
                          ? SvgData.system.btnCheckSelected
                          : SvgData.system.btnCheckDefault,
                      width: 24,
                    ),
                  ),
                  const Gap(10),
                  Text(
                    '모두 동의하기',
                    style: SabTextTheme.basic.bottomSheetBold20.copyWith(
                      color: SabColorTheme.black1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        ValueListenableBuilder(
          valueListenable: _isAllAgreed,
          builder: (_, isAllAgreed, __) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (final termsType in TermsType.values)
                _TermsElement(
                  termsType: termsType,
                  requiredType: termsType.requiredType,
                  initialAgreementState: _agreedTermsTypes.contains(termsType),
                  onAgreementChanged: (isAgreed) {
                    isAgreed
                        ? _agreedTermsTypes.add(termsType)
                        : _agreedTermsTypes.remove(termsType);
                    _isRequirementsAgreed.value =
                        _agreedTermsTypes.containsAll(TermsType.requiredTypes);
                    _isAllAgreed.value =
                        _agreedTermsTypes.length == TermsType.values.length;
                  },
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          // TODO : 디자인 시스템 상 버튼으로 변경
          child: ValueListenableBuilder(
            valueListenable: _isRequirementsAgreed,
            builder: (_, isRequirementsAgreed, ___) {
              return FilledButton(
                style: SabButtonTheme.mainFilledButton,
                onPressed: isRequirementsAgreed
                    ? () => context.pop(_agreedTermsTypes)
                    : null,
                child: const Text(
                  '확인',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _TermsElement extends StatefulWidget {
  const _TermsElement({
    super.key,
    required this.termsType,
    required this.requiredType,
    required this.onAgreementChanged,
    this.initialAgreementState = false,
  });

  final TermsType termsType;
  final RequiredType requiredType;
  final void Function(bool) onAgreementChanged;
  final bool initialAgreementState;

  @override
  State<_TermsElement> createState() => _TermsElementState();
}

class _TermsElementState extends State<_TermsElement> {
  late final ValueNotifier<bool> _isAgreed;

  @override
  void initState() {
    super.initState();
    _isAgreed = ValueNotifier<bool>(widget.initialAgreementState);
  }

  @override
  void didUpdateWidget(covariant _TermsElement oldWidget) {
    super.didUpdateWidget(oldWidget);
    _isAgreed.value = widget.initialAgreementState;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: SabColorTheme.black6,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: TextButton(
          style: SabButtonTheme.textButton,
          onPressed: () {
            _isAgreed.value = !_isAgreed.value;
            widget.onAgreementChanged(_isAgreed.value);
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: _isAgreed,
                      builder: (_, isAgreed, ___) => SabSvg(
                        isAgreed
                            ? SvgData.system.btnCheckSelected
                            : SvgData.system.btnCheckDefault,
                        width: 24,
                      ),
                    ),
                    const Gap(10),
                    Text(
                      widget.termsType.text,
                      style: SabTextTheme.basic.bottomSheetMedium16.copyWith(
                        color: SabColorTheme.black1,
                      ),
                    ),
                    const Gap(5),
                    Text(
                      '(${widget.requiredType.text})',
                      style: SabTextTheme.basic.bottomSheetMedium16.copyWith(
                        color: SabColorTheme.black3,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // TODO : 디자인 시스템 상 버튼으로 변경
              IconButton(
                style: SabButtonTheme.iconButton.copyWith(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.all(10),
                  ),
                ),
                onPressed: () async {
                  final result = cast<bool>(
                    await SabRoute.termsDetail.push(
                      context,
                      TermsDetailPageRoutingInfo(
                        type: widget.termsType,
                        // ! TEST DATA
                        htmlContent: _testHtmlContent,
                        createdTime: SabDateTime.now(),
                      ),
                    ),
                  );

                  if (result ?? false) {
                    _isAgreed.value = true;
                    widget.onAgreementChanged(true);
                  }
                },
                icon: SabSvg(
                  SvgData.system.iconArrowSmallRight,
                  width: 24,
                  color: SabColorTheme.black4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const _testHtmlContent = '''
                      <h3>Terms Detail Page</h3>
                      <p>
                        This is a detail page for the terms.
                        <br>
                        <br>
                        This is a detail page for the terms.
                        <br>
                        <br>
                        This is a detail page for the terms.
                        <br>
                        <br>
                        This is a detail page for the terms.
                        <br>
                        <br>
                        This is a detail page for the terms.
                        <br>
                        <br>
                        This is a detail page for the terms.
                        <br>
                        <br>
                        This is a detail page for the terms.
                        <br>
                        <br>
                        This is a detail page for the terms.
                        <br>
                        <br>
                        This is a detail page for the terms.
                        <br>
                        <br>
                        This is a detail page for the terms.
                        <br>
                        <br>
                        This is a detail page for the terms.
                        <br>
                        <br>
                        This is a detail page for the terms.
                        <br>
                        <br>
                        This is a detail page for the terms.
                        <br>
                        <br>
                        This is a detail page for the terms.
                        <br>
                        <br>
                        This is a detail page for the terms.
                        <br>
                        <br>
                        This is a detail page for the terms.
                        <br>
                        <br>
                        This is a detail page for the terms.
                        <br>
                        <br>
                        This is a detail page for the terms.
                        <br>
                        <br>
                      </p>
                    ''';
