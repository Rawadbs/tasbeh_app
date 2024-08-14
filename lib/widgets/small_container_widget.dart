import 'package:flutter/material.dart';

class SmallContainer extends StatelessWidget {
  final String text;
  final Color color1;

  final VoidCallback? onTap;
  final String imageAssetPath; // خاصية جديدة لمسار الصورة

  const SmallContainer({
    super.key,
    required this.text,
    required this.color1,
    this.onTap,
    required this.imageAssetPath, // إضافة مسار الصورة كخاصية جديدة
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 163,
        height: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23), color: color1),
        child: Stack(
          children: [
            // إضافة الصورة من الأصول
            Positioned(
              right: 5,
              top: 5,
              child: Image.asset(
                imageAssetPath,
                width: 60,
              ),
            ),
            Center(
              child: Text(
                text,
                style: const TextStyle(
                  color: Color(0XFF3C2560),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'TheYear',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
