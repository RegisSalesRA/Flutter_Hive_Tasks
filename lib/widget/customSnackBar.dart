import 'package:flutter/material.dart';

snackbar(messeger) {
  return SnackBar(
    duration: Duration(seconds: 2),
    content: Text(
      messeger,
      textAlign: TextAlign.center,
    ),
  );
}
