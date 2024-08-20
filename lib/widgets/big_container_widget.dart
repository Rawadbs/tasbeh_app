import 'package:flutter/material.dart';

class ContainerAthkar extends StatelessWidget {
  final String athkar;
  final Color color1;
  final VoidCallback? onTap;
  final String imageAssetPath;

  const ContainerAthkar({
    super.key,
    required this.athkar,
    required this.color1,
    this.onTap,
    required this.imageAssetPath,
  });

  @override
  Widget build(BuildContext context) {
    // Adjust sizes based on screen width
    final containerWidth = 163.0; // Width similar to SmallContainer
    final containerHeight = 160.0; // Height similar to SmallContainer

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10), // Adjust vertical spacing
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: containerHeight,
          width: containerWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23),
            color: color1,
          ),
          child: Stack(
            children: [
              Positioned(
                right: 5,
                top: 5,
                child: Image.asset(
                  imageAssetPath,
                  width: 55, // Width similar to SmallContainer
                ),
              ),
              Center(
                child: Text(
                  athkar,
                  style: TextStyle(
                    color: const Color(0XFF3C2560),
                    fontSize: 28, // Font size similar to SmallContainer
                    fontWeight: FontWeight.bold,
                    fontFamily: 'TheYear',
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
