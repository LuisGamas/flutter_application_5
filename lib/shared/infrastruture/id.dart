import 'package:formz/formz.dart';

/* // Define input validation errors
enum IdError { empty, format }

// Extend FormzInput and provide the input type and error type.
class Id extends FormzInput<int?, IdError> {

  // Call super.pure to represent an unmodified form input.
  const Id.pure() : super.pure(null);

  // Call super.dirty to represent a modified form input.
  const Id.dirty(int? value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == IdError.empty) return 'El campo es requerido';
    if (displayError == IdError.format) return 'Debe ser un número entero';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  IdError? validator(int? value) {
    if (value == null) return IdError.empty;

    return null;
  }
} */

// Define input validation errors
enum IdError { empty, format }

// Extend FormzInput and provide the input type and error type.
class Id extends FormzInput<String, IdError> {

  static final RegExp idRegExp = RegExp(
    r'^[0-9]+$',
  );

  // Call super.pure to represent an unmodified form input.
  const Id.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Id.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == IdError.empty) return 'El campo es requerido';
    if (displayError == IdError.format) return 'Debe contener solo números';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  IdError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return IdError.empty;
    if (!idRegExp.hasMatch(value)) return IdError.format;

    return null;
  }
}


