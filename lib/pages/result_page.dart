import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double bmiResult;
  final String bmiCategory;
  final String bmiDescription;
  final int weight;
  final double height;
  final int age;
  final String gender;

  const ResultPage({
    Key? key,
    required this.bmiResult,
    required this.bmiCategory,
    required this.bmiDescription,
    required this.weight,
    required this.height,
    required this.age,
    required this.gender,
  }) : super(key: key);

  Color _getColorForCategory(String category) {
    switch (category.toLowerCase()) {
      case 'underweight':
        return Colors.blue;
      case 'normal':
        return const Color(0xFF65B741);
      case 'overweight':
        return Colors.orange;
      case 'obese':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  List<Color> _getGradientColors() {
    final List<Color> colors = [
      Colors.blue,
      const Color(0xFF65B741),
      Colors.yellow,
      Colors.orange,
      Colors.red,
    ];
    return colors;
  }

  @override
  Widget build(BuildContext context) {
    // Calculate healthy weight range based on actual height
    double heightInMeters = height / 100;
    double minWeight = (18.5 * heightInMeters * heightInMeters).roundToDouble();
    double maxWeight = (24.9 * heightInMeters * heightInMeters).roundToDouble();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFF0F8EC),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'Your BMI:',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    bmiResult.toStringAsFixed(1),
                    style: TextStyle(
                      fontSize: 72,
                      fontWeight: FontWeight.bold,
                      color: _getColorForCategory(bmiCategory),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: _getColorForCategory(bmiCategory),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      bmiCategory,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: _getGradientColors(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildMeasurementBox('Weight', '$weight kg'),
                      _buildMeasurementBox('Height', '${height.round()} cm'),
                      _buildMeasurementBox('Age', '$age'),
                      _buildMeasurementBox('Gender', gender),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Healthy weight for the height:',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '$minWeight kg - $maxWeight kg',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: _getColorForCategory('Normal'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: double.infinity,
                height: 90,
                decoration: BoxDecoration(
                  color: const Color(0xFF65B741),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Text(
                    'Close',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMeasurementBox(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
