import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool status = true;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: Column(
            children: [
              AppBar(
                title: Text("Profile"),
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
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                        width: 37,
                        height: 37,
                        // margin: EdgeInsets.only(top: 12.5, bottom: 12.5, right: 20),
                        child: InkWell(
                            //borderRadius: BorderRadius.circular(300),
                            onTap: () {},
                            child: CircleAvatar(
                              child: Icon(Icons.edit, color: Colors.white),
                              backgroundColor: Colors.white.withOpacity(0.3),
                            ))),
                  )
                ],
                toolbarHeight: 80,
              ),
              Stack(
                children: [
                  Container(
                    height: 200,
                    color: Colors.orange,
                  ),
                  Container(
                    height: 200,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 100),
                        Container(
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40))))
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 200,
                    child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: Colors.white, width: 2.0)),
                        child: CircleAvatar(
                          radius: 50,

                          //child: Image.asset('lib/assets/sampleImage.png'),
                          backgroundImage:
                              AssetImage('lib/assets/sampleImage.png'),
                          //backgroundColor: Colors.transparent,
                        )),
                  ),
                ],
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Name"),
                                SizedBox(height: 10),
                                Container(
                                  alignment: Alignment.center,
                                  width: screenWidth * 0.4,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade200,
                                  ),
                                  child: Text(
                                    "Paul",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Phone Number"),
                                SizedBox(height: 10),
                                Container(
                                  alignment: Alignment.center,
                                  width: screenWidth * 0.4,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade200,
                                  ),
                                  child: Text(
                                    "+919876543210",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ]),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 0, left: 20, right: 20, bottom: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Location"),
                                SizedBox(height: 10),
                                Container(
                                  alignment: Alignment.center,
                                  width: screenWidth * 0.4,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade200,
                                  ),
                                  child: Text(
                                    "New York City",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 0, left: 20, right: 20, bottom: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Interest"),
                                SizedBox(height: 10),
                                Container(
                                  alignment: Alignment.center,
                                  width: screenWidth * 0.4,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade200,
                                  ),
                                  child: Text(
                                    "Football",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ]),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Notifications",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    FlutterSwitch(
                      value: status,
                      onToggle: (val) {
                        setState(() {
                          status = val;
                        });
                      },
                      width: 110.0,
                      height: 40.0,
                      valueFontSize: 16.0,
                      toggleSize: 45.0,
                      toggleColor: Colors.orange.shade900,
                      // value: true,
                      borderRadius: 10.0,
                      padding: 8.0,
                      showOnOff: true,
                      activeColor: Colors.orange,
                      activeTextColor: Colors.white,
                      inactiveTextColor: Colors.white,
                      inactiveText: "OFF",
                      inactiveTextFontWeight: FontWeight.normal,
                      activeText: "ON",
                      activeTextFontWeight: FontWeight.normal,
                      inactiveToggleColor: Colors.white,
                      //inactiveToggleBorder: BoxBorder(),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
