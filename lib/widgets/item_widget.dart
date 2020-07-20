import 'package:first_real_attempt/models/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  ItemWidget({this.item});

  Widget build(BuildContext context) {
    Column c;

    c = Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            item.title,
            style: TextStyle(
                color: Color(0xFF898989),
                backgroundColor: Color(0xFFE8E8E8),
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          item.subtitle,
          style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 24.0,
              fontWeight: FontWeight.bold),
        ),
      ],
    );

    // add the details to the Column
    Text det;
    for (var detail in item.details) {
      det = Text(
        detail,
        style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 18.0,
            fontWeight: FontWeight.bold),
      );
      c.children.add(det);
    }

    c.children.add(Divider(
      color: Colors.grey,
      height: 5,
      thickness: 5,
    ));

    return (Container(height: 120.0, color: Color(0xFFE8E8E8), child: c));
  }
}
