import 'package:flutter/material.dart';

class CustomTextCard extends StatelessWidget {
  final String value;
  final String textValue;

  const CustomTextCard({this.value, this.textValue}) : super();

  @override
  Widget build(BuildContext context) {
    return Text(
      "$value: $textValue",
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}
