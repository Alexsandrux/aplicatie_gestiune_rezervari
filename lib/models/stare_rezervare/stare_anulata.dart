
import 'package:flutter/foundation.dart';
import '../rezervare.dart';
import 'stare.dart';

import 'package:aplicatie_gestiune_rezervari/models/stare_rezervare/stare_in_curs_de_rezervare.dart';
import 'package:aplicatie_gestiune_rezervari/models/stare_rezervare/stare_rezervata.dart';


class StareAnulata implements Stare {
    @override
  void schimbaStare(Rezervare rezervare) {
    if(rezervare.getStare.runtimeType == StareRezervata || rezervare.getStare.runtimeType == StareInCursDeRezervare)
    {
      rezervare.setStare = this;
    }
    else {
      if (kDebugMode) {
        print("Rezervare nu poate trece in starea anulata deoarcere nu este de tipul in curs de rezervare sau rezervata!");
    
      }}
  }
}