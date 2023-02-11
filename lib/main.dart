import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyCalendar(),
    );
  }
}

class MyCalendar extends StatefulWidget {
  const MyCalendar({Key? key}) : super(key: key);

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  var months = [
    Month(

      nameEn: '1',

    ),
    Month(

      nameEn: '2',

    ),
    Month(

      nameEn: '3',

    ),
    Month(

      nameEn: '4',

    ),
    Month(

      nameEn: '5',

    ),
    Month(

      nameEn: '6',

    ),
    Month(

      nameEn: '7',

    ),
    Month(

      nameEn: '8',

    ),
    Month(

      nameEn: '9',

    ),
    Month(

      nameEn: '0',

    ),




  ];


  late Month _selectedMonth;

  @override
  void initState() {
    super.initState();
    _selectedMonth = months[0];
  }

  @override
  Widget build(BuildContext context) {
    var monthNameList = [
      [months[0], months[1], months[2]],
      [months[3], months[4], months[5]],
      [months[6], months[7], months[8]],
      [months[9],],// months[10], months[11]],
    ];

    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // paradigm
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.lock_outline_rounded, size: 80.0, color: Colors.black,),
            Text('กรุณาใส่รหัสผ่าน'),


            // ปุ่ม 12 ปุ่ม เลือกเดือน
            for (var i = 0; i < monthNameList.length; i++)
              _buildMonthRow(monthNameList[i]),

            // spacing
            TextButton(onPressed:
            (){

            }, child: Text("ลืมรหัสผ่าน"))

            //const SizedBox(height:100.0),


            // ตารางปฏิทิน

          ],
        ),
      ),
    );
  }

  Widget _buildMonthRow(List<Month> monthList) {
    return Row(
      children: monthList.map((item) {
        return _buildMonthButton(item);
      }).toList(),
    );
  }
  Expanded _buildMonthButton(Month month) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: OutlinedButton(
          onPressed: () {
            debugPrint(month.toString());
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.purple, width: 4.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // สีเงา
                    offset: Offset(2, 4), // ทิศทางของเงาในแนวนอนและแนวตั้ง ตามลำดับ
                    blurRadius: 4.0,
                    spreadRadius: 2.0,
                  )
                ]
            );

            setState(() {
              _selectedMonth = month;
            });
          },
          child: Text(month.nameEn),
        ),
      ),
    );
  }

}

class Month {
  final String nameEn;
  Month({
    required this.nameEn,
  });
  @override
  String toString() {
    return '$nameEn';
  }
}
