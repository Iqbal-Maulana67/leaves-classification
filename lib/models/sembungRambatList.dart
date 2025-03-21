import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Sembungrambatlist {
  final int id;
  final String title;
  final String description;

  Sembungrambatlist(this.id, this.title, this.description);
}

List<Sembungrambatlist> SembungRambatList = [
  Sembungrambatlist(
      1, 'sembung_rambat_benefit_title_1', 'sembung_rambat_benefit_1'),
  Sembungrambatlist(
      2, 'sembung_rambat_benefit_title_2', 'sembung_rambat_benefit_2'),
  Sembungrambatlist(
      3, 'sembung_rambat_benefit_title_3', 'sembung_rambat_benefit_3'),
  Sembungrambatlist(
      4, 'sembung_rambat_benefit_title_4', 'sembung_rambat_benefit_4'),
  Sembungrambatlist(
      5, 'sembung_rambat_benefit_title_5', 'sembung_rambat_benefit_5'),
];

String getLocalizedTextDescription(BuildContext context, String key) {
  final localizations = AppLocalizations.of(context)!;
  final Map<String, String> localizedStrings = {
    'sembung_rambat_benefit_1': localizations.sembung_rambat_benefit_1,
    'sembung_rambat_benefit_2': localizations.sembung_rambat_benefit_2,
    'sembung_rambat_benefit_3': localizations.sembung_rambat_benefit_3,
    'sembung_rambat_benefit_4': localizations.sembung_rambat_benefit_4,
    'sembung_rambat_benefit_5': localizations.sembung_rambat_benefit_5,
  };

  return localizedStrings[key] ?? 'Teks tidak ditemukan';
}

String getLocalizedTextTitle(BuildContext context, String key) {
  final localizations = AppLocalizations.of(context)!;
  final Map<String, String> localizedStrings = {
    'sembung_rambat_benefit_title_1':
        localizations.sembung_rambat_benefit_title_1,
    'sembung_rambat_benefit_title_2':
        localizations.sembung_rambat_benefit_title_2,
    'sembung_rambat_benefit_title_3':
        localizations.sembung_rambat_benefit_title_3,
    'sembung_rambat_benefit_title_4':
        localizations.sembung_rambat_benefit_title_4,
    'sembung_rambat_benefit_title_5':
        localizations.sembung_rambat_benefit_title_5,
  };

  return localizedStrings[key] ?? 'Teks tidak ditemukan';
}
