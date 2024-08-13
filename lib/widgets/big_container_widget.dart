import 'package:flutter/material.dart';

class ContainerAthkar extends StatelessWidget {
  final String athkar;
  final VoidCallback? onTap;
  const ContainerAthkar({super.key, required this.athkar, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: 170,
          width: 345,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23),
            color: const Color(0xFFB299E6),
          ),
          child: Stack(
            children: [
              Transform.translate(
                offset: const Offset(238, 0),
                child: Image.asset(
                  'assets/subha.png',
                  width: 100,
                ),
              ),
              Center(
                child: Text(
                  athkar,
                  style: const TextStyle(
                    color: Color(0XFF3C2560),
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
