import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 5,
      child: Text(
        'Something get wrong, Unable to fetch data, \n Please try again',
        // style: Theme.of(ctx).textTheme.title.copyWith(color: Colors.grey),
        textAlign: TextAlign.center,
      ),
    );
  }
}
