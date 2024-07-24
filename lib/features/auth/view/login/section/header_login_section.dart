import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/constant/app_text.dart';
import 'package:instagram_clone/constant/url_assets.dart';
import 'package:instagram_clone/controller/localizations/localization_bloc.dart';
import 'package:instagram_clone/core/core.dart';
import 'package:instagram_clone/features/auth/model/test.dart';

class HeaderLoginSection extends StatelessWidget {
  const HeaderLoginSection({super.key});

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
              Image.asset(
                UrlAssets.imageInstagramText,
                scale: 8,
              ),
            ],
          ),
        );
      },
    );
  }
}
