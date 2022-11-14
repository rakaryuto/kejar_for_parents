import 'package:flutter/material.dart';

class LabelInfo extends StatelessWidget {
  final String? label;
  final String? value;
  const LabelInfo({Key? key, this.label, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${label}",
          textAlign: TextAlign.start,
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        //Nama Siswa
        Text("${value}",
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w400)),
      ],
    );
  }
}
