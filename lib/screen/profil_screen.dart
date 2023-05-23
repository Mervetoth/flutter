import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:lottie/lottie.dart';

class ProfilScreen extends StatefulWidget {
  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  List<String> skills = [
    'Flutter',
    'Java',
    'Android',
    'Laravel',
    'Ionic',
    'Dart',
    'Spring',
    'React',
    'Python',
    'Git',
    'Agile',
    'UML'
  ];
  Map<String, dynamic> paysData = {};
  List<String> flags = [];

  @override
  void initState() {
    super.initState();
    List<String> countries = ['TN', 'FR', 'ES', 'US'];
    getCountriesData(countries);
  }

  Future<void> getCountriesData(List<String> countries) async {
    List<Future<void>> requests = [];

    for (String country in countries) {
      requests.add(getPaysData(country));
    }

    await Future.wait(requests);

    // Process the flags URLs in the same order as countries
    for (String country in countries) {
      String flagUrl = paysData[country];

      flags.add(flagUrl);
      //print(flags.length);
    }
  }

  Future<void> getPaysData(String keyword) async {
    String url = "https://flagsapi.com/$keyword/shiny/64.png";

    print(url);

    try {
      var response = await http.get(Uri.parse(url));

      setState(() {
        paysData[keyword] = url;
        print(paysData);
      });
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: paysData.isEmpty
          ? FutureBuilder<void>(
              future:
                  Future.delayed(Duration(seconds: 20)), // Delay for 10 seconds
              builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Lottie.asset(
                      'assets/animations/loadingf.json',
                      width: 200,
                      height: 200,
                    ),
                  );
                } else {
                  return Center(
                    child: Text('No data available'),
                  );
                }
              },
            )
          : Container(
              padding: EdgeInsets.all(10),
              color: Theme.of(context).backgroundColor,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Container(
                          width: 100, // Adjust the width as needed
                          height: 100, // Adjust the height as needed
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey, // Adjust the border color
                              width: 2, // Adjust the border width
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 50, // Adjust the radius as needed
                            backgroundImage: AssetImage(
                                'assets/images/profile.jpg'), // Replace with your own image path
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Belguith Nour',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 30,
                                    fontFamily: 'MavenPro',
                                  ),
                            ),
                            Text(
                              "Développeuse en mastère à l'ISEt Sfax\navec une passion pour la programmation \net une expertise en Java, Flutter, Python.",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 13,
                                    fontFamily: 'Hubbali',
                                  ),
                            )
                          ],
                        )
                      ],
                    ),
                    Divider(
                      thickness: 0.8,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.contact_phone,
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Contact",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 25,
                                    fontFamily: 'MavenPro',
                                  ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.mail,
                              color:
                                  Theme.of(context).textTheme.bodyText2!.color,
                            ),
                            SizedBox(width: 22),
                            Text(
                              "Belghuithnour@gmail.com",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 16,
                                    fontFamily: 'Hubbali',
                                    // fontStyle: FontStyle.italic
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.person,
                              color:
                                  Theme.of(context).textTheme.bodyText2!.color,
                            ),
                            SizedBox(width: 22),
                            Text(
                              "23 ans",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 16,
                                    fontFamily: 'Hubbali',
                                    // fontStyle: FontStyle.italic
                                  ),
                            ),
                            SizedBox(
                              width: 17,
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.phone,
                              color:
                                  Theme.of(context).textTheme.bodyText2!.color,
                            ),
                            SizedBox(width: 22),
                            Text(
                              "27 432 661",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 16,
                                    fontFamily: 'Hubbali',
                                    // fontStyle: FontStyle.italic
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.directions_car,
                              color:
                                  Theme.of(context).textTheme.bodyText2!.color,
                            ),
                            SizedBox(width: 22),
                            Text(
                              "Permis B",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 16,
                                    fontFamily: 'Hubbali',
                                    // fontStyle: FontStyle.italic
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.place,
                              color:
                                  Theme.of(context).textTheme.bodyText2!.color,
                            ),
                            SizedBox(width: 22),
                            Text(
                              "Tunisia   ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 16,
                                    fontFamily: 'Hubbali',
                                    // fontStyle: FontStyle.italic
                                  ),
                            ),
                            Card(
                              child: SizedBox(
                                width: 25,
                                height: 25,
                                child: flags.length > 1
                                    ? Image.network(
                                        flags[0],
                                        fit: BoxFit.cover,
                                      )
                                    : SizedBox(), // Use a placeholder if flag URL is not available
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 0.8,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.card_travel,
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Compétences",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 25,
                                    fontFamily: 'MavenPro',
                                  ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 120,
                      child: GridView.count(
                        crossAxisCount: 3,
                        childAspectRatio: 5,
                        children: List.generate(skills.length, (index) {
                          return Text(
                            '• ${skills[index]}',
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: 16,
                                      fontFamily: 'Hubbali',
                                    ),
                          );
                        }),
                      ),
                    ),
                    Divider(
                      thickness: 0.8,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.language_outlined,
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Langues",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 25,
                                    fontFamily: 'MavenPro',
                                  ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Row(
                              children: <Widget>[
                                Card(
                                  child: SizedBox(
                                    width: 25,
                                    height: 25,
                                    child: flags.length > 1
                                        ? Image.network(
                                            flags[1],
                                            fit: BoxFit.cover,
                                          )
                                        : SizedBox(), // Use a placeholder if flag URL is not available
                                  ),
                                ),
                                SizedBox(width: 22),
                                Text(
                                  "Français     ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                        fontSize: 16,
                                        fontFamily: 'Hubbali',
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: <Widget>[
                                Card(
                                  child: SizedBox(
                                    width: 25,
                                    height: 25,
                                    child: flags.length > 1
                                        ? Image.network(
                                            flags[3],
                                            fit: BoxFit.cover,
                                          )
                                        : SizedBox(), // Use a placeholder if flag URL is not available
                                  ),
                                ),
                                SizedBox(width: 22),
                                Text(
                                  "Anglais      ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                        fontSize: 16,
                                        fontFamily: 'Hubbali',
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: <Widget>[
                            Card(
                              child: SizedBox(
                                width: 25,
                                height: 25,
                                child: flags.length > 1
                                    ? Image.network(
                                        flags[0],
                                        fit: BoxFit.cover,
                                      )
                                    : SizedBox(), // Use a placeholder if flag URL is not available
                              ),
                            ),
                            SizedBox(width: 22),
                            Text(
                              "Arabe   ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 16,
                                    fontFamily: 'Hubbali',
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Card(
                              child: SizedBox(
                                width: 25,
                                height: 25,
                                child: flags.length > 1
                                    ? Image.network(
                                        flags[2],
                                        fit: BoxFit.cover,
                                      )
                                    : SizedBox(), // Use a placeholder if flag URL is not available
                              ),
                            ),
                            SizedBox(width: 22),
                            Text(
                              "Espagnol   ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 16,
                                    fontFamily: 'Hubbali',
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 0.8,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.interests,
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Centres d'intérêt ",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 25,
                                    fontFamily: 'MavenPro',
                                  ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.library_books,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .color,
                                ),
                                SizedBox(width: 22),
                                Text(
                                  "Lecture   ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                        fontSize: 16,
                                        fontFamily: 'Hubbali',
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.travel_explore,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .color,
                                ),
                                SizedBox(width: 22),
                                Text(
                                  "Voyages   ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                        fontSize: 16,
                                        fontFamily: 'Hubbali',
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.music_note_rounded,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .color,
                                ),
                                SizedBox(width: 22),
                                Text(
                                  "Musique   ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                        fontSize: 16,
                                        fontFamily: 'Hubbali',
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.sports_basketball,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .color,
                                ),
                                SizedBox(width: 22),
                                Text(
                                  "Sport        ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                        fontSize: 16,
                                        fontFamily: 'Hubbali',
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
