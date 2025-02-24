import 'package:fitness_tracker/model/user.dart';
import 'package:flutter/material.dart';
import 'package:fitness_tracker/colors.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.putih,
        title: Text("Fitness Tracker"),
      ),
      backgroundColor: AppColors.putihBG,
      body: Consumer<User>(
        builder: (context, user, child) {
          String uname = user.uname;
          return Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: 
                    [Text('Hi, ', style: TextStyle(fontSize: 24)), 
                    Text('$uname', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))]
                ),
                Text("Hydrate. Move. Repeat.", style: TextStyle(fontSize: 16, color: AppColors.abuText)),
                SizedBox(height: 10),
                Text("Today's Overview", style: TextStyle(fontSize: 24)),
                Row(
                  children: [
                    Expanded(
                      child: CardWidget(
                        title: "Steps", 
                        subtitle: "take", 
                        value: "1623", 
                        unit: "step(s)")
                    ),
                    Expanded(
                      child: CardWidget(
                        title: "Water", 
                        subtitle: "intake", 
                        value: "1", 
                        unit: "liter(s)")
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}


class CardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String value;
  final String unit;

  const CardWidget({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(subtitle, style: TextStyle(color: Colors.grey, fontSize: 12)),
            SizedBox(height: 10),
            Row(
              children: [
                Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(width: 5),
                Text(unit, style: TextStyle(color: Colors.grey, fontSize: 14)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
