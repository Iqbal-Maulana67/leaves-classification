import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final bool isActive;
  const Indicator({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
      width: 5.0,
      height: 5.0,
      margin: EdgeInsets.symmetric(horizontal: 1.0, vertical: 10.0),
      decoration: BoxDecoration(
          color: isActive
              ? Color.fromRGBO(202, 199, 199, 1)
              : Color.fromRGBO(240, 236, 236, 1),
          borderRadius: BorderRadius.circular(8.0)),
    );
  }
}
