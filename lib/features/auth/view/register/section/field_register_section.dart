import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/common/routes/navigation.dart';
import 'package:instagram_clone/common/routes/routes_name.dart';
import 'package:instagram_clone/constant/app_state.dart';
import 'package:instagram_clone/core/core.dart';
import 'package:instagram_clone/features/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:instagram_clone/widgets/message/scaffold_message.dart';

import '../../../../../constant/app_colors.dart';
import '../../../../../constant/app_text.dart';
import '../../../../../constant/url_assets.dart';
import '../../../../../widgets/button/default_button.dart';
import '../../../../../widgets/field/default_field.dart';

class FieldRegisterSection extends StatefulWidget {
  const FieldRegisterSection({super.key});

  @override
  State<FieldRegisterSection> createState() => _FieldRegisterSectionState();
}

class _FieldRegisterSectionState extends State<FieldRegisterSection> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final nameC = TextEditingController();
  final emailC = TextEditingController();
  final passC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameC.dispose();
    emailC.dispose();
    passC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = AppLocalizations.of(context);
    return Form(
      key: _key,
      child: Column(
        children: [
          Image.asset(
            UrlAssets.imageInstagramText,
            scale: 8,
          ),
          DefaultField(
            hintText: 'Name',
            controller: nameC,
            validator: (value) {
              if (value != null || value!.isNotEmpty) {
                return null;
              }
              return 'Nama tidak boleh kosong';
            },
          ),
          const SizedBox(height: 10),
          DefaultField(
            hintText: 'Email',
            controller: emailC,
            validator: (value) {
              if (value != null || value!.isNotEmpty) {
                return null;
              }
              return 'Email tidak boleh kosong';
            },
          ),
          const SizedBox(height: 10),
          DefaultField(
            hintText: 'Password',
            controller: passC,
            validator: (value) {
              if (value != null || value!.isNotEmpty) {
                return null;
              }
              return 'Password tidak boleh kosong';
            },
          ),
          const SizedBox(height: 15),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state.status == AuthStatusState.failed) {
                showMessage(context, state.message);
              }
              if (state.status == AuthStatusState.success) {
                showMessage(context, state.message);
                Navigation.pushNamedAndRemoveUntil(RoutesName.login);
                print('Succes Register');
              }
            },
            builder: (context, state) {
              if (state.status == AuthStatusState.loading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }

              return DefaultButton(
                title: AppLocalizations.of(context)!.sign_up,
                onTap: () {
                  if (!_key.currentState!.validate()) {
                    return;
                  } else if (nameC.text.isNotEmpty &&
                      emailC.text.isNotEmpty &&
                      passC.text.isNotEmpty) {
                    final bloc = context.read<AuthBloc>();
                    bloc.add(OnAuthRegister(
                      name: nameC.text.trim(),
                      email: emailC.text.trim(),
                      password: passC.text.trim(),
                    ));
                  }
                },
                height: 50,
              );
            },
          ),
          Column(
            children: [
              TextButton(
                onPressed: () {},
                child: Text(text!.login_by('Google'),
                    style: AppText.text14.copyWith(color: AppColors.blueDark)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${text.already_have_account} ',
                      style: AppText.text14
                          .copyWith(color: AppColors.greyDarkColor)),
                  GestureDetector(
                    onTap: () => Navigation.pushName(RoutesName.login),
                    child: Text(
                      text.login,
                      style: AppText.text14.copyWith(color: AppColors.blueDark),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
