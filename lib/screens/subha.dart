import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:third_day_camp/Bloc/counter_bloc.dart';
import 'package:third_day_camp/Bloc/counter_event.dart';
import 'package:third_day_camp/Bloc/counter_state.dart';

class SubhaScreen extends StatelessWidget {
  const SubhaScreen({super.key});

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
              appBarTitle = '';
            }
            return Text(
              appBarTitle,
              style: const TextStyle(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.50,
                    height: MediaQuery.of(context).size.height / 1.50,
                    decoration: const BoxDecoration(
                      color: Color(0xff764DB5),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: BlocBuilder<CounterBloc, CounterState>(
                          builder: (context, state) {
                            final count =
                                state is CounterUpdated ? state.count : 0;
                            return Text(
                              count.toString(),
                              style: const TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                                color: Color(0XFF3C2560),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Transform.translate(
                    offset: const Offset(0, -85), // Lift the container
                    child: Container(
                      width: 190,
                      height: 190,
                      decoration: const BoxDecoration(
                        color: Color(0xffB299E6),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () => context
                                .read<CounterBloc>()
                                .add(IncrementCounter()),
                            style: ElevatedButton.styleFrom(
                                maximumSize: const Size(80, 80)),
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.green, shape: BoxShape.circle),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () => context
                                    .read<CounterBloc>()
                                    .add(ResetCounter()),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.red,
                                ),
                                child: const Icon(Icons.wifi_protected_setup),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
