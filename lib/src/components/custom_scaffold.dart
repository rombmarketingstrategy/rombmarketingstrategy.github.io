import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final bool isLoading;
  const CustomScaffold({required this.body, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : body,
    );
  }
}
