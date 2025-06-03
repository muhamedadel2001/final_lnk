import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/databases/cache/my_cache.dart';
import '../../../../../../core/databases/cache/my_cache_keys.dart';
import '../../manager/settings_cubit.dart';
import 'language_item.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _SettingSelectLanguageScreenState();
}

class _SettingSelectLanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    SettingsCubit.get(context).language = context.locale.languageCode;
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context, 'refresh');
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 22,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      // Language Selection Cards
                      SettingLanguageItem(
                        onTap: () {
                          MyCache.setString(
                            key: MyCacheKeys.language,
                            value: 'en',
                          );
                          context.setLocale(const Locale('en', 'US'));
                          SettingsCubit.get(context).update();
                        },
                        icon: Icons.language,
                        language: 'English',
                        value: 'en',
                        flagPath: 'assets/imgs/um.svg',
                        isSelected:
                            SettingsCubit.get(context).language == 'en'
                                ? true
                                : false,
                      ),
                      const SizedBox(height: 12),
                      SettingLanguageItem(
                        onTap: () {
                          MyCache.setString(
                            key: MyCacheKeys.language,
                            value: 'ar',
                          );
                          context.setLocale(const Locale('ar', 'EG'));
                          SettingsCubit.get(context).update();
                        },
                        icon: Icons.language,
                        language: 'العربية',
                        value: 'ar',
                        flagPath: 'assets/imgs/eg.svg',
                        isSelected:
                            SettingsCubit.get(context).language == 'ar'
                                ? true
                                : false,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        );
      },
    );
  }
}
