import 'package:flutter/material.dart';
import 'input_page.dart';

class GenderPage extends StatefulWidget {
  const GenderPage({super.key});

  @override
  State<GenderPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
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
              'Please choose your gender',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
          ),
          // Male Card
          Positioned(
            left: 20,
            right: 20,
            top: 220,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedGender = 'male';
                });
              },
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: selectedGender == 'male'
                      ? const Color(0xFF65B741).withOpacity(0.2)
                      : const Color(0xFFF0F8EC),
                  borderRadius: BorderRadius.circular(24),
                  border: selectedGender == 'male'
                      ? Border.all(color: const Color(0xFF65B741), width: 2)
                      : null,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 12,
                      offset: Offset(0, 4),
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(width: 50),
                    Text(
                      'Male',
                      style: TextStyle(
                        color: Color(0xFF65B741),
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 120,
                      height: 120,
                      margin: EdgeInsets.only(right: 40),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Image.asset(
                              'assets/images/male_icon.png',
                              width: 80,
                              height: 80,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Color(0xFF65B741),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF65B741).withOpacity(0.3),
                                    blurRadius: 6,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.male,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Female Card
          Positioned(
            left: 20,
            right: 20,
            top: 440,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedGender = 'female';
                });
              },
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: selectedGender == 'female'
                      ? const Color(0xFFFFB534).withOpacity(0.2)
                      : const Color(0xFFFBF6EE),
                  borderRadius: BorderRadius.circular(24),
                  border: selectedGender == 'female'
                      ? Border.all(color: const Color(0xFFFFB534), width: 2)
                      : null,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 12,
                      offset: Offset(0, 4),
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(width: 50),
                    Text(
                      'Female',
                      style: TextStyle(
                        color: Color(0xFFCE922A),
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 120,
                      height: 120,
                      margin: EdgeInsets.only(right: 40),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Image.asset(
                              'assets/images/female_icon.png',
                              width: 80,
                              height: 80,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Color(0xFFFF6757),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFFF6757).withOpacity(0.3),
                                    blurRadius: 6,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.female,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Continue Button
          Positioned(
            left: 20,
            right: 20,
            top: 720,
            child: Container(
              width: 350,
              height: 90,
              child: ElevatedButton(
                onPressed: selectedGender == null
                    ? null
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                InputPage(gender: selectedGender!),
                          ),
                        );
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF65B741),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                  disabledBackgroundColor: Colors.grey,
                ),
                child: Text(
                  'Continue',
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
    );
  }
}
