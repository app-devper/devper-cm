import 'package:common/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:common/localizations/localizations.dart';

void showLoadingDialog(BuildContext context) {
  final localizations = CommonLocalizations.of(context);
  AlertDialog alert = AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          localizations.loading,
          style: TextStyle(
            color: CustomColor.font1,
            fontSize: 16,
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 10)),
        CircularProgressIndicator(
          color: CustomColor.backgroundMain,
        ),
      ],
    ),
    contentPadding: const EdgeInsets.all(20.0),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: alert,
      );
    },
  );
}

void hideLoadingDialog(BuildContext context) {
  Navigator.pop(context);
}

void showAlertDialog(
  BuildContext context, {
  required String message,
  required VoidCallback onConfirm,
  String? title,
}) {
  final localizations = CommonLocalizations.of(context);
  AlertDialog alert = AlertDialog(
    title: Text(
      title ?? localizations.errorTitle,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    titlePadding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0.0),
    content: Text(
      message,
      style: const TextStyle(
        fontFamily: "Roboto",
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    ),
    contentPadding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 0.0),
    actions: [
      TextButton(
        child: Text(
          localizations.okBtn,
          style: TextStyle(
            color: CustomColor.buttonPrimary2Font,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
          onConfirm.call();
        },
      ),
    ],
  );
  // Show the dialog
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: alert,
      );
    },
  );
}
