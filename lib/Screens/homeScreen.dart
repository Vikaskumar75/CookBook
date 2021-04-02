import '../Routes/routeAnimation.dart';
import '../Screens/recipeScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants/recipies.dart';
import '../Constants/textStyles.dart';

class HomeScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Text(
                'Looking For Your Favourite Meal ?',
                style: kHomeScreenHeaderStyle,
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () => Navigator.pushReplacementNamed(context, '/fifth'),
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 0.8,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Theme.of(context).accentColor,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Recipes, Cuisine',
                          style: GoogleFonts.roboto(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: MediaQuery.of(context).size.height * 0.20,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => Navigator.push(
                          context,
                          PageRouteAnimation2(
                            RecipeScreen(
                              index: index,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: AspectRatio(
                                aspectRatio: 1 / 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Container(
                                    child: Hero(
                                      tag: 'tag[$index]',
                                      child: Image.asset(
                                        recipes[index].recipeImage,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                '${recipes[index].recipeName} recipe',
                                style: kRecipeNameStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, _) => SizedBox(width: 16),
                    itemCount: recipes.length),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Recipes',
                    style: GoogleFonts.damion(
                      fontSize: 20.0,
                      color: Color(0xFFFA2C1F),
                    ),
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.filter_list,
                      color: Colors.grey[600],
                    ),
                  )
                ],
              ),
              ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.push(
                      context,
                      PageRouteAnimation2(
                        RecipeScreen(
                          index: index,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: double.infinity,
                            child: Hero(
                              tag: recipes[index].recipeImage,
                              child: Image.asset(
                                recipes[index].recipeImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${recipes[index].recipeName} recipe',
                          style: kRecipeScreenNameStyle,
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          'by ${recipes[index].chefName}',
                          style: kChefNameStyle,
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, _) => SizedBox(height: 16),
                itemCount: recipes.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
