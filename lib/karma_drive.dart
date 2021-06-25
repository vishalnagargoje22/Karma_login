import 'package:flutter/material.dart';
import 'package:flutter_login/tileWidget.dart';
import 'package:flutter_login/Profile.dart';

class karmaDrive extends StatefulWidget {
  const karmaDrive({Key? key}) : super(key: key);

  @override
  _karmaDriveState createState() => _karmaDriveState();
}

class _karmaDriveState extends State<karmaDrive> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            child: Column(
              children: [
                AppBar(
                  title: Text("Karma Drive"),
                  backgroundColor: Colors.orange,
                  elevation: 0,
                  //leading: Icon(Icons.arrow_back_ios_new),
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                        width: 30,
                        height: 30,
                        // margin: EdgeInsets.only(top: 12.5, bottom: 12.5, right: 20),
                        child: InkWell(
                            borderRadius: BorderRadius.circular(300),
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: CircleAvatar(
                              child: Icon(Icons.arrow_back_ios_new,
                                  color: Colors.white),
                              backgroundColor: Colors.white.withOpacity(0.3),
                            ))),
                  ),
                  actions: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Container(
                          alignment: Alignment.center,
                          // height: 20,

                          // margin: EdgeInsets.only(top: 12.5, bottom: 12.5, right: 20),
                          child: InkWell(
                            //borderRadius: BorderRadius.circular(300),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Profile()));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: Colors.white),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 20, left: 20),
                                child: Text("MY DRIVES",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          )),
                    )
                  ],
                  toolbarHeight: 80,
                ),
                Stack(
                  children: [
                    Container(
                      height: 120,
                      color: Colors.orange,
                    ),
                    Column(
                      children: [
                        Center(
                          child: Container(
                            alignment: Alignment.center,
                            width: screenWidth * 0.85,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: screenWidth * 0.5,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Search here...",
                                      contentPadding: EdgeInsets.all(20),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 6),
                                  child: Container(
                                      width: 50,
                                      height: 50,
                                      // margin: EdgeInsets.only(top: 12.5, bottom: 12.5, right: 20),
                                      child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(300),
                                          onTap: () {},
                                          child: CircleAvatar(
                                            child: Icon(Icons.search,
                                                color: Colors.white,
                                                size: 35.0),
                                            backgroundColor: Colors.black,
                                          ))),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          height:
                              MediaQuery.of(context).size.height * 0.715 + 30,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: ListView(
                              children: [
                                tileWidget(),
                                tileWidget(),
                                tileWidget(),
                                tileWidget(),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
