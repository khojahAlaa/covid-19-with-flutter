import '../utils/styleConstant.dart';
import 'package:flutter/material.dart';
import '../network/constUrl.dart';

class MoreStatic extends StatelessWidget {
  final Color color;
  final IconData iconName;
  final String title;
  final String number;

  const MoreStatic({
    Key key,
    this.color,
    this.iconName,
    this.title,
    this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 15,
        backgroundColor: color.withOpacity(.26),
        child: Icon(
          iconName,
          size: 18.0,
          color: color,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: color,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Text(
        number.toString().replaceAllMapped(reg, mathFun),
        style: subTextStyle,
      ),
    );
  }
}
