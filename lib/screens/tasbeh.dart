import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:third_day_camp/Bloc/counter_bloc.dart';
import 'package:third_day_camp/Bloc/counter_event.dart';
import 'package:third_day_camp/Bloc/counter_state.dart';
import 'package:third_day_camp/widgets/shape.dart';

class TaasbehScreen extends StatelessWidget {
  const TaasbehScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3EEFF),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xffF3EEFF),
        title: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            String appBarTitle;
            if (state is CounterUpdated) {
              final count = state.count;
              if (count >= 0 && count <= 33) {
                appBarTitle = 'سبحان الله';
              } else if (count >= 34 && count <= 66) {
                appBarTitle = 'الحمد لله';
              } else if (count >= 67 && count <= 99) {
                appBarTitle = 'الله أكبر';
              } else {
                appBarTitle = '';
              }
            } else {
              appBarTitle = 'السبحة الالكترونية';
            }
            return Text(
              appBarTitle,
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                fontFamily: 'TheYear',
                color: Color(0XFF3C2560),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 170),
              CustomPaint(
                painter: RPPSCustomPainter(),
              ),
              Transform.translate(
                offset: Offset(0, -285),
                child: Container(
                  width: 180, // زيادة العرض لضمان عرض الأرقام الأكبر
                  height: 80, // ارتفاع ثابت
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Color(0xff3C2560),
                      width: 3,
                    ),
                    color: Color(0xffd9d9d9),
                  ),
                  child: Center(
                    child: BlocBuilder<CounterBloc, CounterState>(
                      builder: (context, state) {
                        final count = state is CounterUpdated ? state.count : 0;
                        return Text(
                          count.toString(),
                          style: const TextStyle(
                            fontSize:
                                40, // تقليل حجم الخط قليلاً لعرض الأرقام الكبيرة
                            fontWeight: FontWeight.bold,
                            color: Color(0XFF3C2560),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(0, -210),
                child: ElevatedButton(
                  onPressed: () =>
                      context.read<CounterBloc>().add(IncrementCounter()),
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size(100, 100),
                      backgroundColor: Color(0xffd9d9d9),
                      side: BorderSide(
                        color: Color(0xff3C2560),
                        width: 3,
                      )),
                  child: Container(),
                ),
              ),
              Transform.translate(
                offset: Offset(60, -380),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => context.read<CounterBloc>().add(
                            ResetCounter(),
                          ),
                      child: Container(
                        width: 60,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffd9d9d9),
                          border: Border.all(
                            color: Color(0xff3C2560),
                            width: 3,
                          ),
                        ),
                        child: const Icon(
                          Icons.wifi_protected_setup,
                          color: Color(0xff3C2560),
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
    );
  }
}
