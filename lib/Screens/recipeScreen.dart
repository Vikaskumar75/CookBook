import 'package:cookbook/Constants/variables.dart';
import 'package:cookbook/Services/firebase.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants/recipies.dart';
import '../Constants/textStyles.dart';

class RecipeScreen extends StatefulWidget {
  final int index;

  RecipeScreen({this.index});

  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  bool isFavourite = false;

  FireBaseServices fireBaseServices = FireBaseServices();
  List<int> indexes;
  var document;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Hero(
              tag: 'tag[${widget.index}]',
              child: Image.asset(
                recipes[widget.index].recipeImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          DraggableScrollableSheet(
            minChildSize: 0.6,
            initialChildSize: 0.6,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(28, 28, 28, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                recipes[widget.index].recipeName,
                                style: kRecipeScreenNameStyle,
                              ),
                              Text(
                                'by ${recipes[widget.index].chefName}',
                                style: kChefNameStyle,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  isFavourite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isFavourite
                                      ? Theme.of(context).accentColor
                                      : Colors.grey,
                                  size: 30.0,
                                ),
                                onPressed: () async {
                                  if (isLoggedIn == false) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Theme.of(context).accentColor,
                                        content: Text(
                                            'Login required for adding to favourites'),
                                      ),
                                    );
                                  } else {
                                    await fireBaseServices.updateUser(
                                        userId: userInfo.result['id'],
                                        indexes: [1, 2, 5, 7, 8]);
                                    setState(() {
                                      if (isFavourite == false)
                                        isFavourite = true;
                                      else
                                        isFavourite = false;
                                    });
                                  }
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.comment,
                                  color: Theme.of(context).accentColor,
                                  size: 30.0,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      'Calories',
                                      style: kRecipeScreenCardLabel,
                                    ),
                                    Text(
                                      '${recipes[widget.index].calories.toStringAsFixed(0)} kacl',
                                      style: GoogleFonts.roboto(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      'Ingredients',
                                      style: kRecipeScreenCardLabel,
                                    ),
                                    Text(
                                      '${recipes[widget.index].ingredients}',
                                      style: GoogleFonts.roboto(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      'Time',
                                      style: kRecipeScreenCardLabel,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        '${recipes[widget.index].time.toStringAsFixed(0)} minutes',
                                        style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Recipe',
                        style: kRecipeHeading,
                      ),
                      SizedBox(height: 16.0),
                      Text('${recipes[widget.index].recipe}')
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
