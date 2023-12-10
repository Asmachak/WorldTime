import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimerReservation extends StatefulWidget {
  const TimerReservation({super.key});

  @override
  State<TimerReservation> createState() => _TimerReservationState();
}

class _TimerReservationState extends State<TimerReservation> {
  final int duration = 3 * 60 * 60; // 3 hours in seconds

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 20,
                      left: 20),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image(
                          image: AssetImage('assets/images.png'),
                          height: 25,
                          width: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 25
                      ,
                      left: 15),
                  child: Text(
                    "Minutrie",
                    style: TextStyle(
                     // fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                height: 260,
                width: 260,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    height: 240,
                    width: 240,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "IL VOUS RESTE",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              //fontFamily: 'Poppins',
                            ),
                          ),
                          CountdownTimer(
                            endTime: DateTime.now().millisecondsSinceEpoch +
                                duration * 1000,
                            widgetBuilder: (_, CurrentRemainingTime? time) {
                              if (time == null) {
                                // Timer has finished
                                return Text('Countdown Complete');
                              }

                              // Format the remaining time
                              final String hours =
                              '${time.hours}'.padLeft(2, '0');
                              final String minutes =
                              '${time.min}'.padLeft(2, '0');
                              final String seconds =
                              '${time.sec}'.padLeft(2, '0');

                              // Display the remaining time
                              return Text(
                                '$hours:$minutes:$seconds',
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                  height: 52,
                  width: 353),
              child: ElevatedButton(
                onPressed: () async {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child:  Text(
                  'Prolonger la réservation',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                   // fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

