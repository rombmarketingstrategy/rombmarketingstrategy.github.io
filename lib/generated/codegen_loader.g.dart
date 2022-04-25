// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> hr = {
  "automatic_return": "Automatsko vraćanje za",
  "checkboxes": {
    "contact_me": "Suglasan/suglasna sam da me se kontaktira u svrhu gore navedenih aktivnosti te u svrhu provjere korisniškog iskustva.",
    "exclusive": "Suglasan/suglasna sam da prikupljeni podaci za koje sam dao suglasnosti budu proslijeđeni isključivo kompanijama koje posluju u ovkiru RMS Grupe. U svrhu naknadnog obavještavanja o informacijama vezanim uz uređaj.",
    "i_read_everything": "Ovim potvrđujem da sam pročitao/pročitala politiku obrade osobnih podataka od strane RMS/a u svrhu zaštite privatnosti.",
    "not_want_ads": "Nisam suglasan/suglasna da me kontaktirate u svrhu marketinga i istraživanja tržišta.",
    "send_info": "Suglasan/suglasna sam da RMS obrađuje moje osobne podatke u svrhu slanja informacija o uređaju i pružanja tehničke podrške. Ove aktivnosti može izvršiti RMS odnosno društvo koje posluje unutar RMS Grupe ili ovlaštena treća strana.",
    "use_my_data": "Suglasan/suglasna sam da RMS obrađuje moje osobne podatke u svrhu istraživanja tržišta."
  },
  "error": {
    "missing_field": "Ovo polje mora bit ispunjeno"
  },
  "fields": {
    "birthday": "Datum Rođenja",
    "city": "Grad",
    "device_code": "Jedinstveni kod uređaja",
    "email": "E-Mail",
    "location": "Prodajno mjesto",
    "name_and_surname": "Ime i Prezime",
    "phone": "Telefon",
    "recommendation_code": "Kod preporuke prodajnog predstavnika",
    "signature": "Potpis"
  },
  "return": "Vrati se",
  "send": "Potvrda",
  "subtitles": {
    "customer": "Popunjava kupac",
    "salesperson": "Popunjava prodavač"
  },
  "thank_you": "Hvala vam na prijavi",
  "title": "Obrazac za prijavu"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"hr": hr};
}
