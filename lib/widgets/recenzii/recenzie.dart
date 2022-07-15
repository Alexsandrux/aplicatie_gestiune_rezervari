import 'package:aplicatie_gestiune_rezervari/screens/homepage_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../models/recenzii/manager_add_recenzie.dart';

class Recenzie extends StatelessWidget {
  const Recenzie({
    Key? key,
  }) : super(key: key);

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
        ManagerAddRecenzie().addRecenzie(rating, context);
        Navigator.of(context).pushReplacementNamed(HomepageScreen.routeName);
      },
    );
  }
}
