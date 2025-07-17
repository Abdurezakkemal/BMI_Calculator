import 'package:flutter/material.dart';
import 'result_page.dart';

class InputPage extends StatefulWidget {
  final String gender;
  const InputPage({super.key, required this.gender});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int weight = 65;
  int age = 26;
  double height = 170;
  late String gender;

  @override
  void initState() {
    super.initState();
    gender = widget.gender;
  }

  String _calculateBMICategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 25) {
      return 'Normal';
    } else if (bmi >= 25 && bmi < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  String _getBMIDescription(String category) {
    switch (category) {
      case 'Underweight':
        return 'You have a lower than normal body weight. You should eat more!';
      case 'Normal':
        return 'You have a normal body weight. Good job!';
      case 'Overweight':
        return 'You have a higher than normal body weight. Try to exercise more!';
      case 'Obese':
        return 'You have a much higher than normal body weight. You should see a doctor!';
      default:
        return '';
    }
  }

  void _calculateAndNavigate() {
    // Convert height to meters
    double heightInMeters = height / 100;
    // Calculate BMI using the formula: weight / (height^2)
    double bmi = weight / (heightInMeters * heightInMeters);
    String category = _calculateBMICategory(bmi);
    String description = _getBMIDescription(category);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          bmiResult: bmi,
          bmiCategory: category,
          bmiDescription: description,
          weight: weight,
          height: height,
          age: age,
          gender: gender,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 23,
            top: 88,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 32,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 88,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI ',
                  style: TextStyle(
                    color: const Color(0xFFFFB534),
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'CALCULATOR',
                  style: TextStyle(
                    color: const Color(0xFF65B741),
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 160,
            child: Text(
              'Please Modify the Values',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
          ),
          // Add Weight and Age containers
          Positioned(
            left: 0,
            right: 0,
            top: 220,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  // Weight Container
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFBF6EE),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Weight (kg)',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            '$weight',
                            style: TextStyle(
                              color: const Color(0xFFCE922A),
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildCircularButton(
                                icon: Icons.remove,
                                onPressed: () {
                                  setState(() {
                                    if (weight > 0) weight--;
                                  });
                                },
                              ),
                              SizedBox(width: 25),
                              _buildCircularButton(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  // Age Container
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFBF6EE),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Age',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            '$age',
                            style: TextStyle(
                              color: const Color(0xFFCE922A),
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildCircularButton(
                                icon: Icons.remove,
                                onPressed: () {
                                  setState(() {
                                    if (age > 0) age--;
                                  });
                                },
                              ),
                              SizedBox(width: 25),
                              _buildCircularButton(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Height Container
          Positioned(
            left: 0,
            right: 0,
            top: 450,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFBF6EE),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'Height (cm)',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      '${height.round()}',
                      style: TextStyle(
                        color: const Color(0xFFCE922A),
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(21, (index) {
                              bool isLongLine = index % 5 == 0;
                              return Container(
                                width: isLongLine ? 2 : 1,
                                height: isLongLine ? 20 : 10,
                                color: Colors.grey[400],
                              );
                            }),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          child: Container(
                            width: 3,
                            height: 30,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFB534),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.transparent,
                            inactiveTrackColor: Colors.transparent,
                            thumbColor: const Color(0xFFFFB534),
                            overlayColor:
                                const Color(0xFFFFB534).withOpacity(0.2),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 8.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 20.0),
                          ),
                          child: Slider(
                            value: height,
                            min: 120,
                            max: 220,
                            onChanged: (double value) {
                              setState(() {
                                height = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Calculate Button
          Positioned(
            left: 0,
            right: 0,
            bottom: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: GestureDetector(
                onTap: _calculateAndNavigate,
                child: Container(
                  height: 90,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF65B741), Color(0xFF65B741)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFFFB534).withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Calculate',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircularButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 18, 212, 15).withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon),
        onPressed: onPressed,
        color: const Color.fromARGB(255, 26, 197, 71),
      ),
    );
  }
}
