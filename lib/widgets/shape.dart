import 'dart:ui' as ui;
import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class RPPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(4.01877, 120.28);
    path_0.cubicTo(3.8188, 105.096, 5.64175, 90.0823, 8.38547, 75.1716);
    path_0.cubicTo(10.2456, 65.0758, 13.2358, 55.316, 18.8395, 46.4519);
    path_0.cubicTo(25.8616, 35.3484, 35.9948, 27.6399, 47.7091, 21.5843);
    path_0.cubicTo(59.9349, 15.2822, 72.9746, 11.2556, 86.4932, 8.42035);
    path_0.cubicTo(102.997, 4.95805, 119.692, 3.66808, 136.517, 4.0712);
    path_0.cubicTo(159.411, 4.62212, 181.766, 8.10234, 203.087, 16.5185);
    path_0.cubicTo(213.518, 20.6392, 223.284, 25.8797, 231.72, 33.2029);
    path_0.cubicTo(242.183, 42.3043, 248.461, 53.8065, 251.619, 66.854);
    path_0.cubicTo(257.051, 89.1616, 259.031, 112.12, 257.497, 134.985);
    path_0.cubicTo(256.519, 149.49, 253.978, 163.858, 249.917, 177.858);
    path_0.cubicTo(246.443, 189.822, 242.225, 201.597, 238.858, 213.579);
    path_0.cubicTo(237.342, 218.994, 236.9, 224.718, 236.328, 230.335);
    path_0.cubicTo(235.445, 239.002, 235.305, 247.758, 234.068, 256.371);
    path_0.cubicTo(231.673, 272.993, 223.489, 286.829, 210.928, 298.38);
    path_0.cubicTo(200.811, 307.674, 188.5, 314.46, 175.055, 318.151);
    path_0.cubicTo(167.005, 320.39, 158.779, 322.41, 150.524, 323.638);
    path_0.cubicTo(139.797, 325.161, 128.915, 325.408, 118.125, 324.372);
    path_0.cubicTo(105.206, 323.217, 92.6317, 320.708, 80.5314, 316.162);
    path_0.cubicTo(63.5901, 309.789, 49.625, 299.702, 39.3244, 285.145);
    path_0.cubicTo(33.8044, 277.369, 29.9214, 268.819, 28.5728, 259.453);
    path_0.cubicTo(27.2893, 250.544, 26.2476, 241.564, 25.8476, 232.579);
    path_0.cubicTo(25.4322, 223.055, 23.5209, 213.647, 20.1788, 204.674);
    path_0.cubicTo(15.4447, 191.819, 11.8593, 178.651, 8.95747, 165.29);
    path_0.cubicTo(5.73011, 150.433, 3.78625, 135.473, 4.01877, 120.28);
    path_0.close();

    Paint paint_0_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.02671756;
    paint_0_stroke.color = Color(0xff3C2560).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_stroke);

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.5000000, size.height * 0.01215805),
        Offset(size.width * 0.5000000, size.height * 0.9878419),
        [Color(0xffB299E6).withOpacity(1), Color(0xffC6B4EF).withOpacity(1)],
        [0, 1]);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
