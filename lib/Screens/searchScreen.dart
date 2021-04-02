import 'package:cookbook/Constants/decorations.dart';
import 'package:cookbook/Constants/recipies.dart';
import 'package:cookbook/Constants/textStyles.dart';
import 'package:cookbook/Routes/routeAnimation.dart';
import 'package:cookbook/Screens/recipeScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List filteredIndex = [];
  bool notFiltered = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 30, 16.0, 0.0),
          child: Column(
            children: [
              Container(
                child: TextFormField(
                  onFieldSubmitted: (value) {
                    List indexes = [];
                    for (int i = 0; i < recipes.length; i++) {
                      print(value);
                      if (recipes[i].recipeName.toLowerCase() == value ||
                          recipes[i].recipeCuisine.toLowerCase() == value)
                        indexes.add(i);
                    }
                    setState(() {
                      filteredIndex = indexes;
                      notFiltered = false;
                    });
                  },
                  decoration: kSearchInputDecoration(context),
                ),
              ),
              notFiltered
                  ? Expanded(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 38.0),
                          child: Image.asset('assets/images/delicious.jpg'),
                        ),
                      ),
                    )
                  : filteredIndex.isEmpty
                      ? Expanded(
                          child: Center(
                            child: Text(
                              'Sorry! Nothing Found',
                              style: GoogleFonts.lato(fontSize: 24),
                            ),
                          ),
                        )
                      : Padding(
                        padding: const EdgeInsets.only(top:18.0),
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: filteredIndex.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: InkWell(
                                  onTap: () => Navigator.push(
                                    context,
                                    PageRouteAnimation2(
                                      RecipeScreen(
                                        index: filteredIndex[index],
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
                                              MediaQuery.of(context).size.height *
                                                  0.25,
                                          width: double.infinity,
                                          child: Hero(
                                            tag: recipes[filteredIndex[index]]
                                                .recipeImage,
                                            child: Image.asset(
                                              recipes[filteredIndex[index]]
                                                  .recipeImage,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        '${recipes[filteredIndex[index]].recipeName} recipe',
                                        style: kRecipeScreenNameStyle,
                                      ),
                                      SizedBox(height: 4.0),
                                      Text(
                                        'by ${recipes[filteredIndex[index]].chefName}',
                                        style: kChefNameStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
            ],
          ),
        ),
      ),
    );
  }
}
