import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';

class AllHotels extends StatelessWidget {
  const AllHotels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      appBar: AppBar(
        title: const Text("All Hotels"),
        backgroundColor: AppStyles.bgColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 1.0,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.red,
              child: const Text('Hello Grid'),
            );
          },
        ),
      ),
    );
  }
}
