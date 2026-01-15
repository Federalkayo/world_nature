import 'package:calculator_app/pages/homePage.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var userName = TextEditingController();
  var password = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userName.dispose();
    password.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Login',),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: userName,
                    decoration: const InputDecoration(
                      labelText: 'Username'
                    ),
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Enter a username';
                      }
                      if(!value.contains('@') ){
                        return 'Enter a username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 50,),
                  TextFormField(
                    controller: password,
                    decoration: const InputDecoration(
                      labelText: 'Password'
                      
                    ),
                    obscureText: true,
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Enter a password';
                      }
                      if(value.length < 4){
                        return 'character must nit be less than 4';
                      }
                      return null;
                    },
                  ),
              
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if(formKey.currentState!.validate()){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HomePage())
                            );
                          }
                        },
                        child: const Text('Login'), 
                      ),
                    ),
                  )
                ],
              ),
              
            )
          ],
        ),
      ),
    );
  }
}

