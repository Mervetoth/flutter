import 'package:flutter/material.dart';
import 'package:timeline_list/timeline_model.dart';
import 'package:timeline_list/timeline.dart';
import '../widget/card_formation.dart';

class FormationScreen extends StatelessWidget {
  List<TimelineModel> items = [
    TimelineModel(
      CardFormation(
        'assets/images/logo.png',
        '2023',
        'Master développement des systèmes d informations et réseaux',
      ),
      position: TimelineItemPosition.left,
      iconBackground: Colors.blue.shade200, // Change the iconBackground to blue
      icon: Icon(Icons.school),
    ),
    TimelineModel(
      CardFormation(
        'assets/images/chebbi.jpg',
        '2019',
        'Bachelor science expérimentale',
      ),
      position: TimelineItemPosition.right,
      iconBackground: Colors.blue.shade400, // Change the iconBackground to blue
      icon: Icon(Icons.school),
    ),
    TimelineModel(
      CardFormation(
        'assets/images/iset.jpg',
        '2022',
        'Licence en développement des systèmes d informations',
      ),
      position: TimelineItemPosition.left,
      iconBackground: Colors.blue.shade700, // Change the iconBackground to blue
      icon: Icon(Icons.school),
    ),
  ];

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
                image: AssetImage('assets/images/form.png'),
                width: 100,
                height: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Formation ",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'MavenPro',
                        ),
                  ),
                  Text(
                    "Formation académique et parcours éducatif.",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Hubbali',
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
            child: Timeline(
              lineColor: Colors.grey.shade400,
              children: items,
              position: TimelinePosition.Center,
            ),
          )
        ],
      ),
    );
  }
}
