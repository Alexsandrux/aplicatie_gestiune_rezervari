import 'package:aplicatie_gestiune_rezervari/widgets/rezervari/rezervari_admin_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminRezervari extends StatefulWidget {
  const AdminRezervari({Key? key}) : super(key: key);

  static const String routeName = "/admin_rezervari";

  @override
  State<AdminRezervari> createState() => _AdminRezervariState();
}

class _AdminRezervariState extends State<AdminRezervari> {
  Future<QuerySnapshot> getDocument() async {
    return FirebaseFirestore.instance
        .collection("rezervari")
        .orderBy("dataSosire", descending: false)
        .where("dataSosire",
            isGreaterThanOrEqualTo:
                DateTime.now().subtract(const Duration(days: 1)))
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
          future: getDocument(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: ((context, index) => RezervareAdminTile(
                        stareRezervare: snapshot.data!.docs[index]['stare'],
                        dataSosire: (snapshot.data!.docs[index]["dataSosire"]
                                as Timestamp)
                            .toDate(),
                        dataPlecare: (snapshot.data!.docs[index]["dataPlecare"]
                                as Timestamp)
                            .toDate(),
                        dataInregistrare: (snapshot.data!.docs[index]
                                ["dataInregistrareRezervare"] as Timestamp)
                            .toDate(),
                        idCamera: snapshot.data!.docs[index]["idCamera"],
                        idUtilizator: snapshot.data!.docs[index]
                            ["idUtilizator"],
                        idRezervare: (snapshot.data!.docs[index].id),
                      )));
            } else if (snapshot.connectionState == ConnectionState.none) {
              return const Text("No data");
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
