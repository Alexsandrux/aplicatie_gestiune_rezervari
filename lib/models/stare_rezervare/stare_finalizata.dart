
import 'package:aplicatie_gestiune_rezervari/models/stare_rezervare/stare_rezervata.dart';
import 'package:flutter/foundation.dart';
import '../rezervare.dart';
import 'stare.dart';



class StareFinalizata implements Stare {
  @override
  void schimbaStare(Rezervare rezervare) {
    if(rezervare.getStare.runtimeType == StareRezervata)
    {
      rezervare.setStare = this;
    }
    else {
      if (kDebugMode) {
        print("Rezervare nu poate trece in starea finalizata deoarcere nu este de tipul rezervata!");
    
      }}
  }
}