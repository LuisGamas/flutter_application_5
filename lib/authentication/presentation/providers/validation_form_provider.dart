import 'package:flutter_application_5/authentication/presentation/providers/auth_provider.dart';
import 'package:flutter_application_5/shared/infrastruture/code.dart';
import 'package:flutter_application_5/shared/infrastruture/id.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

final validationFormProvider = StateNotifierProvider.autoDispose<ValidationFormNotifier, ValidationFormState>((ref) {

  final validateUserCallBack = ref.watch(authProvider.notifier).validationUser;

  return ValidationFormNotifier(
    validateUserCallBack: validateUserCallBack,
  );
});

class ValidationFormNotifier extends StateNotifier<ValidationFormState> {

  final Function(String, String) validateUserCallBack;

  ValidationFormNotifier({
    required this.validateUserCallBack,
  }) : super(ValidationFormState());

  onIdFilled(String value) {
    final newId = Id.dirty(value);
    state = state.copyWith(
      userId: newId,
      isValid: Formz.validate([newId, state.activationCode])
    );
    
  }

  onCodeFilled(String value) {
    final newCode = Code.dirty(value);
    state = state.copyWith(
      activationCode: newCode,
      isValid: Formz.validate([newCode, state.userId])
    );
    
  }

  onFormSubmit() async {
    _touchEveryField();

    if (!state.isValid) return;

    state = state.copyWith(
      isPosting: true,
    );

    await validateUserCallBack(state.userId.value, state.activationCode.value);

    state = state.copyWith(
      isPosting: false,
    );

  }

  _touchEveryField() {
    final id = Id.dirty(state.userId.value);
    final code = Code.dirty(state.activationCode.value);

    state = state.copyWith(
      isFormPosted: true,
      userId: id,
      activationCode: code,
      isValid: Formz.validate([id, code]),
    );
  }

}

class ValidationFormState {
  final bool isPosting;
  final bool isFormPosted;  
  final bool isValid;
  final Id userId;
  final Code activationCode;

  ValidationFormState({
    this.isPosting = false, 
    this.isFormPosted = false, 
    this.isValid = false,
    this.userId = const Id.pure(), 
    this.activationCode = const Code.pure(),
  });

  ValidationFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    Id? userId,
    Code? activationCode,
  }) => ValidationFormState(
    isPosting: isPosting ?? this.isPosting,
    isFormPosted: isFormPosted ?? this.isFormPosted,
    isValid: isValid ?? this.isValid,
    userId: userId ?? this.userId,
    activationCode: activationCode ?? this.activationCode,
  );
}