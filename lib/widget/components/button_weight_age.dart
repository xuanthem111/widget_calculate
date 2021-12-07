import 'package:flutter/material.dart';

class ButtonWeightHeight extends StatelessWidget {
  ButtonWeightHeight({required this.icon, required this.onPressed});

  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(
        icon,
        color: Colors.white,
        size: 30,
      ),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
  // final Function() onTap;
  // final String buttonTitle;

  // @override
  // Widget build(BuildContext context) {
  //   return GestureDetector(
  //     onTap: onTap,
  //     child: Container(
  //       child: Center(
  //         child: Text(
  //           buttonTitle,
  //           style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
  //         ),
  //       ),
  //       color: Color(0xFFEB1555),
  //       margin: EdgeInsets.only(top: 10.0),
  //       padding: EdgeInsets.only(bottom: 20.0),
  //       width: double.infinity,
  //       height: 80,
  //     ),
  //   );
  // }
}
