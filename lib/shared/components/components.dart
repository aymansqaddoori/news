//news card

import 'package:flutter/material.dart';

Widget newsCard({required Map<dynamic, dynamic> articles}) => Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
  child: Row(
    spacing: 10,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image(
        image: articles['urlToImage'] == null
            ? AssetImage('assets/images/2.png')
            : NetworkImage('${articles['urlToImage']}'),
        width: 150,
        height: 100,
        fit: BoxFit.cover,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              articles['title'].toString(),
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              articles['content'].toString(),
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    ],
  ),
);
