import '../constants.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  final String gender;
  final IconData genderIcon;

  GenderCard({@required this.gender, @required this.genderIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(genderIcon, size: 70.0),
        SizedBox(height: 12.0),
        Text(gender, style: kLabelTextStyle)
      ],
    );
  }
}
