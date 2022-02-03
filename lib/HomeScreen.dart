import 'dart:async';
import 'dart:convert';
import 'package:api3/details_screen.dart';
import 'package:api3/model_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> listData = [];

  var loading = false;

  Future getData() async {
    setState(() {
      loading = true;
    });

    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map<String, dynamic> d in data) {
          listData.add(User.fromJson(d));
        }
      });

      loading = false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? Center(
              child: CircularProgressIndicator(
                  backgroundColor: Color(0xFF4c8c4a), color: Color(0xFFfdd835)),
            )
          : ListView.builder(
              itemCount: listData.length,
              itemBuilder: (context, i) {
                final nDataList = listData[i];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          dname: nDataList.name,
                          demail: nDataList.email,
                          dcity: nDataList.address.city,
                          dphone: nDataList.phone,
                          dzip: nDataList.address.zipcode,
                        ),
                      ),
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Color(0xFF4c8c4a),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nDataList.name,
                              style: TextStyle(
                                color: Color(0xFFfdd835),
                                fontWeight: FontWeight.w900,
                                fontSize: 23,
                              ),
                            ),
                            Text(
                              nDataList.email,
                              style: buildTextStyle(),
                            ),
                            Text(
                              nDataList.phone,
                              style: buildTextStyle(),
                            ),
                            Text(
                              nDataList.website,
                              style: buildTextStyle(),
                            ),
                            SizedBox(height: 15),
                            Text(
                              "Address",
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              nDataList.address.street,
                              style: buildTextStyle(),
                            ),
                            Text(
                              nDataList.address.city,
                              style: buildTextStyle(),
                            ),
                            Text(
                              nDataList.address.suite,
                              style: buildTextStyle(),
                            ),
                            Text(
                              nDataList.address.zipcode,
                              style: buildTextStyle(),
                            ),
                            SizedBox(height: 15),
                            Text(
                              "Company",
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              nDataList.company.name,
                              style: buildTextStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }

  TextStyle buildTextStyle() => TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.2,
        height: 1.25,
      );
}
