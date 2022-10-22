import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function() onPressfunc;
  final String buttonText;

  const CustomElevatedButton({
    required this.onPressfunc,
    required this.buttonText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressfunc,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blue),
        textStyle: MaterialStateProperty.all(
          const TextStyle(color: Colors.white),
        ),
        minimumSize: MaterialStateProperty.all(
          Size(MediaQuery.of(context).size.width / 2.5, 50),
        ),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
