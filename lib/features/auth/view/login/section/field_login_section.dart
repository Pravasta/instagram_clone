import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/common/routes/navigation.dart';
import 'package:instagram_clone/common/routes/routes_name.dart';
import 'package:instagram_clone/constant/app_colors.dart';
import 'package:instagram_clone/constant/app_state.dart';
import 'package:instagram_clone/constant/app_text.dart';
import 'package:instagram_clone/core/core.dart';
import 'package:instagram_clone/features/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:instagram_clone/widgets/button/default_button.dart';
import 'package:instagram_clone/widgets/field/default_field.dart';
import 'package:instagram_clone/widgets/message/scaffold_message.dart';

class FieldLoginSection extends StatefulWidget {
  const FieldLoginSection({super.key});

  @override
  State<FieldLoginSection> createState() => _FieldLoginSectionState();
}

class _FieldLoginSectionState extends State<FieldLoginSection> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final emailC = TextEditingController();
  final passC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailC.dispose();
    passC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _key,
        child: Column(children: [
          DefaultField(
              hintText: 'Username/Email',
              controller: emailC,
              validator: (value) {
                if (value != null || value!.isNotEmpty) {
                  return null;
                }
                return 'Email wajib diisi';
              }),
          const SizedBox(height: 10),
          DefaultField(
              hintText: 'Password',
              controller: passC,
              validator: (value) {
                if (value != null || value!.isNotEmpty) {
                  return null;
                }
                return 'Password wajib diisi';
              }),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () {},
                child: Text(AppLocalizations.of(context)!.forgot_password,
                    style: AppText.text12.copyWith(color: AppColors.blueDark))),
          ),
          const SizedBox(height: 15),
          BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
            if (state.status == AuthStatusState.failed) {
              showMessage(context, state.message);
            }
            if (state.status == AuthStatusState.success) {
              showMessage(context, state.message);
              print(state.result!.name);
              print(state.result!.token);
              print(state.result!.userId);
              Navigation.pushNamedAndRemoveUntil(RoutesName.mainNavigation);
            }
          }, builder: (context, state) {
            if (state.status == AuthStatusState.loading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }

            return DefaultButton(
                title: AppLocalizations.of(context)!.login,
                onTap: () {
                  if (!_key.currentState!.validate()) {
                    return;
                  } else if (emailC.text.isNotEmpty && passC.text.isNotEmpty) {
                    final bloc = context.read<AuthBloc>();
                    bloc.add(OnAuthLogin(
                      email: emailC.text.trim(),
                      password: passC.text.trim(),
                    ));
                  }
                },
                height: 50);
          })
        ]));
  }
}
