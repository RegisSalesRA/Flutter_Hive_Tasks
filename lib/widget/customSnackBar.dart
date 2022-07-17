// ignore_for_file: file_names

import 'package:flutter/material.dart';

snackbar(messeger, duration,) {
  return SnackBar(
    duration: Duration(seconds: duration),
    content: Text(
      messeger,
      textAlign: TextAlign.center,
    ),
  );
}
