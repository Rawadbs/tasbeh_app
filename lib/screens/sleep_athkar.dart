import 'package:flutter/material.dart';
import 'package:third_day_camp/api/api.dart';
import 'package:third_day_camp/models/sleepatkar_model.dart';

class SleepAthkarPage extends StatelessWidget {
  const SleepAthkarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3EEFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffF3EEFF),
        centerTitle: true,
        title: const Text(
          'أذكار النوم',
          style: TextStyle(
            fontSize: 45,
            color: Color(0XFF3C2560),
            fontFamily: 'TheYear',
          ),
        ),
      ),
      body: FutureBuilder<SleepAthkar>(
        future: SleepAthkarService().fetchSleepAthkar(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('خطأ: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.array.isEmpty) {
            return const Center(child: Text('لا توجد أذكار'));
          } else {
            final athkar = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: athkar.array.length,
              itemBuilder: (context, index) {
                final zekr = athkar.array[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(
                      zekr.text,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'TheYear',
                        color: Color(0XFF3C2560),
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'عدد المرات: ${zekr.count}',
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 116, 72, 187),
                                fontFamily: 'TheYear',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
