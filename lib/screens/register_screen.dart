import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameTextEditingController = TextEditingController();
  final emailTextEditingController = TextEditingController();
  final phoneTextEditingController = TextEditingController();
  final addressTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final confirmTextEditingController = TextEditingController();

  bool _passwordVisible = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool darkThem =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(0),

          children: [
            Column(

              children: [
                SizedBox(height: 60,),
                Image.asset( darkThem?
                  'asset/city.jpg': 'asset/city.jpg',width: double.infinity),

                SizedBox(height: 60,),
                Text('Register')
              ],
            )
          ],
        ),
      ),
    );
  }
}

// child: Image.asset(
// 'asset/city.jpg', // Correct the path to match the folder structure
// width: 200,
// height: 200,
// fit: BoxFit.cover,
// ),
