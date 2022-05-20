import 'package:common/theme.dart';
import 'package:flutter/material.dart';

void fieldFocusChange(
  BuildContext context,
  FocusNode currentFocus,
  FocusNode nextFocus,
) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}

void showLoadingDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Row(
      children: [
        const CircularProgressIndicator(),
        Container(
          margin: const EdgeInsets.only(left: 7),
          child: const Text("Loading..."),
        ),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

void hideLoadingDialog(BuildContext context) {
  Navigator.pop(context);
}

void showConfirmDialog(
  BuildContext context,
  String title,
  String message,
  VoidCallback onConfirm,
) {
  // Set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      TextButton(
        child: const Text("ยกเลิก"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      TextButton(
        child: const Text("ตกลง"),
        onPressed: () {
          Navigator.pop(context);
          onConfirm.call();
        },
      ),
    ],
  );
  // Show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

void showAlertDialog(
  BuildContext context,
  String message,
  VoidCallback onConfirm,
) {
  // Set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content: Text(message),
    actions: [
      TextButton(
        child: const Text("ตกลง"),
        onPressed: () {
          Navigator.pop(context);
          onConfirm.call();
        },
      ),
    ],
  );
  // Show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Widget buildTextFormField(
  BuildContext context,
  FocusNode focusNode,
  TextEditingController controller,
  String labelText,
  TextInputType textInputType,
  FocusNode nextNode,
) {
  final Size size = MediaQuery.of(context).size;
  return Container(
    width: size.width,
    height: 50,
    child: TextFormField(
      focusNode: focusNode,
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: const BorderSide(
            color: CustomColor.textFieldBackground,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: const BorderSide(
            color: CustomColor.textFieldBackground,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: const BorderSide(
            color: CustomColor.textFieldBackground,
          ),
        ),
        focusColor: CustomColor.hintColor,
        hoverColor: CustomColor.textFieldBackground,
        fillColor: CustomColor.textFieldBackground,
        filled: true,
        labelText: labelText,
        labelStyle: CustomTheme.mainTheme.textTheme.bodyText2,
      ),
      cursorColor: CustomColor.hintColor,
      onFieldSubmitted: (term) {
        fieldFocusChange(context, focusNode, nextNode);
      },
    ),
  );
}
