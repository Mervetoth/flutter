import 'package:flutter/material.dart';

class CardExp extends StatefulWidget {
  @override
  _CardExpState createState() => _CardExpState();
}

class _CardExpState extends State<CardExp> {
  bool isOpen = false;
  List<String> skills = [
    'Architecture de la BDD',
    "Etude du projet",
    "Conception du projet"
  ];
  bool isOpen2 = false;
  List<String> skills2 = [
    "Cloud computing",
    " Sécurité informatique",
    "  Analyse de données",
    " Communication et collaboration",
    "  Adaptabilité et apprentissage continu",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isOpen = !isOpen;
              });
            },
            child: AnimatedContainer(
              curve: Curves.easeInOutQuint,
              padding: EdgeInsets.all(8),
              duration: Duration(milliseconds: 600),
              height: isOpen ? 270 : 210,
              color: Colors.grey.shade200,
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.domain,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "SIFAST",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 25,
                                    fontFamily: 'MavenPro',
                                  ),
                            ),
                          ],
                        ),
                        Text(
                          "Février --> juin 2022",
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 14,
                                    fontFamily: 'Hubbali',
                                  ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "STAGIAIRE",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Hubbali',
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Conception et développement front et back d une platefome d automatisation du processus des tests',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 14,
                            fontFamily: 'Hubbali',
                          ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: (skills.length * 19).toDouble(),
                      child: GridView.count(
                        physics: BouncingScrollPhysics(),
                        crossAxisCount: 1,
                        childAspectRatio: 20,
                        children: List.generate(skills.length, (index) {
                          return Text(
                            '• ${skills[index]}',
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: 14,
                                      fontFamily: 'Hubbali',
                                    ),
                          );
                        }),
                      ),
                    ),
                    Text(
                      "Environnement technique : ",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            fontFamily: 'Hubbali',
                          ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'BACK :  PHP , Laravel ,mysql',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 14,
                            fontFamily: 'Hubbali',
                          ),
                    ),
                    Text(
                      'Front : Laravel, css, Html, Java Script',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 14,
                            fontFamily: 'Hubbali',
                          ),
                    ),
                    Text(
                      'Autres : gitlab, git, sourcetree, UML, Agile Scrum,',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 14,
                            fontFamily: 'Hubbali',
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isOpen2 = !isOpen2;
              });
            },
            child: AnimatedContainer(
              curve: Curves.easeInOutQuint,
              padding: EdgeInsets.all(8),
              duration: Duration(milliseconds: 600),
              height: isOpen2 ? 270 : 210,
              color: Colors.grey.shade200,
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.domain,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "MTD GROUP",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 25,
                                    fontFamily: 'MavenPro',
                                  ),
                            ),
                          ],
                        ),
                        Text(
                          "Février --> Mars 2021",
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 14,
                                    fontFamily: 'Hubbali',
                                  ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "STAGIAIRE",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Hubbali',
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Développement d'un logiciel pour les besoins de MTD GROUP.",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 14,
                            fontFamily: 'Hubbali',
                          ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: (skills.length * 19).toDouble(),
                      child: GridView.count(
                        physics: BouncingScrollPhysics(),
                        crossAxisCount: 1,
                        childAspectRatio: 20,
                        children: List.generate(skills.length, (index) {
                          return Text(
                            '• ${skills[index]}',
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: 14,
                                      fontFamily: 'Hubbali',
                                    ),
                          );
                        }),
                      ),
                    ),
                    Text(
                      "Environnement technique : ",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 16,
                          fontFamily: 'Hubbali',
                          decoration: TextDecoration.underline),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'BACK :  NodeJs, Laravel ,mysql',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 14,
                            fontFamily: 'Hubbali',
                          ),
                    ),
                    Text(
                      'Front : Laravel, css, Html, Java Script',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 14,
                            fontFamily: 'Hubbali',
                          ),
                    ),
                    Text(
                      'Autres : gitlab, git, UML, Agile Scrum,',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 14,
                            fontFamily: 'Hubbali',
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
