import 'package:aplicatie_gestiune_rezervari/widgets/stiri/stire_item.dart';
import 'package:flutter/material.dart';

import '../../models/stire.dart';
import 'package:provider/provider.dart';

import '../../providers/stiri_provider.dart';

class StiriList extends StatefulWidget {
  const StiriList({Key? key}) : super(key: key);

  @override
  State<StiriList> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<StiriList> {
  List<Stire> stiri = [];

  @override
  Widget build(BuildContext context) {
    var stiriData = Provider.of<StiriProvider>(context, listen: false);
    stiri = stiriData.getItems;
    return ListView.builder(
        itemCount: stiri.length,
        itemBuilder: (ctx, index) {
          return StireItem(
              url: stiri[index].url, descriere: stiri[index].descriere);
        });
  }
}
