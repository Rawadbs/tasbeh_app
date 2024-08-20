import 'package:flutter/material.dart';
import 'package:third_day_camp/api/api.dart';
import 'package:third_day_camp/models/athkar.dart';

class MorningAthkar extends StatelessWidget {
  const MorningAthkar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3EEFF),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xffF3EEFF),
        title: const Text(
          'أذكار الصباح',
          style: TextStyle(
            fontSize: 45,
            fontFamily: 'TheYear',
            color: Color(0XFF3C2560),
          ),
        ),
      ),
      body: FutureBuilder<Athkar>(
        future: MorningZekrService().fetchMorningZekr(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('خطأ: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.content.isEmpty) {
            return const Center(child: Text('لا توجد أذكار'));
          } else {
            final athkar = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: athkar.content.length,
              itemBuilder: (context, index) {
                final zekr = athkar.content[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(
                      zekr.zekr,
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
                              'عدد المرات: ${zekr.repeat}',
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
