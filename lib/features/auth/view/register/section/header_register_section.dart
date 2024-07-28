import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constant/app_text.dart';
import '../../../../../constant/url_assets.dart';
import '../../../../../controller/localizations/localization_bloc.dart';
import '../../../../../core/core.dart';
import '../../../model/localization.dart';

class HeaderRegisterSection extends StatelessWidget {
  const HeaderRegisterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationBloc, LocalizationState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButtonHideUnderline(
                  child: DropdownButton(
                value: state.locale,
                items: AppLocalizations.supportedLocales.map((Locale local) {
                  final data = Localization.getLanguage(local.languageCode);
                  return DropdownMenuItem(
                    value: local,
                    child: Text(data, style: AppText.text10),
                  );
                }).toList(),
                onChanged: (value) {
                  context.read<LocalizationBloc>().add(
                        ChangeLocalization(locale: value!),
                      );
                },
              )),
              SizedBox(height: MediaQuery.of(context).size.height * 1 / 10),
            ],
          ),
        );
      },
    );
  }
}
