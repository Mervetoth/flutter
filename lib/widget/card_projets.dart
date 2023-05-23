import 'package:flutter/material.dart';

class CardProjet extends StatefulWidget {
  @override
  _CardProjetState createState() => _CardProjetState();
}

class _CardProjetState extends State<CardProjet> {
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
              height: isOpen ? 170 : 170,
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
                              "FLUTTER",
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
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        " Création d'une application mobile pour présenter un CV professionnel de manière interactive.",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Hubbali',
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Affichage des informations personnelles, de l'expérience professionnelle, des compétences, de la formation et des projets réalisés et  Intégration de liens vers les profils sociaux et le portfolio en ligne.",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 12,
                            fontFamily: 'Hubbali',
                          ),
                    ),
                    SizedBox(
                      height: 25,
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
                isOpen = !isOpen;
              });
            },
            child: AnimatedContainer(
              curve: Curves.easeInOutQuint,
              padding: EdgeInsets.all(8),
              duration: Duration(milliseconds: 600),
              height: isOpen ? 170 : 170,
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
                              "WORPRESS",
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
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Création d'un site web e-commerce pour la vente en ligne de produits.",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Hubbali',
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Configuration initiale de WordPress, installation de WooCommerce, personnalisation du thème, ajout des produits et configuration des options de livraison et de paiement.',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 12,
                            fontFamily: 'Hubbali',
                          ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "  et plus d'autres projets ...",
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontSize: 14,
                  fontFamily: 'Hubbali',
                ),
          ),
          Image(image: AssetImage("assets/images/projet2.png"))
        ],
      ),
    );
  }
}
