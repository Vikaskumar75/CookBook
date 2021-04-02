import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookbook/Constants/recipies.dart';
import 'package:cookbook/Constants/textStyles.dart';
import 'package:cookbook/Routes/routeAnimation.dart';
import 'package:cookbook/Screens/recipeScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouritesScreen extends StatefulWidget {
  final String documentId;

  const FavouritesScreen({Key key, this.documentId}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<FavouritesScreen> {
  CollectionReference favourites =
      FirebaseFirestore.instance.collection('Favourites');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: 'Cook',
              style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),
            TextSpan(
              text: 'Book',
              style: GoogleFonts.lato(
                color: Theme.of(context).accentColor,
                fontSize: 18.0,
              ),
            ),
          ]),
        ),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: favourites.doc('533866151340173').get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }
          if (snapshot.hasData) {
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data = snapshot.data.data();
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                    itemCount: data['index'].length,
                    itemBuilder: (context, index) {

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: InkWell(
                          onTap: () => Navigator.push(
                            context,
                            PageRouteAnimation2(
                              RecipeScreen(
                                index: data['index'][index],
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  width: double.infinity,
                                  child: Hero(
                                    tag: recipes[data['index'][index]].recipeImage,
                                    child: Image.asset(
                                      recipes[data['index'][index]].recipeImage,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '${recipes[data['index'][index]].recipeName} recipe',
                                style: kRecipeScreenNameStyle,
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                'by ${recipes[data['index'][index]].chefName}',
                                style: kChefNameStyle,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              );
            }
          }

          return Text("loading");
        },
      ),
    );
  }
}
