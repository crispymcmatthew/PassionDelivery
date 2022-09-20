import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:passion_delivery2/screens/authenticate/authenticate.dart';
import 'package:passion_delivery2/models/users.dart';
import 'package:passion_delivery2/screens/to_auth.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<Users?>(context);

    //return either Home or Authenticate widget
    if(user == null) {
      return const Authenticate();
    } else {
      return  const ToAuth();
    }
  }
}