import 'package:formz/formz.dart';

enum ConfirmpasswordValidationError { empty }

class Confirmpassword extends FormzInput<String, ConfirmpasswordValidationError> {
  const Confirmpassword.pure() : super.pure('');
  const Confirmpassword.dirty([super.value = '']) : super.dirty();

  @override
  ConfirmpasswordValidationError? validator(String value) {
    if (value.isEmpty) return ConfirmpasswordValidationError.empty;
    return null;
  }
}