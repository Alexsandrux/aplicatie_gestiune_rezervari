import 'package:flutter/material.dart';

class CameraInformationTile extends StatelessWidget {
  final String subtitle;
  final String description;

  const CameraInformationTile(
      {required this.subtitle, required this.description, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: double.infinity,
          color: Theme.of(context).primaryColorDark,
          child: Row(
            children: [
              const SizedBox(
                width: 10,
                height: 10,
              ),
              Text(subtitle),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            description,
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
