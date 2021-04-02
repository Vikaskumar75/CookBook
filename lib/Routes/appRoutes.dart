import '../Screens/favouritesScreen.dart';
import '../Screens/profileScreen.dart';
import '../Screens/recipeScreen.dart';
import '../Screens/searchScreen.dart';
import 'package:flutter/material.dart';

import '../Routes/routeAnimation.dart';
import '../Screens/homeScreen.dart';

Route onGenerateRoute(RouteSettings route) {
  switch (route.name) {
    case '/':
      return PageRouteAnimation(HomeScreen());
    case '/second':
      return PageRouteAnimation(RecipeScreen());
    case '/third':
      return PageRouteAnimation(FavouritesScreen());
    case '/fourth':
      return PageRouteAnimation(ProfileScreen());
    case '/fifth':
      return PageRouteAnimation2(SearchScreen());
    default:
      return null;
  }
}
