import 'package:flutter/material.dart';

class DrawerButtonTile extends StatelessWidget {
  final String titlu;
  final Icon icon;
  final String screenRoute;

  const DrawerButtonTile({
    Key? key,
    required this.titlu,
    required this.icon,
    required this.screenRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.purple[200],
      onTap: () {
        Navigator.of(context).pushReplacementNamed(screenRoute);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.blue.shade900,
          ),
        ),
        child: ListTile(
          leading: icon,
          title: Text(titlu),
          tileColor: Colors.purple[100],
        ),
      ),
    );
  }
}
