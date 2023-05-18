// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_kantin/apiService.dart';
import 'package:my_kantin/models/hutang.dart';


class Transaksi extends StatefulWidget {
  const Transaksi({Key? key}) : super(key: key);

  @override
  State<Transaksi> createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  late Future hutang;
  @override
  void initState() {
  hutang =  ApiService.getHutang();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final myAppbar = AppBar(
      automaticallyImplyLeading: false,
      
      title: Text("PENGHUTANG",),
      backgroundColor: Colors.black,
    );

    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
      final bodyHeight = mediaQueryHeight - myAppbar.preferredSize.height - MediaQuery.of(context).padding.top;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: myAppbar,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            width: width * 0.95,
            decoration: BoxDecoration(
              color: Color(0xffF0EEEE).withOpacity(0.9),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5))
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:15),
                    child: Container(
                      child: Text(
                        "Penghutang",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Divider(
                      color: Color(0xffEF5227),
                      thickness: 1,                            
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              height: 497,
              width: width * 0.95,
              decoration: BoxDecoration(
                color: Color(0xffF0EEEE).withOpacity(0.9),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5))
              ),
              child: FutureBuilder(future: hutang,builder: (context,AsyncSnapshot snapshot){
                if(snapshot.connectionState !=ConnectionState.done)
                return CircularProgressIndicator();
                 if(snapshot.hasError)
                return Text("error");
                 if(snapshot.hasData)
                return _list(snapshot.data, width);
                return Text("error");
              },)
            ),
          )
        ],
      )
    );
  }
}

Widget _list(Hutang data,width){
  return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: data.data.length,
                itemBuilder: ((context, i) {
                  return Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 5,bottom: 8),
                      height: 70,
                      width: width * 0.88,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 2,
                          )
                        ],
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xffFFFFFF),
                      ),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text(
                              "Nama:",
                              style: TextStyle(color: Color(0xff00817f),fontWeight: FontWeight.bold),
                            ),
                            Text(data.data[i].namaPenghutang)
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                "Jumlah",
                                style: TextStyle(color: Colors.grey,fontSize: 12),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5,left: 5),
                              child: Text("20.000"),
                            )
                          ],
                        ),
                        
                      ),
                    ),
                  );
              }));
}