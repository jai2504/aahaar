import 'package:aahaar/services/databaseMethods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool showform = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue[500],
            Colors.purple[900],
          ],
        ),
      ),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(
                      FirebaseAuth.instance.currentUser.displayName,
                      style:
                          GoogleFonts.asul(textStyle: TextStyle(fontSize: 50)),
                    ),
                  ),
                  CircleAvatar(
                      radius: 50,
                      backgroundImage: FirebaseAuth
                                  .instance.currentUser.photoURL !=
                              null
                          ? NetworkImage(
                              FirebaseAuth.instance.currentUser.photoURL,
                            )
                          : NetworkImage(
                              'https://www.flexnetllc.com/images/easyblog_shared/July_2018/7-4-18/b2ap3_large_totw_network_profile_400.jpg')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height -
                      MediaQuery.of(context).size.height / 1.5),
              height: MediaQuery.of(context).size.height / 1.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.lerp(
                        Radius.circular(5), Radius.circular(150), 0.5)),
                color: Colors.white,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height / 15,
                margin: EdgeInsets.only(top: 35, bottom: 150),
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.blue,
                        ),
                        width: MediaQuery.of(context).size.width / 2,
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(
                            "Edit Profile",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Name",
                          style: GoogleFonts.adamina(
                              textStyle: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          FirebaseAuth.instance.currentUser.displayName,
                          style: GoogleFonts.adamina(
                            textStyle: TextStyle(fontSize: 25),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Email",
                          style: GoogleFonts.adamina(
                              textStyle: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          FirebaseAuth.instance.currentUser.email,
                          style: GoogleFonts.adamina(
                            textStyle: TextStyle(fontSize: 25),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Phone",
                          style: GoogleFonts.adamina(
                              textStyle: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          "9588572192",
                          style: GoogleFonts.adamina(
                            textStyle: TextStyle(fontSize: 25),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
