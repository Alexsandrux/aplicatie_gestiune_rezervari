// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class StireItem extends StatelessWidget {
  final String url;
  final String descriere;

  const StireItem({
    required this.url,
    required this.descriere,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 15,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 300,
            child: Image.network(url, fit: BoxFit.cover),
          ),
          Card(
            child: Center(
              child: Text(descriere, textScaleFactor: 1.5),
            ),
          )
        ],
      ),
    );
  }
}
