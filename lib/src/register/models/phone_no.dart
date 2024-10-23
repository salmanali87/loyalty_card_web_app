import 'package:formz/formz.dart';

enum PhoneNoValidationError { empty }

class PhoneNo extends FormzInput<String, PhoneNoValidationError> {
  const PhoneNo.pure() : super.pure('');
  const PhoneNo.dirty([super.value = '']) : super.dirty();

  @override
  PhoneNoValidationError? validator(String value) {
    if (value.isEmpty) return PhoneNoValidationError.empty;
    return null;
  }
}