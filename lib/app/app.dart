 
import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm_example/modules/main/screen.dart';
import 'package:flutter_provider_mvvm_example/modules/sign_in/screen.dart';
import 'package:flutter_provider_mvvm_example/modules/welcome/screen.dart';
import 'package:flutter_provider_mvvm_example/routers/routers.dart';
import 'package:flutter_provider_mvvm_example/view_models/license_view_model.dart';
import 'package:flutter_provider_mvvm_example/view_models/user_view_model.dart';
import 'package:provider/provider.dart';

class MobileApp extends StatelessWidget {
  const MobileApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => LicenseViewModel(), lazy: true),
      ],
      builder: (_, child) => child!,
      child: MaterialApp(
        routes: {
          RouterNames.welcome: (context) => const WelcomeScreen(),
          RouterNames.signIn: (context) => const SignInScreen(),
          RouterNames.main: (context) => const MainScreen(),
        },
        initialRoute: RouterNames.signIn,
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
      ),
    );
  }
}
