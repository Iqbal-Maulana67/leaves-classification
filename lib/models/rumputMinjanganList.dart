import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Rumputminjanganlist {
  final int id;
  final String title;
  final String description;

  Rumputminjanganlist(this.id, this.title, this.description);
}

List<Rumputminjanganlist> RumputMinjanganList = [
  Rumputminjanganlist(
      1, 'rumput_minjangan_benefit_title_1', 'rumput_minjangan_benefit_1'),
  Rumputminjanganlist(
      2, 'rumput_minjangan_benefit_title_2', 'rumput_minjangan_benefit_2'),
  Rumputminjanganlist(
      3, 'rumput_minjangan_benefit_title_3', 'rumput_minjangan_benefit_3'),
  Rumputminjanganlist(
      4, 'rumput_minjangan_benefit_title_4', 'rumput_minjangan_benefit_4'),
  Rumputminjanganlist(
      5, 'rumput_minjangan_benefit_title_5', 'rumput_minjangan_benefit_5'),
];

String getLocalizedTextDescription(BuildContext context, String key) {
  final localizations = AppLocalizations.of(context)!;
  final Map<String, String> localizedStrings = {
    'rumput_minjangan_benefit_1': localizations.rumput_minjangan_benefit_1,
    'rumput_minjangan_benefit_2': localizations.rumput_minjangan_benefit_2,
    'rumput_minjangan_benefit_3': localizations.rumput_minjangan_benefit_3,
    'rumput_minjangan_benefit_4': localizations.rumput_minjangan_benefit_4,
    'rumput_minjangan_benefit_5': localizations.rumput_minjangan_benefit_5,
  };

  return localizedStrings[key] ?? 'Teks tidak ditemukan';
}

String getLocalizedTextTitle(BuildContext context, String key) {
  final localizations = AppLocalizations.of(context)!;
  final Map<String, String> localizedStrings = {
    'rumput_minjangan_benefit_title_1':
        localizations.rumput_minjangan_benefit_title_1,
    'rumput_minjangan_benefit_title_2':
        localizations.rumput_minjangan_benefit_title_2,
    'rumput_minjangan_benefit_title_3':
        localizations.rumput_minjangan_benefit_title_3,
    'rumput_minjangan_benefit_title_4':
        localizations.rumput_minjangan_benefit_title_4,
    'rumput_minjangan_benefit_title_5':
        localizations.rumput_minjangan_benefit_title_5,
  };

  return localizedStrings[key] ?? 'Teks tidak ditemukan';
}
