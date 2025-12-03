import 'package:get/get.dart';

import 'Dutch.dart';
import 'French.dart';
import 'German.dart';
import 'english.dart';

class Language extends Translations{

  @override

  Map<String, Map<String, String>> get keys =>{

    "en_US": english,
    'de_DE': Dutch,
    'fr_FR': French ,
    'nl_NL': German

};


}