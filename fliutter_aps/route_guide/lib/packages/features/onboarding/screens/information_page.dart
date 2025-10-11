import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_guide/packages/features/onboarding/onboarding.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body: _InformationPageController(),
    );
  }
}

class _InformationPageController extends StatefulWidget {
  const _InformationPageController();

  @override
  State<_InformationPageController> createState() => _InformationPageState();
}

class _InformationPageState extends State<_InformationPageController> {
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _ageFocusNode = FocusNode();
  final FocusNode _weightFocusNode = FocusNode();

  late final OnBoardingBloc bloc;

  @override
  void initState() {
    bloc = context.read<OnBoardingBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Stack(
          children: [
            ListView(
              children: [
                Text("Bienvenido!", style: textTheme.titleLarge),
                12.verticalSpace,
                const Text(
                  "La siguiente información es necesaria para calcular la cantidad de calorías quemadas durante cada sesión de entrenamiento.",
                ),
                12.verticalSpace,
                TextFormField(
                  focusNode: _nameFocusNode,
                  decoration: const InputDecoration(
                    label: Text("Nombre"),
                    hintText: "Nombre",
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  onChanged: (value) => bloc.add(ChangeNameEvent(value)),
                ),
                20.verticalSpace,
                BlocBuilder<OnBoardingBloc, OnBoardingState>(
                  builder: (context, state) {
                    return TextFormField(
                      focusNode: _emailFocusNode,
                      decoration: InputDecoration(
                        label: const Text("Email"),
                        hintText: "Email",
                        errorText: state.showErrorEmail
                            ? "Ingrese un email válido"
                            : null,
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => bloc.add(ChangeEmailEvent(value)),
                    );
                  },
                ),
                20.verticalSpace,
                BlocBuilder<OnBoardingBloc, OnBoardingState>(
                  builder: (context, state) {
                    return TextFormField(
                      focusNode: _ageFocusNode,
                      decoration: InputDecoration(
                        label: const Text("Edad"),
                        hintText: "Edad",
                        errorText: state.showErrorAge
                            ? "Ingrese un valor válido"
                            : null,
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      onChanged: (value) => bloc.add(ChangeAgeEvent(value)),
                    );
                  },
                ),
                20.verticalSpace,
                BlocBuilder<OnBoardingBloc, OnBoardingState>(
                  builder: (context, state) {
                    return TextFormField(
                      focusNode: _weightFocusNode,
                      decoration: InputDecoration(
                        label: const Text("Peso (kg)"),
                        hintText: "Peso (kg)",
                        errorText: state.showErrorWeight
                            ? "Ingrese un valor válido"
                            : null,
                      ),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      onChanged: (value) => bloc.add(ChangeWeightEvent(value)),
                      onFieldSubmitted: (_) => state.isNextButtonEnabled
                          ? bloc.add(const NextButtonPressedEvent())
                          : null,
                    );
                  },
                ),
                56.verticalSpace,
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BlocBuilder<OnBoardingBloc, OnBoardingState>(
                builder: (context, state) {
                  return SafeArea(
                    child: ElevatedButton(
                      onPressed: state.isNextButtonEnabled
                          ? () => bloc.add(const NextButtonPressedEvent())
                          : null,
                      child: const Text("Continuar"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
