import 'package:flutter/material.dart';
import 'package:fitness_tracker/colors.dart';
import 'package:provider/provider.dart';

class Water extends StatefulWidget {
  const Water({super.key});

  @override
  State<Water> createState() => _WaterState();
}

class _WaterState extends State<Water> {
  final List<Map<String, dynamic>> waterData = [  ];

  final dateController = TextEditingController();
  final literController = TextEditingController();

  void addData(String date, double liters) {
    setState(() {
      String status;
      Color color;

      if (liters < 1.5) {
        status = 'Bad';
        color = Colors.redAccent;
      } else if (liters >= 1.5 && liters <= 2) {
        status = 'Average';
        color = Colors.amber;
      } else {
        status = 'Good';
        color = Colors.greenAccent;
      }

      waterData.add({
        'date': date,
        'liters': liters,
        'status': status,
        'color': color,
      });
    });
  }

  @override
  void dispose() {
    dateController.dispose();
    literController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.putih,
        title: Text("Water Intake Tracker"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: waterData.length,
          itemBuilder: (context, index) {
            final item = waterData[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: item['color'],
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['date'],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '${item['liters']} liter(s)',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        item['status'],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Add Water Intake"),
                content: SizedBox(
                  height: 200,
                  child: Column(
                    children: [
                      TextField(
                        controller: dateController,
                        decoration: InputDecoration(
                          labelText: "Date",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        controller: literController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Liters",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      final date = dateController.text;
                      final liters = double.tryParse(literController.text);
                      if (date.isNotEmpty && liters != null) {
                        addData(date, liters);
                        dateController.clear();
                        literController.clear();
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text("Add"),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
