import 'package:flutter/material.dart';

const offlineSnackbar = SnackBar(
  content: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(
        Icons.wifi_off,
        color: Colors.white,
      ),
      SizedBox(width: 20),
      Text(
        "Cannot connect to the backend.",
        textAlign: TextAlign.center,
      ),
    ],
  ),
);
