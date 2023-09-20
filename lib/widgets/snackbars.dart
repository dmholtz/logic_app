import 'package:flutter/material.dart';

const offlineSnackbar = SnackBar(
  content: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(Icons.wifi_off, color: Colors.white),
      SizedBox(width: 20),
      Text(
        "Cannot connect to the backend.",
        textAlign: TextAlign.center,
      ),
    ],
  ),
);

const noQuizSnackbar = SnackBar(
  content: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(Icons.warning, color: Colors.white),
      SizedBox(width: 20),
      Text(
        "No quiz available.",
        textAlign: TextAlign.center,
      ),
    ],
  ),
);

const logoutSnackbar = SnackBar(
  content: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(Icons.logout, color: Colors.white),
      SizedBox(width: 10),
      Text("Successfully logged out"),
    ],
  ),
);

const resetProgressSnackbar = SnackBar(
  content: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(Icons.restore, color: Colors.white),
      SizedBox(width: 10),
      Text(
        "Successfully reset progress",
        textAlign: TextAlign.center,
      ),
    ],
  ),
);
