import 'package:flutter/material.dart';

import 'controller.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final controller = SignInViewController();

  @override
  void initState() {
    {
      // testing code
      controller.userName.text = '13344445555';
      controller.smsCode.text = '888888';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.grey)],
          ),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(controller: controller.userName),
                TextField(controller: controller.smsCode),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => controller.signIn(context, () => mounted),
                    child: const Text('登录', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
