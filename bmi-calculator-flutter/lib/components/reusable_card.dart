import '../constants.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onPress;

  ReusableCard({@required this.colour, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(kContainerWidgetMargin),
        child: cardChild,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kContainerWidgetBorderRadius),
            color: colour),
      ),
    );
  }
}
