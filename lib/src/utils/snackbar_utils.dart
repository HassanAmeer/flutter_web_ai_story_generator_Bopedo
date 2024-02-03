import 'package:flutter/material.dart';

$showSnackBar(BuildContext context, String content) {
  final messenger = ScaffoldMessenger.of(context);
  messenger.hideCurrentSnackBar();
  messenger.removeCurrentSnackBar();
  messenger.showSnackBar(SnackBar(content: Text(content)));
}
