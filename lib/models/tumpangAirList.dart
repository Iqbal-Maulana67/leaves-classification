import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Tumpangairlist {
  final int id;
  final String title;
  final String description;

  Tumpangairlist(this.id, this.title, this.description);
}

List<Tumpangairlist> TumpangAirList = [
  Tumpangairlist(1, 'tumpang_air_benefit_title_1', 'tumpang_air_benefit_1'),
  Tumpangairlist(2, 'tumpang_air_benefit_title_2', 'tumpang_air_benefit_2'),
  Tumpangairlist(3, 'tumpang_air_benefit_title_3', 'tumpang_air_benefit_3'),
  Tumpangairlist(4, 'tumpang_air_benefit_title_4', 'tumpang_air_benefit_4'),
  Tumpangairlist(5, 'tumpang_air_benefit_title_5', 'tumpang_air_benefit_5'),
];

String getLocalizedTextDescription(BuildContext context, String key) {
  final localizations = AppLocalizations.of(context)!;
  final Map<String, String> localizedStrings = {
    'tumpang_air_benefit_1': localizations.tumpang_air_benefit_1,
    'tumpang_air_benefit_2': localizations.tumpang_air_benefit_2,
    'tumpang_air_benefit_3': localizations.tumpang_air_benefit_3,
    'tumpang_air_benefit_4': localizations.tumpang_air_benefit_4,
    'tumpang_air_benefit_5': localizations.tumpang_air_benefit_5,
  };

  return localizedStrings[key] ?? 'Teks tidak ditemukan';
}

String getLocalizedTextTitle(BuildContext context, String key) {
  final localizations = AppLocalizations.of(context)!;
  final Map<String, String> localizedStrings = {
    'tumpang_air_benefit_title_1': localizations.tumpang_air_benefit_title_1,
    'tumpang_air_benefit_title_2': localizations.tumpang_air_benefit_title_2,
    'tumpang_air_benefit_title_3': localizations.tumpang_air_benefit_title_3,
    'tumpang_air_benefit_title_4': localizations.tumpang_air_benefit_title_4,
    'tumpang_air_benefit_title_5': localizations.tumpang_air_benefit_title_5,
  };

  return localizedStrings[key] ?? 'Teks tidak ditemukan';
}
