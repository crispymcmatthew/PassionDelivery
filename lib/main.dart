import 'package:flutter/material.dart';
import 'package:passion_delivery2/screens/wrapper.dart';
import 'package:passion_delivery2/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'models/users.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users?>.value(
      value: AuthService().user,
      initialData: Users(uid: ''),
      child: const MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

