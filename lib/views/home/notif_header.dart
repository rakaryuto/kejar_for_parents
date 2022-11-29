import 'package:flutter/material.dart';

class NotifHeader extends StatelessWidget {
  const NotifHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
