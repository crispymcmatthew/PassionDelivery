import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Image.asset(
            'lib/assets/loading_image.jpg',
            fit: BoxFit.cover
        ),
      ),
    );
  }
}