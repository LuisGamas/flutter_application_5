import 'package:flutter/material.dart';
import 'package:flutter_application_5/authentication/presentation/providers/validation_form_provider.dart';
import 'package:flutter_application_5/shared/widgets/custom_filled_button.dart';
import 'package:flutter_application_5/shared/widgets/custom_form_field.dart';
import 'package:flutter_application_5/shared/widgets/custom_sliver_appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ValidationScreen extends StatelessWidget {
  const ValidationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _ValidationScreenClient(),
    );
  }
}

class _ValidationScreenClient extends ConsumerWidget {
  const _ValidationScreenClient();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final validationForm = ref.watch(validationFormProvider);

    final textStyles = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

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
                    'Activación',
                    style: textStyles.headlineMedium,
                    textAlign: TextAlign.center
                  ),
              
                  Text(
                    'Ingresa los siguientes datos para activar tu cuenta', 
                    style: textStyles.bodyMedium,
                    textAlign: TextAlign.center
                  ),
              
                  const SizedBox(height: 30),

                  CustomFormField(
                    label: 'ID de usuario',
                    hint: 'Ingresa tu ID de usuario',
                    onChanged: ref.read(validationFormProvider.notifier).onIdFilled,
                    errorMessage: validationForm.isFormPosted
                      ? validationForm.userId.errorMessage
                      : null,
                  ),

                  const SizedBox(height: 10),
              
                  CustomFormField(
                    label: 'Código',
                    hint: 'Ingresa tu código de activación',
                    onChanged: ref.read(validationFormProvider.notifier).onCodeFilled,
                    errorMessage: validationForm.isFormPosted
                      ? validationForm.activationCode.errorMessage
                      : null,
                  ),
              
                  const SizedBox(height: 10),

                  Container(
                    height: 45,
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      child: Text('No tengo un código', style: textStyles.labelLarge!.copyWith(
                        color: colors.primary,
                      )),
                      onTap: () {
                        showDialog(context: context, builder: (context) {
                          return AlertDialog(
                            title: const Text('Código de activación'),
                            content: const Text('Aquí va algún mensaje con respecto al código de activación o cómo obtenerlo', textAlign: TextAlign.justify),
                            actions: [
                              FilledButton(onPressed: () => context.pop(), child: const Text('Cerrar'))
                            ],
                          );
                        });
                      },
                    ),  
                  ),
              
                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: CustomFilledButton(
                      text: 'Activar cuenta',
                      onPressed: validationForm.isPosting
                        ? null
                        : ref.read(validationFormProvider.notifier).onFormSubmit,
                    ),
                  ),

                  const SizedBox(height: 10),
                ],
              ),
            );
          },
          childCount: 1
          )
        )
      ],
    );
  }
}