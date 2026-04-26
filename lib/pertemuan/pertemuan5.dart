import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListviewPage extends StatefulWidget {
  @override
  _ListviewPageState createState() => _ListviewPageState();
}

class _ListviewPageState extends State<ListviewPage> {
  // Data list yang akan ditampilkan
  final List<Map<String, dynamic>> _courseData = [
    {
      "title": "Arsitektur & Infrastruktur IT",
      "subtitle": "Ruang A.101 - 3 SKS",
      "icon": Icons.architecture,
      "color": Colors.blue,
    },
    {
      "title": "Komunikasi Data",
      "subtitle": "Ruang B.203 - 3 SKS",
      "icon": Icons.router,
      "color": Colors.green,
    },
    {
      "title": "Mobile Programming",
      "subtitle": "Lab Komputer 1 - 4 SKS",
      "icon": Icons.phone_android,
      "color": Colors.orange,
    },
    {
      "title": "Aljabar Linear",
      "subtitle": "Ruang C.105 - 2 SKS",
      "icon": Icons.calculate,
      "color": Colors.red,
    },
    {
      "title": "Analisis Proses Bisnis",
      "subtitle": "Ruang A.202 - 3 SKS",
      "icon": Icons.business_center,
      "color": Colors.purple,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: Text(
          'Daftar Mata Kuliah',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        // Menggunakan ListView.builder untuk menampilkan data dinamis
        child: ListView.builder(
          itemCount: _courseData.length,
          itemBuilder: (context, index) {
            final item = _courseData[index];
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  // Menampilkan toast saat item diklik
                  Fluttertoast.showToast(
                    msg: "Memilih: ${item['title']}",
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.black87,
                    textColor: Colors.white,
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      // Icon Container
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: item['color'].withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          item['icon'],
                          size: 32,
                          color: item['color'],
                        ),
                      ),
                      SizedBox(width: 16),
                      // Text Content
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['title'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade800,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              item['subtitle'],
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Arrow Icon
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey.shade400,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
