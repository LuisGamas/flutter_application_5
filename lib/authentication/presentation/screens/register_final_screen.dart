import 'package:flutter/material.dart';
import 'package:flutter_application_5/authentication/presentation/providers/register_form_provider.dart';
import 'package:flutter_application_5/shared/widgets/custom_filled_button.dart';
import 'package:flutter_application_5/shared/widgets/custom_form_field.dart';
import 'package:flutter_application_5/shared/widgets/custom_sliver_appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _RegisterScreenClient(),
    );
  }
}

class _RegisterScreenClient extends ConsumerWidget {
  const _RegisterScreenClient();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final registerForm = ref.watch(registerFormProvider);

    final textStyles = Theme.of(context).textTheme;
    //final colors = Theme.of(context).colorScheme;

    return CustomScrollView(
      slivers: [

        const CustomSliverAppBar(),

        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  const SizedBox(height: 30),
              
                  Text(
                    'Registro final',
                    style: textStyles.headlineMedium,
                    textAlign: TextAlign.center
                  ),
              
                  Text(
                    'Verifica que tus datos sean correctos',
                    style: textStyles.bodyMedium,
                    textAlign: TextAlign.center
                  ),
              
                  const SizedBox(height: 30),
              
                  const CustomFormField(
                    label: 'Nombre del cliente',
                    hint: 'Aquí va el nombre del cliente',
                  ),
              
                  const SizedBox(height: 10),
              
                  CustomFormField(
                    label: 'Usuario',
                    hint: 'Ingresa un correo electrónico válido',
                    onChanged: ref.read(registerFormProvider.notifier).onEmailchange,
                    errorMessage: registerForm.isFormPosted 
                      ? registerForm.email.errorMessage
                      : null,
                  ),
              
                  const SizedBox(height: 10),
              
                  CustomFormField(
                    label: 'Contraseña',
                    hint: 'Ingresa una contraseña',
                    obscureText: true,
                    showPasswordButton: true,
                    onChanged: ref.read(registerFormProvider.notifier).onPasswordChange,
                    errorMessage: registerForm.isFormPosted 
                      ? registerForm.password.errorMessage
                      : null,
                  ),
              
                  const SizedBox(height: 30),
              
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: CustomFilledButton(
                      text: 'Registrarme',
                      onPressed: () {
                        ref.read(registerFormProvider.notifier).onFormSubmit();
                      },
                    ),
                  ),
              
                  const SizedBox(height: 10),
                  
                ],
              ),
            );
          },
          childCount: 1
          ),
        ),
      ],
    );
  }
}