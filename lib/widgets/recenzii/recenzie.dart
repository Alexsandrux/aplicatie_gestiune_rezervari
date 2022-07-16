import 'package:aplicatie_gestiune_rezervari/screens/homepage_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/recenzii/manager_add_recenzie.dart';

class Recenzie extends StatelessWidget {
  const Recenzie({
    Key? key,
  }) : super(key: key);

  void addRecenzieNoua(BuildContext context, double rating) async {
    var sp = await SharedPreferences.getInstance();
    var zi = sp.getString("zi");
    var luna = sp.getString("luna");

    if (zi != null && luna != null) {
      if (zi == DateTime.now().day.toString() &&
          luna == DateTime.now().month.toString()) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("A mai fost adaugată o recenzie astăzi!")));
      } else {
        await sp.setString("zi", DateTime.now().day.toString());
        await sp.setString("luna", DateTime.now().month.toString());
        ManagerAddRecenzie().addRecenzie(rating, context);
        Navigator.of(context).pushReplacementNamed(HomepageScreen.routeName);
      }
    } else {
      await sp.setString("zi", DateTime.now().day.toString());
      await sp.setString("luna", DateTime.now().month.toString());
      ManagerAddRecenzie().addRecenzie(rating, context);
      Navigator.of(context).pushReplacementNamed(HomepageScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 3,
      minRating: 0.5,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        addRecenzieNoua(context, rating);
      },
    );
  }
}
