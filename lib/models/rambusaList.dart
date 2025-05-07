import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Rambusalist {
  final int id;
  final String title;
  final String description;

  Rambusalist(this.id, this.title, this.description);
}

List<Rambusalist> RambusaList = [
  Rambusalist(1, 'rambusa_benefit_title_1', 'rambusa_benefit_1'),
  Rambusalist(2, 'rambusa_benefit_title_2', 'rambusa_benefit_2'),
  Rambusalist(3, 'rambusa_benefit_title_3', 'rambusa_benefit_3'),
  Rambusalist(4, 'rambusa_benefit_title_4', 'rambusa_benefit_4'),
  Rambusalist(5, 'rambusa_benefit_title_5', 'rambusa_benefit_5'),
];

String getLocalizedTextDescription(BuildContext context, String key) {
  final localizations = AppLocalizations.of(context)!;
  final Map<String, String> localizedStrings = {
    'rambusa_benefit_1': localizations.rambusa_benefit_1,
    'rambusa_benefit_2': localizations.rambusa_benefit_2,
    'rambusa_benefit_3': localizations.rambusa_benefit_3,
    'rambusa_benefit_4': localizations.rambusa_benefit_4,
    'rambusa_benefit_5': localizations.rambusa_benefit_5,
  };

  return localizedStrings[key] ?? 'Teks tidak ditemukan';
}

String getLocalizedTextTitle(BuildContext context, String key) {
  final localizations = AppLocalizations.of(context)!;
  final Map<String, String> localizedStrings = {
    'rambusa_benefit_title_1': localizations.rambusa_benefit_title_1,
    'rambusa_benefit_title_2': localizations.rambusa_benefit_title_2,
    'rambusa_benefit_title_3': localizations.rambusa_benefit_title_3,
    'rambusa_benefit_title_4': localizations.rambusa_benefit_title_4,
    'rambusa_benefit_title_5': localizations.rambusa_benefit_title_5,
  };

  return localizedStrings[key] ?? 'Teks tidak ditemukan';
}
