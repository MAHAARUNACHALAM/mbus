import 'package:flutter/material.dart';
import 'package:mbus/providers/hexColor.dart';

ButtonStyle buttonStyle = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
    ),
  ),
  backgroundColor: MaterialStateProperty.all<Color>(hexYellow),
);
