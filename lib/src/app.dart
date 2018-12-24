import 'package:flutter/material.dart';
import 'package:login_form_bloc/src/blocs/app_state_provider.dart';
import 'package:login_form_bloc/src/screens/home_screen.dart';
import 'package:login_form_bloc/src/screens/login_screen.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // InheritedWidget: make bloc (SCOPE) available
    // for all subtree below
    return AppStateProvider(
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/home': (context) => HomeScreen(),
        },
      ),
    );
  }
}
