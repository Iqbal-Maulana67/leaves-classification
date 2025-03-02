import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Pegaganlist {
  final int id;
  final String title;
  final String description;

  Pegaganlist(this.id, this.title, this.description);
}

List<Pegaganlist> PegaganList = [
  Pegaganlist(1, 'pegagan_benefit_title_1', 'pegagan_benefit_1'),
  Pegaganlist(2, 'pegagan_benefit_title_2', 'pegagan_benefit_2'),
  Pegaganlist(3, 'pegagan_benefit_title_3', 'pegagan_benefit_3'),
  Pegaganlist(4, 'pegagan_benefit_title_4', 'pegagan_benefit_4'),
  Pegaganlist(5, 'pegagan_benefit_title_5', 'pegagan_benefit_5'),
];

String getLocalizedTextDescription(BuildContext context, String key) {
  final localizations = AppLocalizations.of(context)!;
  final Map<String, String> localizedStrings = {
    'pegagan_benefit_1': localizations.pegagan_benefit_1,
    'pegagan_benefit_2': localizations.pegagan_benefit_2,
    'pegagan_benefit_3': localizations.pegagan_benefit_3,
    'pegagan_benefit_4': localizations.pegagan_benefit_4,
    'pegagan_benefit_5': localizations.pegagan_benefit_5,
  };

  return localizedStrings[key] ?? 'Teks tidak ditemukan';
}

String getLocalizedTextTitle(BuildContext context, String key) {
  final localizations = AppLocalizations.of(context)!;
  final Map<String, String> localizedStrings = {
    'pegagan_benefit_title_1': localizations.pegagan_benefit_title_1,
    'pegagan_benefit_title_2': localizations.pegagan_benefit_title_2,
    'pegagan_benefit_title_3': localizations.pegagan_benefit_title_3,
    'pegagan_benefit_title_4': localizations.pegagan_benefit_title_4,
    'pegagan_benefit_title_5': localizations.pegagan_benefit_title_5,
  };

  return localizedStrings[key] ?? 'Teks tidak ditemukan';
}
