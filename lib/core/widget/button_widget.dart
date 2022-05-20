import 'package:flutter/material.dart';
import 'package:common/theme.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: CustomColor.primary,
        minimumSize: const Size.fromHeight(50),
      ),
      child: FittedBox(
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
      onPressed: onClicked,
    );
  }
}

class ButtonIconWidget extends StatelessWidget {
  final Icon icon;
  final VoidCallback onClicked;

  const ButtonIconWidget({
    Key? key,
    required this.icon,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: CustomColor.primary,
        minimumSize: const Size.fromHeight(50),
      ),
      child: FittedBox(
        child: icon,
      ),
      onPressed: onClicked,
    );
  }
}

class ButtonPrimary extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonPrimary({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: CustomColor.buttonPrimary1Background,
        minimumSize: const Size.fromHeight(40),
        splashFactory: NoSplash.splashFactory,
      ),
      child: FittedBox(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: CustomColor.buttonPrimary1Font,
          ),
        ),
      ),
      onPressed: onClicked,
    );
  }
}

class ButtonSecondary extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonSecondary({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        minimumSize: const Size.fromHeight(40),
      ),
      onPressed: onClicked,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: CustomColor.buttonSecondary1Font,
        ),
      ),
    );
  }
}
