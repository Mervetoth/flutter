import 'package:flutter/material.dart';
import 'package:flutter_mini_projet/widget/card_projets.dart';

class ProjetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: double.infinity,
      width: double.infinity,
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Image(
                image: AssetImage('assets/images/projet.png'),
                width: 100,
                height: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mes projets",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'MavenPro',
                        ),
                  ),
                  Text(
                    "Principales Réalisations et Projets.",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Huballi',
                        ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 0.8,
            color: Theme.of(context).canvasColor,
          ),
          Expanded(
            child: ListView.separated(
                padding: EdgeInsets.all(10),
                itemBuilder: (BuildContext ctx, int index) {
                  return CardProjet();
                },
                separatorBuilder: (BuildContext ctx, int index) {
                  return SizedBox(height: 15);
                },
                itemCount: 1),
          )
        ],
      ),
    );
  }
}
