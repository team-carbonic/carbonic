import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:go_router/go_router.dart';
import 'package:sotwo/core/theme/design_constant.dart';
import 'package:sotwo/core/theme/theme.dart';
import 'package:sotwo/core/ui/container/spaced_column.dart';
import 'package:sotwo/core/ui/dialog.dart';
import 'package:sotwo/core/ui/gesture_detector.dart';
import 'package:sotwo/core/utility/call_wrapper.dart';

const _phoneNumberCount = 11;
const _certificateNumberCount = 6;

enum _AuthFormFieldType {
  name,
  birthday,
  mobileCarrier,
  phoneNumber, // list 상에서는 mobileCarrier에 종속된다.
  certificateNumber,
  ;

  bool validate(final String text) => switch (this) {
        name => RegExp(r'^[가-힣a-zA-Z]{1,}$').hasMatch(text),
        birthday => RegExp(r'^\d{6}$').hasMatch(text),
        mobileCarrier => text.isNotEmpty,
        phoneNumber => RegExp(r'^\d{10,11}$').hasMatch(text),
        certificateNumber => RegExp(r'^\d{6}$').hasMatch(text),
      };

  _AuthFormFieldType? get nextStep => switch (this) {
        name => birthday,
        birthday => mobileCarrier,
        mobileCarrier => certificateNumber,
        _ => null,
      };

  int? get insertedIndex => switch (this) {
        name => 0,
        birthday => 1,
        mobileCarrier => 2,
        certificateNumber => 3,
        _ => null,
      };
}

class AuthFormPage extends StatefulWidget {
  const AuthFormPage({super.key});

  @override
  State<AuthFormPage> createState() => _AuthFormPageState();
}

class _AuthFormPageState extends State<AuthFormPage> {
  final _listKey = GlobalKey<AnimatedListState>();
  late final TextEditingController _nameController;
  late final TextEditingController _birthdayController;
  late final FocusNode _birthdayFocusNode;
  late final TextEditingController _genderController;
  late final TextEditingController _carrierController;
  late final FocusScopeNode _carrierFocusNode;
  late final TextEditingController _phoneNumberController;
  late final FocusNode _phoneNumberFocusNode;
  late final TextEditingController _certificateNumberController;
  late final FocusNode _certificateNumberFocusNode;

  var _currentStep = _AuthFormFieldType.name;
  String get _title => switch (_currentStep) {
        _AuthFormFieldType.name => '이름을\n입력해주세요',
        _AuthFormFieldType.birthday => '생년월일과\n성별을 입력해주세요',
        _AuthFormFieldType.mobileCarrier ||
        _AuthFormFieldType.phoneNumber =>
          '휴대폰 번호를\n입력해주세요',
        _AuthFormFieldType.certificateNumber => '문자로 전송된\n인증번호를 입력해주세요',
      };

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _birthdayController = TextEditingController();
    _birthdayFocusNode = FocusNode();
    _genderController = TextEditingController();
    _carrierController = TextEditingController();
    _carrierFocusNode = FocusScopeNode();
    _phoneNumberController = TextEditingController();
    _phoneNumberFocusNode = FocusNode();
    _certificateNumberController = TextEditingController();
    _certificateNumberFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _birthdayController.dispose();
    _birthdayFocusNode.dispose();
    _genderController.dispose();
    _carrierController.dispose();
    _carrierFocusNode.dispose();
    _phoneNumberController.dispose();
    _phoneNumberFocusNode.dispose();
    _certificateNumberController.dispose();
    _certificateNumberFocusNode.dispose();
    super.dispose();
  }

  void _tryRequestCertificateNumber() {
    if (!_AuthFormFieldType.phoneNumber.validate(_phoneNumberController.text)) {
      // ! 폰 번호 정확히 입력해라
      return;
    }

    if (!_AuthFormFieldType.mobileCarrier.validate(_carrierController.text)) {
      // ! 통신사 선택해라
      return;
    }

    if (!_AuthFormFieldType.birthday.validate(_birthdayController.text)) {
      // ! 생년월일 정확히 입력해라
      return;
    }

    if (!_AuthFormFieldType.name.validate(_nameController.text)) {
      // ! 이름 정확히 입력해라
      return;
    }

    _toNextStep(_AuthFormFieldType.certificateNumber);
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 65.0,
                horizontal: DesignConstant.pageDefaultHorizontalPadding,
              ),
              child: SpacedColumn(
                spacing: 30.0,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _title,
                    style: SabTextTheme.basic.pageBold28.copyWith(
                      color: SabColorTheme.black1,
                    ),
                  ),
                  FocusTraversalGroup(
                    policy: OrderedTraversalPolicy(),
                    child: AnimatedList(
                      key: _listKey,
                      reverse: true,
                      shrinkWrap: true,
                      initialItemCount: 1,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index, animation) {
                        final type = _AuthFormFieldType.values.firstWhereOrNull(
                          (element) => element.insertedIndex == index,
                        );
                        return switch (type) {
                          _AuthFormFieldType.name => _NameFormField(
                              controller: _nameController,
                              onEditingComplete: () {
                                if (_currentStep == _AuthFormFieldType.name &&
                                    !_AuthFormFieldType.name
                                        .validate(_nameController.text)) {
                                  return;
                                }
                                _toNextStep(_AuthFormFieldType.birthday);
                              },
                            ),
                          _AuthFormFieldType.birthday => _BirthdayFormField(
                              sizeFactor: animation,
                              birthdayController: _birthdayController,
                              genderController: _genderController,
                              focusNode: _birthdayFocusNode,
                              onFinished: () {
                                if (_currentStep ==
                                        _AuthFormFieldType.birthday &&
                                    !_AuthFormFieldType.birthday
                                        .validate(_birthdayController.text)) {
                                  return;
                                }
                                _toNextStep(_AuthFormFieldType.mobileCarrier);
                              },
                            ),
                          _AuthFormFieldType.mobileCarrier => _MobileFormField(
                              sizeFactor: animation,
                              carrierController: _carrierController,
                              carrierFocusNode: _carrierFocusNode,
                              phoneNumberController: _phoneNumberController,
                              phoneNumberFocusNode: _phoneNumberFocusNode,
                              requestCertificateNumber:
                                  _tryRequestCertificateNumber,
                            ),
                          _AuthFormFieldType.certificateNumber =>
                            _CertificateNumberFormField(
                              sizeFactor: animation,
                              controller: _certificateNumberController,
                              focusNode: _certificateNumberFocusNode,
                              onCertificateNumberFilled: () {},
                            ),
                          _ => const SizedBox(),
                        };
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ).animate().fadeIn(
              duration: 800.ms,
            ),
      ),
    );
  }

  bool _validate() =>
      _AuthFormFieldType.phoneNumber.validate(_phoneNumberController.text);

  void _toNextStep(
    final _AuthFormFieldType nextStep,
  ) {
    var stepChanged = true;
    try {
      if (_currentStep.nextStep != nextStep) {
        throw Exception();
      }

      setState(() {
        _currentStep = nextStep;
      });

      if (_currentStep.insertedIndex == null) {
        throw Exception();
      }

      _listKey.currentState?.insertItem(
        _currentStep.insertedIndex!,
        duration: _listInsertionTime,
      );
    } catch (_) {
      stepChanged = false;
    }

    void requestFocus() {
      final focusNode = switch (nextStep) {
        _AuthFormFieldType.birthday => _birthdayFocusNode,
        _AuthFormFieldType.mobileCarrier =>
          stepChanged ? _carrierFocusNode : _phoneNumberFocusNode,
        _ => null,
      };

      focusNode?.requestFocus();
    }

    if (stepChanged) {
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) {
          requestFocus();
        },
      );
    } else {
      requestFocus();
    }
  }
}

class _NameFormField extends StatefulWidget {
  final TextEditingController controller;
  final void Function() onEditingComplete;
  const _NameFormField({
    super.key,
    required this.controller,
    required this.onEditingComplete,
  });

  @override
  State<_NameFormField> createState() => _NameFormFieldState();
}

class _NameFormFieldState extends State<_NameFormField> {
  @override
  Widget build(BuildContext context) {
    return FocusScope(
      onFocusChange: (value) {
        setState(() {});
      },
      child: _FormFieldWrapper(
        type: _AuthFormFieldType.name,
        child: TextFormField(
          controller: widget.controller,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          cursorColor: _mainColor,
          cursorWidth: _cursorWidth,
          style: _inputFieldTextStyle,
          onEditingComplete: widget.onEditingComplete,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            labelText: '이름',
            labelStyle: _fieldLabelTextStyle,
            floatingLabelStyle: _floatingLabelTextStyle,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            contentPadding: _fieldContentPadding,
            enabledBorder:
                widget.controller.text.isEmpty ? _emptyBorder : _focusedBorder,
            focusColor: _mainColor,
            focusedBorder: _focusedBorder,
          ),
        ),
      ),
    );
  }
}

class _BirthdayFormField extends StatefulWidget {
  final Animation<double> sizeFactor;
  final TextEditingController birthdayController;
  final TextEditingController genderController;
  final FocusNode focusNode;
  final void Function() onFinished;
  const _BirthdayFormField({
    super.key,
    required this.sizeFactor,
    required this.birthdayController,
    required this.genderController,
    required this.focusNode,
    required this.onFinished,
  });

  @override
  State<_BirthdayFormField> createState() => _BirthdayFormFieldState();
}

class _BirthdayFormFieldState extends State<_BirthdayFormField> {
  var _borderSide = _emptyBorderSide;

  @override
  Widget build(BuildContext context) {
    return _FormFieldWrapper(
      type: _AuthFormFieldType.birthday,
      child: SizeTransition(
        axis: Axis.vertical,
        sizeFactor: widget.sizeFactor,
        child: FocusScope(
          onFocusChange: (focused) {
            setState(
              () {
                final hasText = widget.birthdayController.text.isNotEmpty ||
                    widget.genderController.text.isNotEmpty;
                _borderSide =
                    hasText || focused ? _focusedBorderSide : _emptyBorderSide;
              },
            );
          },
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              AnimatedContainer(
                duration: _borderChangeTime,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: _borderSide,
                  ),
                ),
              ),
              FocusTraversalGroup(
                child: Builder(
                  builder: (context) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: widget.birthdayController,
                            focusNode: widget.focusNode,
                            style: _inputFieldTextStyle,
                            cursorWidth: _cursorWidth,
                            cursorColor: _mainColor,
                            maxLength: 6,
                            buildCounter: (
                              context, {
                              required currentLength,
                              required isFocused,
                              maxLength,
                            }) {
                              return null;
                            },
                            onChanged: (value) {
                              if (value.length == 6) {
                                widget.genderController.clear();
                                FocusScope.of(
                                  context,
                                ).nextFocus();
                              }
                            },
                            onEditingComplete: () {
                              widget.genderController.clear();
                              FocusScope.of(
                                context,
                              ).nextFocus();
                            },
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              alignLabelWithHint: true,
                              labelText: '생년월일',
                              labelStyle: _fieldLabelTextStyle,
                              floatingLabelStyle: _floatingLabelTextStyle,
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.start,
                              contentPadding: _fieldContentPadding,
                              enabledBorder: _emptyBorder,
                              focusColor: _mainColor,
                              focusedBorder: _focusedBorder,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 24.0,
                                child: TextFormField(
                                  controller: widget.genderController,
                                  style: _inputFieldTextStyle,
                                  cursorWidth: _cursorWidth,
                                  cursorColor: _mainColor,
                                  maxLength: 1,
                                  buildCounter: (
                                    context, {
                                    required currentLength,
                                    required isFocused,
                                    maxLength,
                                  }) {
                                    return null;
                                  },
                                  onChanged: (value) {
                                    if (widget.birthdayController.text.length ==
                                            6 &&
                                        value.isNotEmpty) {
                                      widget.onFinished();
                                    }
                                  },
                                  onEditingComplete: () {
                                    if (widget.birthdayController.text.length ==
                                            6 &&
                                        widget
                                            .genderController.text.isNotEmpty) {
                                      widget.onFinished();
                                    }
                                  },
                                  obscureText: true,
                                  obscuringCharacter: '●',
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '●',
                                    hintStyle: _inputFieldTextStyle.copyWith(
                                      color: SabColorTheme.black4,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '✱ ✱ ✱ ✱ ✱ ✱',
                                  style: _inputFieldTextStyle.copyWith(
                                    color: SabColorTheme.black4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MobileFormField extends StatefulWidget {
  final Animation<double> sizeFactor;
  final TextEditingController carrierController;
  final FocusScopeNode carrierFocusNode;
  final TextEditingController phoneNumberController;
  final FocusNode phoneNumberFocusNode;
  final VoidCallback requestCertificateNumber;
  const _MobileFormField({
    super.key,
    required this.sizeFactor,
    required this.carrierController,
    required this.carrierFocusNode,
    required this.phoneNumberController,
    required this.phoneNumberFocusNode,
    required this.requestCertificateNumber,
  });

  @override
  State<_MobileFormField> createState() => _MobileFormFieldState();
}

class _MobileFormFieldState extends State<_MobileFormField> {
  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      axis: Axis.vertical,
      sizeFactor: widget.sizeFactor,
      child: Column(
        children: [
          _PhoneNumberFormField(
            controller: widget.phoneNumberController,
            focusNode: widget.phoneNumberFocusNode,
            requestCertificateNumber: widget.requestCertificateNumber,
          ),
          FocusScope(
            node: widget.carrierFocusNode,
            onFocusChange: (value) {
              if (value) {
                FocusManager.instance.primaryFocus?.unfocus();
                SabDialog.showOneButton(
                  context: context,
                  mainText: 'mainText',
                  onPressed: () {
                    context.pop();
                    widget.carrierController.text = 'SKT';
                    widget.phoneNumberFocusNode.requestFocus();
                  },
                  buttonText: 'dd',
                );
              }
            },
            child: SabGestureDetector(
              onTap: () => Throttler.processSync(
                hashCode,
                () {
                  widget.carrierFocusNode.requestFocus();
                },
              ),
              child: IgnorePointer(
                ignoring: true,
                child: _FormFieldWrapper(
                  type: _AuthFormFieldType.mobileCarrier,
                  child: TextFormField(
                    readOnly: true,
                    controller: widget.carrierController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    cursorColor: _mainColor,
                    cursorWidth: _cursorWidth,
                    style: _inputFieldTextStyle,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      labelText: '통신사',
                      labelStyle: _fieldLabelTextStyle,
                      floatingLabelStyle: _floatingLabelTextStyle,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      contentPadding: _fieldContentPadding,
                      enabledBorder: widget.carrierController.text.isEmpty
                          ? _emptyBorder
                          : _focusedBorder,
                      focusColor: _mainColor,
                      focusedBorder: _focusedBorder,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PhoneNumberFormField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback requestCertificateNumber;
  const _PhoneNumberFormField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.requestCertificateNumber,
  });

  @override
  State<_PhoneNumberFormField> createState() => __PhoneNumberFormFieldState();
}

class __PhoneNumberFormFieldState extends State<_PhoneNumberFormField> {
  var _borderSide = _emptyBorderSide;

  late bool _buttonEnabled;

  late final StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    _buttonEnabled = widget.controller.text.isNotEmpty;

    // TODO : 상위로 올릴지 말지 고민해볼 것...
    final keyboardVisibilityController = KeyboardVisibilityController();
    _subscription = keyboardVisibilityController.onChange.listen(
      (visible) {
        if (visible) {
          return;
        }
        FocusScope.of(context).unfocus();
      },
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        AnimatedContainer(
          duration: _borderChangeTime,
          decoration: BoxDecoration(
            border: Border(
              bottom: _borderSide,
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: _FormFieldWrapper(
                type: _AuthFormFieldType.phoneNumber,
                child: FocusScope(
                  onFocusChange: (focused) {
                    setState(
                      () {
                        final hasText = widget.controller.text.isNotEmpty;
                        _borderSide = hasText || focused
                            ? _focusedBorderSide
                            : _emptyBorderSide;
                      },
                    );
                  },
                  child: TextFormField(
                    controller: widget.controller,
                    focusNode: widget.focusNode,
                    style: _inputFieldTextStyle,
                    cursorWidth: _cursorWidth,
                    cursorColor: _mainColor,
                    maxLength: _phoneNumberCount,
                    buildCounter: (
                      context, {
                      required currentLength,
                      required isFocused,
                      maxLength,
                    }) {
                      return null;
                    },
                    onChanged: (value) {
                      final enabled = value.isNotEmpty;
                      if (_buttonEnabled != enabled) {
                        setState(() {
                          _buttonEnabled = enabled;
                        });
                      } else {
                        if (value.length == _phoneNumberCount) {
                          if (_validate()) {
                            widget.focusNode.unfocus();
                            widget.requestCertificateNumber();
                          } else {
                            // ! 폰 번호 정확히 입력해라
                          }
                        }
                      }
                    },
                    onEditingComplete: () {
                      if (_validate()) {
                        widget.focusNode.unfocus();
                        widget.requestCertificateNumber();
                      } else {
                        // ! 폰 번호 정확히 입력해라
                      }
                    },
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      labelText: '휴대폰 번호',
                      labelStyle: _fieldLabelTextStyle,
                      floatingLabelStyle: _floatingLabelTextStyle,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      contentPadding: _fieldContentPadding,
                      focusColor: _mainColor,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 12.0,
                right: 15.0,
              ),
              child: ElevatedButton(
                onPressed: _buttonEnabled
                    ? () => Throttler.processSync(
                          hashCode,
                          widget.requestCertificateNumber,
                        )
                    : null,
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 15.0,
                  ),
                  backgroundColor: SabColorTheme.black1,
                  foregroundColor: SabColorTheme.white1,
                  disabledBackgroundColor: SabColorTheme.black4,
                  disabledForegroundColor: SabColorTheme.white1,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  textStyle: SabTextTheme.semantic.button1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  '인증번호',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  bool _validate() =>
      _AuthFormFieldType.phoneNumber.validate(widget.controller.text);
}

class _CertificateNumberFormField extends StatefulWidget {
  final Animation<double> sizeFactor;
  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onCertificateNumberFilled;
  const _CertificateNumberFormField({
    super.key,
    required this.sizeFactor,
    required this.controller,
    required this.focusNode,
    required this.onCertificateNumberFilled,
  });

  @override
  State<_CertificateNumberFormField> createState() =>
      __CertificateNumberFormFieldState();
}

class __CertificateNumberFormFieldState
    extends State<_CertificateNumberFormField> {
  var _borderSide = _emptyBorderSide;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      axis: Axis.vertical,
      sizeFactor: widget.sizeFactor,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          AnimatedContainer(
            duration: _borderChangeTime,
            decoration: BoxDecoration(
              border: Border(
                bottom: _borderSide,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: _FormFieldWrapper(
                  type: _AuthFormFieldType.certificateNumber,
                  child: FocusScope(
                    onFocusChange: (focused) {
                      setState(
                        () {
                          final hasText = widget.controller.text.isNotEmpty;
                          _borderSide = hasText || focused
                              ? _focusedBorderSide
                              : _emptyBorderSide;
                        },
                      );
                    },
                    child: TextFormField(
                      controller: widget.controller,
                      focusNode: widget.focusNode,
                      style: _inputFieldTextStyle,
                      cursorWidth: _cursorWidth,
                      cursorColor: _mainColor,
                      maxLength: _phoneNumberCount,
                      buildCounter: (
                        context, {
                        required currentLength,
                        required isFocused,
                        maxLength,
                      }) {
                        return null;
                      },
                      onChanged: (value) {
                        if (value.length == _certificateNumberCount) {}
                        final enabled = value.isNotEmpty;
                        // if (_buttonEnabled != enabled) {
                        //   setState(() {
                        //     _buttonEnabled = enabled;
                        //   });
                        // } else {
                        //   if (value.length == _phoneNumberCount) {
                        //     if (_validate()) {
                        //       widget.focusNode.unfocus();
                        //       widget.onRequestCertificateNumberTap();
                        //     } else {
                        //       // ! 폰 번호 정확히 입력해라
                        //     }
                        //   }
                        // }
                      },
                      onEditingComplete: () {
                        // if (_validate()) {
                        //   widget.focusNode.unfocus();
                        //   widget.onRequestCertificateNumberTap();
                        // } else {
                        //   // ! 폰 번호 정확히 입력해라
                        // }
                      },
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      autofillHints: const [AutofillHints.oneTimeCode],
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: '인증번호 6자리',
                        labelStyle: _fieldLabelTextStyle,
                        floatingLabelStyle: _floatingLabelTextStyle,
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        contentPadding: _fieldContentPadding,
                        focusColor: _mainColor,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FormFieldWrapper extends StatelessWidget {
  final _AuthFormFieldType type;
  final Widget child;
  const _FormFieldWrapper({
    super.key,
    required this.type,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FocusTraversalOrder(
      order: NumericFocusOrder(
        type.index.toDouble(),
      ),
      child: SizedBox(
        height: 70.0,
        child: Align(
          alignment: Alignment.bottomLeft,
          child: child,
        ),
      ),
    );
  }
}

Color get _mainColor => SabColorTheme.black1;
Color get _labelColor => SabColorTheme.black3;
TextStyle get _inputFieldTextStyle => SabTextTheme.basic.pageMedium20.copyWith(
      color: _mainColor,
      lineHeight: 24.0,
    );
TextStyle get _fieldLabelTextStyle => _inputFieldTextStyle.copyWith(
      color: _labelColor,
    );
TextStyle get _floatingLabelTextStyle =>
    SabTextTheme.basic.pageMedium14.copyWith(
      color: _labelColor,
      lineHeight: 14.0,
    );

BorderSide get _emptyBorderSide => const BorderSide(
      width: 1.0,
      color: SabColorTheme.black4,
    );
BorderSide get _focusedBorderSide => BorderSide(
      width: 2.0,
      color: _mainColor,
    );
InputBorder get _emptyBorder => UnderlineInputBorder(
      borderSide: _emptyBorderSide,
    );
InputBorder get _focusedBorder => UnderlineInputBorder(
      borderSide: _focusedBorderSide,
    );

EdgeInsets get _fieldContentPadding => const EdgeInsets.fromLTRB(
      15.0,
      0.0,
      15.0,
      12.0,
    );
double get _cursorWidth => 2.0;

Duration get _borderChangeTime => 200.ms;
Duration get _listInsertionTime => 200.ms;
