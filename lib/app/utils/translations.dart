import 'package:get/get.dart';

// Modules Translations
import 'package:animelist/app/modules/home/home_translations.dart';
import 'package:animelist/app/modules/media_details/media_details_translations.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          // Modules
          ...HomeTranslations().en,
          ...MediaDetailsTranslations().en,

          // Apps
          "cancel": "Cancel",

          "change_lang": "Change Language",
          "lang_spanish": "Spanish",
          "lang_english": "English",
        },
        "es_CO": {
          // Modules
          ...HomeTranslations().es,
          ...MediaDetailsTranslations().es,

          // Apps
          "cancel": "Cancelar",

          "change_lang": "Cambiar Idioma",
          "lang_spanish": "Español",
          "lang_english": "Ingles",
        },
      };
}
