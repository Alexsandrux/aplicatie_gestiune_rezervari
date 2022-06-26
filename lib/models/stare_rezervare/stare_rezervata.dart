import 'package:aplicatie_gestiune_rezervari/models/stare_rezervare/stare_in_curs_de_rezervare.dart';
import 'package:flutter/foundation.dart';
import '../rezervare.dart';
import 'stare.dart';

class StareRezervata implements Stare {
  @override
  void schimbaStare(Rezervare rezervare) {
    if(rezervare.getStare.runtimeType == StareInCursDeRezervare)
    {
      rezervare.setStare = this;
    }
    else {
      if (kDebugMode) {
        print("Rezervare nu poate trece in starea rezervata deoarcere nu este de tipul in curs de rezervare!");
    
      }}

    
  }
}


