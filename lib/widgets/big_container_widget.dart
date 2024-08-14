import 'package:flutter/material.dart';

class ContainerAthkar extends StatelessWidget {
  final String athkar;
  final VoidCallback? onTap;

  const ContainerAthkar({super.key, required this.athkar, this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Adjust sizes based on screen width
    final containerWidth = screenWidth * 0.9; // 90% of screen width
    final containerHeight = screenHeight * 0.2; // 20% of screen height

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.06), // 3% of screen width
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: containerHeight,
          width: containerWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23),
            color: const Color(0xFFB299E6),
          ),
          child: Stack(
            children: [
              Transform.translate(
                offset: Offset(containerWidth * 0.65,
                    0), // Adjust offset based on container width
                child: Image.asset(
                  'assets/subha.png',
                  width: containerWidth * 0.3, // 30% of container width
                ),
              ),
              Center(
                child: Text(
                  athkar,
                  style: TextStyle(
                    color: const Color(0XFF3C2560),
                    fontFamily: 'TheYear',
                    fontSize: 45,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
