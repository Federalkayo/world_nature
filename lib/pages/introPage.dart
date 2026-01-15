import 'package:calculator_app/pages/login.dart';
import 'package:flutter/material.dart';

class Intropage extends StatefulWidget {
  const Intropage({super.key});

  @override
  State<Intropage> createState() => _IntropageState();
}

class _IntropageState extends State<Intropage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/nature4.jpeg'),

          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login())
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: const Center(
                      child: Text('Signin With Google',
                      style: TextStyle(
                        color: Colors.white
                        
                      ),
                      ),
                    ),
                    
                  ),
                ),
              ),
              
              GestureDetector(
                onTap: () {
                  
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: const Center(
                      child: Text('Signin With Google',
                      style: TextStyle(
                        color: Colors.white
                      ),
                      ),
                    ),
                    
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}