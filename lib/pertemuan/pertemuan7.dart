import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RadiobuttonPage extends StatefulWidget {
  @override
  _RadiobuttonPageState createState() => _RadiobuttonPageState();
}

class _RadiobuttonPageState extends State<RadiobuttonPage> {
  // Variabel untuk menyimpan nilai radio button yang dipilih
  String? _selectedPeminatan;
  String? _selectedJadwal;

  // Variabel untuk pesan error
  String _peminatanError = '';
  String _jadwalError = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: Text(
          'Form Radio Button',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section 1: Pilihan Peminatan
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Judul Section
                      Row(
                        children: [
                          Container(
                            width: 4,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          SizedBox(width: 12),
                          Text(
                            'Pilih Peminatan',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      // Radio Buttons untuk Peminatan
                      _buildRadioOption(
                        title: 'Software Engineering',
                        value: 'Software Engineering',
                        groupValue: _selectedPeminatan,
                        onChanged: (value) {
                          setState(() {
                            _selectedPeminatan = value;
                            _peminatanError = ''; // Reset error saat dipilih
                          });
                        },
                      ),
                      _buildRadioOption(
                        title: 'Data Science',
                        value: 'Data Science',
                        groupValue: _selectedPeminatan,
                        onChanged: (value) {
                          setState(() {
                            _selectedPeminatan = value;
                            _peminatanError = '';
                          });
                        },
                      ),
                      _buildRadioOption(
                        title: 'Cyber Security',
                        value: 'Cyber Security',
                        groupValue: _selectedPeminatan,
                        onChanged: (value) {
                          setState(() {
                            _selectedPeminatan = value;
                            _peminatanError = '';
                          });
                        },
                      ),
                      // Pesan Error Peminatan
                      if (_peminatanError.isNotEmpty)
                        Padding(
                          padding: EdgeInsets.only(left: 16, top: 8),
                          child: Text(
                            _peminatanError,
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Section 2: Pilihan Jadwal Kuliah
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Judul Section
                      Row(
                        children: [
                          Container(
                            width: 4,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Colors.orange.shade600,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          SizedBox(width: 12),
                          Text(
                            'Jadwal Kuliah',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      // Radio Buttons untuk Jadwal
                      _buildRadioOption(
                        title: 'Reguler A (Pagi)',
                        value: 'Reguler A',
                        groupValue: _selectedJadwal,
                        onChanged: (value) {
                          setState(() {
                            _selectedJadwal = value;
                            _jadwalError = '';
                          });
                        },
                      ),
                      _buildRadioOption(
                        title: 'Reguler B (Malam)',
                        value: 'Reguler B',
                        groupValue: _selectedJadwal,
                        onChanged: (value) {
                          setState(() {
                            _selectedJadwal = value;
                            _jadwalError = '';
                          });
                        },
                      ),
                      _buildRadioOption(
                        title: 'CK (Kelas Kamis)',
                        value: 'CK (Kelas Kamis)',
                        groupValue: _selectedJadwal,
                        onChanged: (value) {
                          setState(() {
                            _selectedJadwal = value;
                            _jadwalError = '';
                          });
                        },
                      ),
                      _buildRadioOption(
                        title: 'CS (Kelas Sabtu)',
                        value: 'CS (Kelas Sabtu)',
                        groupValue: _selectedJadwal,
                        onChanged: (value) {
                          setState(() {
                            _selectedJadwal = value;
                            _jadwalError = '';
                          });
                        },
                      ),
                      // Pesan Error Jadwal
                      if (_jadwalError.isNotEmpty)
                        Padding(
                          padding: EdgeInsets.only(left: 16, top: 8),
                          child: Text(
                            _jadwalError,
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 32),

              // Submit Button
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _validateAndSubmit(context),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Text(
                      'SIMPAN PILIHAN',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget kustom untuk membungkus RadioListTile agar lebih rapi
  Widget _buildRadioOption({
    required String title,
    required String value,
    required String? groupValue,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: groupValue == value ? Colors.blue : Colors.transparent,
          width: 1.5,
        ),
      ),
      child: RadioListTile<String>(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: groupValue == value
                ? FontWeight.bold
                : FontWeight.normal,
            color: groupValue == value
                ? Colors.blue.shade700
                : Colors.grey.shade700,
          ),
        ),
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        activeColor: Colors.blue.shade700,
        contentPadding: EdgeInsets.symmetric(horizontal: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  // Logika validasi dan notifikasi
  void _validateAndSubmit(BuildContext context) {
    setState(() {
      _peminatanError = _selectedPeminatan == null
          ? 'Silakan pilih peminatan'
          : '';
      _jadwalError = _selectedJadwal == null
          ? 'Silakan pilih jadwal kuliah'
          : '';

      if (_peminatanError.isEmpty && _jadwalError.isEmpty) {
        // Jika semua validasi lolos
        Fluttertoast.showToast(
          msg: "Tersimpan: $_selectedPeminatan - $_selectedJadwal",
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green.shade600,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    });
  }
}
