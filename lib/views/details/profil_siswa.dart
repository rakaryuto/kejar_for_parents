import 'package:flutter/material.dart';
import 'label_widget.dart';

class ProfilSiswa extends StatelessWidget {
  const ProfilSiswa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text("Profil Siswa",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
        decoration: BoxDecoration(color: Colors.white),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: 72,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Foto profile
                  Container(
                    height: 72,
                    width: 72,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(100)),
                  ),

                  //Nama
                  Container(
                    margin: EdgeInsets.fromLTRB(16, 8, 0, 8),
                    child:
                        //Label Nama
                        LabelInfo(label: "Siswa", value: "David Guetta"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Container(
                margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelInfo(
                      label: "Jenis Kelamin",
                      value: "Laki-laki",
                    ),
                    SizedBox(height: 16),
                    LabelInfo(
                      label: "NIS",
                      value: "11806458",
                    ),
                    SizedBox(height: 16),
                    LabelInfo(
                      label: "Agama",
                      value: "Islam",
                    ),
                    SizedBox(height: 16),
                    LabelInfo(
                      label: "Email",
                      value: "loremipsum@gmail.com",
                    ),
                    SizedBox(height: 16),
                    LabelInfo(
                      label: "No. HP",
                      value: "081232337811",
                    ),
                    SizedBox(height: 16),
                    LabelInfo(
                      label: "Wali Kelas",
                      value: "Agung Prasetyo",
                    ),
                    SizedBox(height: 24),
                    Text("Informasi Rombel",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ],
                )),
            SizedBox(height: 8),
            Container(
              child: Table(
                border: TableBorder.all(
                    color: Color.fromARGB(255, 229, 231, 242), width: 2),
                columnWidths: const <int, TableColumnWidth>{
                  0: FixedColumnWidth(163.5),
                  1: FixedColumnWidth(163.5)
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: <TableRow>[
                  TableRow(children: [
                    TableHeader(label: "Tahun"),
                    TableHeader(label: "Rombel"),
                  ]),
                  TableRow(children: [
                    TableContent(label: "2018/2019"),
                    TableContent(label: "OTKP X-1")
                  ]),
                  TableRow(children: [
                    TableContent(label: "2019/2020"),
                    TableContent(label: "OTKP XI-3")
                  ]),
                  TableRow(children: [
                    TableContent(label: "2020/2021"),
                    TableContent(label: "OTKP XII-2")
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TableContent extends StatelessWidget {
  final String? label;
  const TableContent({Key? key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 40,
      alignment: Alignment.centerLeft,
      child: Text(
        "${label}",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
      ),
    );
  }
}

class TableHeader extends StatelessWidget {
  final String? label;
  const TableHeader({Key? key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromARGB(255, 239, 240, 249)),
      padding: EdgeInsets.all(8),
      height: 40,
      alignment: Alignment.centerLeft,
      child: Text(
        "${label}",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}
