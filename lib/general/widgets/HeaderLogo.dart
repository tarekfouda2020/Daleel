import 'package:flutter/material.dart';
import 'package:base_flutter/res.dart';

class HeaderLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 50),
      child: Image(
        height: 140,
        width: 140,
        image: AssetImage(Res.logoMark),
        fit: BoxFit.contain,
      ),
    );
  }
}
