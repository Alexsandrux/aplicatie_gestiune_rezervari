import 'package:aplicatie_gestiune_rezervari/models/rezervare.dart';
import 'package:aplicatie_gestiune_rezervari/models/stare_rezervare/stare_anulata.dart';
import 'package:aplicatie_gestiune_rezervari/models/stare_rezervare/stare_finalizata.dart';
import 'package:aplicatie_gestiune_rezervari/models/stare_rezervare/stare_in_curs_de_rezervare.dart';
import 'package:aplicatie_gestiune_rezervari/models/stare_rezervare/stare_rezervata.dart';

class ConvertorTextInStare {

  void transformaTextInStare(Rezervare rezervare, String text) {
    if(StareAnulata().runtimeType.toString() == text)
    {
      rezervare.setStare = StareAnulata();
    }
    else if(StareFinalizata().runtimeType.toString() == text)
    {
      rezervare.setStare = StareFinalizata();
    }
    else if(StareInCursDeRezervare().runtimeType.toString() == text)
    {
      rezervare.setStare = StareInCursDeRezervare();
    }
    else  if(StareRezervata().runtimeType.toString() == text)
    {
      rezervare.setStare = StareRezervata();
    }
    else {
      throw "Nu exista tipul asta de stare";
    }
  }
}