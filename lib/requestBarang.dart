import 'package:flutter/material.dart';


class requestBarang extends StatelessWidget {
  const requestBarang({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final myAppbar = AppBar(
      automaticallyImplyLeading: false,
      
      title: Text("REQUEST",),
      backgroundColor: Colors.black,
    );

    final bodyHeight = mediaQueryHeight - myAppbar.preferredSize.height - MediaQuery.of(context).padding.top;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: myAppbar,
      body: SingleChildScrollView(
        child: Column(
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
                          "Request Barang",
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
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: ((context, index) {
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
                          title: Text(
                            "Indomie Goreng Original satu dus",
                            style: TextStyle(color: Color(0xff00817f),fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "05 April 2021",
                            style: TextStyle(color: Colors.grey,fontSize: 12),
                          ),
                          
                          
                        ),
                      ),
                    );
                })),
              ),
            )
          ],
        ),
      )
    );
  }
}
