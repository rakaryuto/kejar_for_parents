import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kejar_for_parents/views/details/profil_siswa.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StudentInformation extends StatelessWidget {
  final StudentName;
  final StudentNIS;
  const StudentInformation(
      {Key? key, required this.StudentName, required this.StudentNIS})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
      padding: EdgeInsets.all(16),
      height: 104,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 253, 252, 100),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          //Foto Profil Siswa
          CircleAvatar(
            maxRadius: 32,
            backgroundColor: Colors.grey,
            backgroundImage: AssetImage('assets/images/profil.jpg'),
          ),

          SizedBox(width: 16),

          //Keterangan Siswa
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Nama Siswa
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Siswa",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    "${StudentName}",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  )
                ],
              ),

              //NIS-Detail Button Row
              Row(
                children: [
                  Row(
                    children: [
                      Text("NIS",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      SizedBox(width: 4),
                      Text("${StudentNIS}",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.black)),
                    ],
                  ),
                  SizedBox(width: 88),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProfilSiswa()));
                      },
                      child: Text(
                        "Lihat Profil",
                        style: TextStyle(
                            color: Colors.blue[800],
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
