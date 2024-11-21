import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: ListView(
        children: [
          Text("What are\n you looking for?")
        ],
      )
    );
  }
}
