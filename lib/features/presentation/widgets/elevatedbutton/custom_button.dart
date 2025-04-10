// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;

  const CustomElevatedButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFF6600),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 125, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9),
        ),
        elevation: 5,
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: isLoading
          ? const CircularProgressIndicator(
              color: Colors.blue,
            )
          : Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
    );
  }
}
