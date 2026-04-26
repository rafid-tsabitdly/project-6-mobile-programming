import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AutocompletespinPage extends StatefulWidget {
  @override
  _AutocompletespinPageState createState() => _AutocompletespinPageState();
}

class _AutocompletespinPageState extends State<AutocompletespinPage> {
  final List<String> _prodiOptions = [
    'Sistem Informasi',
    'Teknik Informatika',
    'Ilmu Komputer',
    'Manajemen Informatika',
    'Sistem Komputer',
    'Data Science',
    'Keamanan Siber',
  ];

  // Data untuk Spinner / Dropdown
  final List<String> _semesterOptions = [
    'Semester 1',
    'Semester 2',
    'Semester 3',
    'Semester 4',
    'Semester 5',
    'Semester 6',
    'Semester 7',
    'Semester 8',
  ];

  String _selectedProdi = '';
  String? _selectedSemester;

  String _prodiError = '';
  String _semesterError = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: Text(
          'Autocomplete & Dropdown',
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
              // Section 1: Autocomplete
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
                            'Cari Program Studi',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      // Widget Autocomplete
                      Autocomplete<String>(
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          if (textEditingValue.text == '') {
                            return const Iterable<String>.empty();
                          }
                          return _prodiOptions.where((String option) {
                            return option.toLowerCase().contains(
                              textEditingValue.text.toLowerCase(),
                            );
                          });
                        },
                        onSelected: (String selection) {
                          setState(() {
                            _selectedProdi = selection;
                            _prodiError = '';
                          });
                        },
                        // Kustomisasi tampilan text field Autocomplete
                        fieldViewBuilder:
                            (
                              context,
                              textEditingController,
                              focusNode,
                              onFieldSubmitted,
                            ) {
                              return TextField(
                                controller: textEditingController,
                                focusNode: focusNode,
                                decoration: InputDecoration(
                                  hintText: 'Ketik "Sistem" atau "Teknik"...',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey.shade50,
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.blue.shade600,
                                  ),
                                  errorText: _prodiError.isNotEmpty
                                      ? _prodiError
                                      : null,
                                ),
                                onChanged: (value) {
                                  _selectedProdi = value;
                                },
                              );
                            },
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Section 2: Spinner / Dropdown
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
                            'Pilih Semester',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      // Widget Dropdown
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade50,
                        ),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(
                              Icons.school,
                              color: Colors.orange.shade600,
                            ),
                            errorText: _semesterError.isNotEmpty
                                ? _semesterError
                                : null,
                          ),
                          hint: Text('Pilih semester saat ini'),
                          value: _selectedSemester,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.orange.shade600,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 16,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedSemester = newValue;
                              _semesterError = '';
                            });
                          },
                          items: _semesterOptions.map<DropdownMenuItem<String>>(
                            (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            },
                          ).toList(),
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
                      'KONFIRMASI DATA',
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

  void _validateAndSubmit(BuildContext context) {
    setState(() {
      // Validasi sederhana
      _prodiError = _selectedProdi.isEmpty
          ? 'Program studi tidak boleh kosong'
          : '';

      // Memastikan prodi yang diketik valid (ada di dalam list)
      if (_selectedProdi.isNotEmpty &&
          !_prodiOptions.contains(_selectedProdi)) {
        _prodiError = 'Pilih program studi dari daftar yang tersedia';
      }

      _semesterError = _selectedSemester == null
          ? 'Silakan pilih semester'
          : '';

      // Jika lolos validasi
      if (_prodiError.isEmpty && _semesterError.isEmpty) {
        Fluttertoast.showToast(
          msg: "Data Disimpan:\n$_selectedProdi - $_selectedSemester",
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.blue.shade800,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    });
  }
}
