import './stare_rezervare/stare.dart';
import './stare_rezervare/stare_anulata.dart';
import './stare_rezervare/stare_rezervata.dart';
import './stare_rezervare/stare_finalizata.dart';
import './stare_rezervare/stare_in_curs_de_rezervare.dart';

class Rezervare {
  late String idRezervare;
  final String idUtilizator;
  final String idCamera;
  final DateTime dataSosire;
  final DateTime dataPlecare;
  final DateTime dataInregistrareRezervare;
  Stare _stare = StareInCursDeRezervare();

  Rezervare({
    required this.idCamera,
    required this.dataSosire,
    required this.dataPlecare,
    required this.dataInregistrareRezervare,
    required this.idUtilizator,
  });

  void anulareRezervare() {
    Stare stareAnulare = StareAnulata();
    stareAnulare.schimbaStare(this);
  }

  void finalizareRezervare() {
    Stare stareRezervata = StareRezervata();
    stareRezervata.schimbaStare(this);
  }

  void finalizareSejurRezervare() {
    Stare stareFinalizata = StareFinalizata();
    stareFinalizata.schimbaStare(this);
  }

  set setStare(Stare stare) {
    _stare = stare;
  }

  Stare get getStare {
    return _stare;
  }

  @override
  String toString() {
    return "id: $idRezervare, idCamera: $idCamera, dataSosire: $dataSosire, dataPlecare: $dataPlecare, DataInregistrare: $dataInregistrareRezervare";
  }
}
