import 'package:formz/formz.dart';
import 'package:flutter/material.dart';
import 'package:quick_pick/core/constants/strings.dart';

enum ConfirmedPasswordValidationError {
  invalid,
  mismatch,
}

class ConfirmPassword
    extends FormzInput<String, ConfirmedPasswordValidationError> {
  final String password;

  const ConfirmPassword.pure({this.password = ''}) : super.pure('');

  const ConfirmPassword.dirty({required this.password, String value = ''})
      : super.dirty(value);

  @override
  ConfirmedPasswordValidationError? validator(String value) {
    return password == value
        ? null
        : ConfirmedPasswordValidationError.mismatch;
  }
}

extension Explanation on ConfirmedPasswordValidationError {
  String? get name {
    switch (this) {
      case ConfirmedPasswordValidationError.mismatch:
        return Strings.passwordsDoesntMatch;
      default:
        return Strings.passwordError;
    }
  }
}
