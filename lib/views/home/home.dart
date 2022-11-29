import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:kejar_for_parents/database/DatabaseManager.dart';
import 'package:kejar_for_parents/database/get_hari.dart';
import 'package:kejar_for_parents/database/get_keterangan.dart';
import 'package:kejar_for_parents/database/get_suptipe.dart';
import 'package:kejar_for_parents/database/get_tipe.dart';
import 'package:kejar_for_parents/database/get_waktu.dart';
import 'package:kejar_for_parents/main.dart';
import 'package:kejar_for_parents/views/home/header.dart';
import 'package:kejar_for_parents/views/home/notif_header.dart';
import 'package:kejar_for_parents/views/home/student_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

final User? user = FirebaseAuth.instance.currentUser;
final db = FirebaseFirestore.instance;

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List notifProfilesList = [];
  String? username;
  String? studentName;
  int? studentNIS;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              color: Colors.blue,
              playSound: true,
            )));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageopenedApp event was published');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title!),
              );
            });
      }
    });
    // fetchDatabaseList();
  }

  Future fetchDatabaseList() async {
    await db
        .collection('notifications')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              notifProfilesList.add(document.reference.id);
            }));
  }

  Future fetchUsername() async {
    DocumentSnapshot snapshot =
        await db.collection('users').doc('${user?.uid}').get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    username = data['name'];
  }

  Future fetchStudent() async {
    await db
        .collection('students')
        .where('parent', isEqualTo: "${user?.uid}")
        .snapshots()
        .listen((data) {
      studentName = data.docs[0]['name'];
      studentNIS = data.docs[0]['NIS'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
        decoration: BoxDecoration(color: Colors.white),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            //Header nama & settings
            FutureBuilder(
                future: fetchUsername(),
                builder: (context, snapshot) {
                  return Header(name: '${username}');
                }),

            SizedBox(height: 16),

            //Kartu detail informasi anak
            FutureBuilder(builder: (conext, snapshot) {
              return StudentInformation(
                  StudentName: 'David Guetta', StudentNIS: '11806458');
            }),

            SizedBox(height: 24),

            //Header notifikasi
            NotifHeader(),

            //Tabbar konten notifikasi
            Container(
              height: 48,
              child: TabBar(
                  indicatorColor: Color.fromRGBO(43, 103, 246, 100),
                  indicatorWeight: 3,
                  labelColor: Color.fromRGBO(43, 103, 246, 100),
                  unselectedLabelColor: Colors.black,
                  controller: _tabController,
                  tabs: [
                    TabBarTitle(title: "Semua"),
                    TabBarTitle(title: "Absensi"),
                    TabBarTitle(title: "Penilaian"),
                  ]),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.9,
              width: MediaQuery.of(context).size.width,
              child: TabBarView(controller: _tabController, children: [
                Container(
                    child: FutureBuilder(
                  future: fetchDatabaseList(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                        itemCount: notifProfilesList.length,
                        itemBuilder: (context, index) {
                          return ActivityContainer(
                            tipe: GetTipe(docId: "${notifProfilesList[index]}"),
                            subtipe: GetSubtipe(
                                docId: "${notifProfilesList[index]}"),
                            tanggal: GetTanggal(
                                docId: "${notifProfilesList[index]}"),
                            waktu:
                                GetWaktu(docId: "${notifProfilesList[index]}"),
                            ket: GetKeterangan(
                                docId: "${notifProfilesList[index]}"),
                          );
                        });
                  },
                )),
                Container(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [],
                  ),
                ),
                Container(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class ActivityContainer extends StatelessWidget {
  final Widget tipe;
  final Widget subtipe;
  final Widget tanggal;
  final Widget waktu;
  final Widget ket;

  const ActivityContainer(
      {Key? key,
      required this.tipe,
      required this.subtipe,
      required this.tanggal,
      required this.waktu,
      required this.ket})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
      padding: EdgeInsets.all(16),
      height: 150,
      decoration: BoxDecoration(
          color: Colors.grey[100],
          border: Border.all(color: Color.fromRGBO(229, 231, 242, 100))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [tipe, subtipe],
              ),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.navigate_next, size: 24))
            ],
          ),
          Row(
            children: [tanggal, SizedBox(width: 8), waktu],
          ),
          SizedBox(height: 8),
          Text("Keterangan :",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                  fontWeight: FontWeight.w600)),
          SizedBox(height: 4),
          ket
        ],
      ),
    );
  }
}

class TabBarTitle extends StatelessWidget {
  final String? title;
  const TabBarTitle({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Text("${title}",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600));
  }
}
