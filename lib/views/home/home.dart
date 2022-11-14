import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kejar_for_parents/views/details/profil_siswa.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(8, 24, 8, 0),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            //Header nama & settings
            Container(
              margin: EdgeInsets.fromLTRB(8, 16, 8, 0),
              height: 48,
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Orang Tua/Wali",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.black26),
                      ),
                      SizedBox(height: 4),
                      Text("Sujiwo Tejo Kasmingoen",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.black87))
                    ],
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.settings))
                ],
              ),
            ),

            SizedBox(height: 16),

            //Kartu detail informasi anak
            Container(
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
                  Container(
                    height: 64,
                    width: 64,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(100)),
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
                            "David Guetta",
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
                              Text("11806458",
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
            ),
            SizedBox(height: 24),

            //Header notifikasi
            Container(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Notifikasi",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),

                  //Filter Button untuk memfilter notifikasi
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.filter_list,
                        size: 24,
                      )),
                ],
              ),
            )

            //Tabbar konten notifikasi
          ],
        ),
      ),
    );
  }
}
