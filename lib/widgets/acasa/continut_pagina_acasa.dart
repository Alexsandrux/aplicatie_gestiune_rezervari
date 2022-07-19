import 'package:flutter/material.dart';

import '../drawer/main_drawer.dart';

class ContinutPaginaAcasa extends StatelessWidget {
  const ContinutPaginaAcasa({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: const Color.fromARGB(255, 151, 197, 235),
                ),
                color: Theme.of(context).backgroundColor),
            child: SizedBox(
              height: 400,
              child: Center(
                child: Image.asset("lib/assets/pictures/cladire.png",
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: const Color.fromARGB(255, 151, 197, 235),
                ),
                color: Theme.of(context).backgroundColor),
            child: Column(
              children: const [
                Center(
                  child: Text(
                      """ AICI, LA MUNTELE ALB oferim odihna a trupului si a mintii, la peste 1650 m altitudine. Aer curat, LINISTE, poate doar rasetele copiilor mai “deranjeaza”. Avem wifi si tv … dar totul totul se desfasoara afara, in mijlocul naturii. 
Trasee avem destule, locuri de vizitat.. cateva, dar impunatoare: Varful Ursu, Manastirea Alina Maria."""),
                ),
                Center(
                  child: Text(
                      """ Pensiunea Muntele Alb se afla in mijlocul Muntilor Capatanii. 
Marginita de Varful Ursu, Horezu, Vaideeni, Buila si Manastirea Alina Maria, se afla la peste 1600m altitudine.
 """),
                ),
              ],
            ),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Acasă"),
      ),
    );
  }
}
