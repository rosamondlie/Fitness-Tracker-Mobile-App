import 'package:fitness_tracker/model/user.dart';
import 'package:flutter/material.dart';
import 'package:fitness_tracker/colors.dart';
import 'package:provider/provider.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  final unameController = TextEditingController();

  @override
  void dispose() {
    unameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.putih,
        title: Text("Fitness Tracker"),
      ),
      backgroundColor: AppColors.putihBG,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                "Lets start living healty from now on",
                style: TextStyle(fontSize: 16, color: AppColors.abuText),
              ),
              Form(
                child: TextFormField(
                  controller: unameController,
                  decoration: InputDecoration(
                    labelText: 'Input your Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  user.getUsername(unameController.text);
                  Navigator.pushNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.hitam, // Button background color
                  foregroundColor: AppColors.putih, // Text color
                ),
                child: const Text(
                  "start",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
