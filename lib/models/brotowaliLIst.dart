import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Brotowalilist {
  final int id;
  final String title;
  final String description;

  Brotowalilist(this.id, this.title, this.description);
}

List<Brotowalilist> BrotowaliList = [
  Brotowalilist(1, 'brotowali_benefit_title_1', 'brotowali_benefit_1'),
  Brotowalilist(2, 'brotowali_benefit_title_2', 'brotowali_benefit_2'),
  Brotowalilist(3, 'brotowali_benefit_title_3', 'brotowali_benefit_3'),
  Brotowalilist(4, 'brotowali_benefit_title_4', 'brotowali_benefit_4'),
  Brotowalilist(5, 'brotowali_benefit_title_5', 'brotowali_benefit_5'),
];

String getLocalizedTextDescription(BuildContext context, String key) {
  final localizations = AppLocalizations.of(context)!;
  final Map<String, String> localizedStrings = {
    'brotowali_benefit_1': localizations.brotowali_benefit_1,
    'brotowali_benefit_2': localizations.brotowali_benefit_2,
    'brotowali_benefit_3': localizations.brotowali_benefit_3,
    'brotowali_benefit_4': localizations.brotowali_benefit_4,
    'brotowali_benefit_5': localizations.brotowali_benefit_5,
  };

  return localizedStrings[key] ?? 'Teks tidak ditemukan';
}

String getLocalizedTextTitle(BuildContext context, String key) {
  final localizations = AppLocalizations.of(context)!;
  final Map<String, String> localizedStrings = {
    'brotowali_benefit_title_1': localizations.brotowali_benefit_title_1,
    'brotowali_benefit_title_2': localizations.brotowali_benefit_title_2,
    'brotowali_benefit_title_3': localizations.brotowali_benefit_title_3,
    'brotowali_benefit_title_4': localizations.brotowali_benefit_title_4,
    'brotowali_benefit_title_5': localizations.brotowali_benefit_title_5,
  };

  return localizedStrings[key] ?? 'Teks tidak ditemukan';
}
