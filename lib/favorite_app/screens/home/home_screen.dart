import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        title: Text("Favorite_App",style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Colors.black
        ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
