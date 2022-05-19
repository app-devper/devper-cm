import 'package:flutter/material.dart';

class CustomSnackBar {
  final BuildContext context;
  final Key key;

  CustomSnackBar({required this.key, required this.context});

  void showErrorSnackBar(final msg) {
    showSnackBar(text: "Error: $msg", color: Colors.red[400]);
  }

  void showLoadingSnackBar() {
    hideAll();
    final snackBar = SnackBar(
      key: key,
      content: Row(
        children: const <Widget>[
          CircularProgressIndicator(),
          SizedBox(width: 10.0),
          Text("Loading..."),
        ],
      ),
      backgroundColor: Colors.green[400],
      duration: const Duration(minutes: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showSnackBar({
    required String text,
    Duration duration = const Duration(seconds: 3),
    Color? color,
    bool action = true,
  }) {
    hideAll();
    final snackBar = SnackBar(
      key: key,
      content: Text(
        text,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      backgroundColor: color ?? Colors.green[400],
      duration: duration,
      action: action
          ? SnackBarAction(
              label: "Clear",
              textColor: Colors.black,
              onPressed: () => ScaffoldMessenger.of(context).removeCurrentSnackBar(),
            )
          : null,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void hideAll() {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
  }
}
