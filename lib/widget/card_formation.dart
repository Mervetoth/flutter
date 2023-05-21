import 'package:flutter/material.dart';

class CardFormation extends StatelessWidget {
  String image;
  String year;
  String title;

  CardFormation(this.image, this.year, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            Container(
              height: 50,
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              year,
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}
