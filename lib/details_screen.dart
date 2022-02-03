import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DetailScreen extends StatefulWidget {
  String dname, demail, dphone, dcity, dzip;

  DetailScreen({
    required this.dname,
    required this.demail,
    required this.dphone,
    required this.dcity,
    required this.dzip,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            OneClassCard(),
            SizedBox(height: 50),
            buildCenterDetails(),
            SizedBox(height: 50),
            ManyClassCard(),
          ],
        ),
      ),
    );
  }

  // many card class......................................................................

  Padding ManyClassCard() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Card(shadowColor: Color(0xFF4c8c4a).withOpacity(0.5),
        elevation: 7,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
              Text(
                "With many Class",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 0.2,
                  height: 1.25,
                ),
              ),
              Text(
                widget.dphone,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(widget.dcity, style: buildTextStyle()),
              Text(widget.dzip, style: buildTextStyle()),
            ],
          ),
        ),
      ),
    );
  }

  // one class Card ...................................................

  Padding OneClassCard() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
              Text(
                "With One Class",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.2,
                  height: 1.25,
                ),
              ),
              Text(
                widget.dname,
                style: TextStyle(
                  color: Color(0xFF4c8c4a),
                  fontWeight: FontWeight.w900,
                  fontSize: 27,
                ),
              ),
              Text("Email : ${widget.demail}", style: buildTextStyle()),
              Text('Phone : ${widget.dphone}', style: buildTextStyle()),
              Text("City : ${widget.dcity}", style: buildTextStyle()),
              Text("Zip Postal : ${widget.dzip}", style: buildTextStyle()),
            ],
          ),
        ),
      ),
    );
  }

  // center details.................................................................

  Padding buildCenterDetails() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.dname,
                    style: TextStyle(
                      color: Color(0xFF4c8c4a),
                      fontWeight: FontWeight.w900,
                      fontSize: 23,
                    ),
                  ),
                  Text(widget.demail, style: buildTextStyle()),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 40,
                    color: Colors.yellow.shade800,
                  ),
                  Text(
                    "12",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icons3(
                icon: Icons.camera,
                name: "Camera",
              ),
              Icons3(
                icon: Icons.phone,
                name: "Phone",
              ),
              Icons3(
                icon: Icons.message,
                name: "Message",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Icons3 extends StatelessWidget {
  Icons3({
    Key? key,
    required this.name,
    required this.icon,
  }) : super(key: key);
  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Color(0xFF4c8c4a),
          size: 30,
        ),
        Text(
          name,
          style: TextStyle(
            color: Color(0xFF4c8c4a),
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}

TextStyle buildTextStyle() => TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.2,
      height: 1.35,
    );
