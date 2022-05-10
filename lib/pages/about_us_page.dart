import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../aboutus/detail_page.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: FutureBuilder(
          builder: (context, AsyncSnapshot snapshot) {
            // var data = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return MyBox(
                  snapshot.data[index]['title'],
                  snapshot.data[index]['subtitle'],
                  snapshot.data[index]['image'],
                  snapshot.data[index]['detail'],
                );
              },
              itemCount: snapshot.data.length,
            );
          },
          future: getData(),
          // future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
        ),
      ),
    );
  }

  Widget MyBox(String title, String subtitle, String image, String detail) {
    var v1, v2, v3, v4;

    v1 = title;
    v2 = subtitle;
    v3 = image;
    v4 = detail;

    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      height: 300,
      decoration: BoxDecoration(
        // color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
          // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.25), BlendMode.darken),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade300,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            subtitle,
            style: TextStyle(color: Colors.grey.shade300, fontSize: 12),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    v1,
                    v2,
                    v3,
                    v4,
                  ),
                ),
              );
            },
            child: Text(
              'ອ່ານຕໍ່ >>>',
              style: TextStyle(
                color: Colors.grey.shade300,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future getData() async {
    // https://raw.githubusercontent.com/Thitphavanh/Flutter-API/main/data.json
    var url = Uri.https(
        'raw.githubusercontent.com', '/Thitphavanh/Flutter-API/main/data.json');
    var response = await http.get(url);
    var result = json.decode(response.body);
    return result;
  }
}
