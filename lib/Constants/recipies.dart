import 'package:flutter/material.dart';

const String sampleRecipe =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?";

class Recipes {
  final String recipeName;
  final String recipeImage;
  final String recipeCuisine;
  final String chefName;
  final double calories;
  final int ingredients;
  final double time;
  final String recipe;

  Recipes({
    this.recipeName,
    this.recipeImage,
    this.recipeCuisine,
    this.chefName,
    this.time,
    this.calories,
    this.ingredients,
    @required this.recipe,
  });
}

List<String> filterRecipies = [
  'Popular',
  'Trending',
  'Vegetarian',
  'Non-Vegetarian',
  'Vegan',
];

List<Recipes> recipes = [
  Recipes(
    recipeName: 'Burger',
    recipeImage: 'assets/images/burger.jpg',
    recipeCuisine: 'Western',
    chefName: 'Priya Malhotra',
    calories: 500,
    ingredients: 5,
    time: 30,
    recipe: sampleRecipe,
  ),
  Recipes(
    recipeName: 'Grilled Chicken',
    recipeImage: 'assets/images/chicken_g.jpg',
    recipeCuisine: 'Western',
    chefName: 'Sanjeev Kapoor',
    calories: 500,
    ingredients: 5,
    time: 90,
    recipe: sampleRecipe,
  ),
  Recipes(
    recipeName: 'Fried Chicken',
    recipeImage: 'assets/images/chiken_f.jpeg',
    recipeCuisine: 'Western',
    chefName: 'Mamta Banerjee',
    calories: 500,
    ingredients: 5,
    time: 60,
    recipe: sampleRecipe,
  ),
  Recipes(
    recipeName: 'Dal',
    recipeImage: 'assets/images/dal.jpg',
    recipeCuisine: 'Indian',
    chefName: 'Rahul Gandhi',
    calories: 500,
    ingredients: 5,
    time: 30,
    recipe: sampleRecipe,
  ),
  Recipes(
      recipeName: 'Dosa',
      recipeImage: 'assets/images/dosa.jpeg',
      recipeCuisine: 'Indian',
      chefName: 'Master Chef',
      calories: 500,
      ingredients: 5,
      recipe: sampleRecipe,
      time: 45),
  Recipes(
    recipeName: 'Omelette',
    recipeImage: 'assets/images/omelette.jpg',
    recipeCuisine: 'French',
    chefName: 'Nattu Kaka',
    calories: 500,
    ingredients: 5,
    recipe: sampleRecipe,
    time: 10,
  ),
  Recipes(
    recipeName: 'Pizza',
    recipeImage: 'assets/images/pizza.jpg',
    recipeCuisine: 'Italian',
    chefName: 'Vikas Khanna',
    calories: 500,
    ingredients: 5,
    recipe: sampleRecipe,
    time: 40,
  ),
  Recipes(
    recipeName: 'Spaghetti',
    recipeImage: 'assets/images/spaghetti.jpg',
    recipeCuisine: 'Italian',
    chefName: 'Vikas Kumar',
    calories: 500,
    recipe: sampleRecipe,
    ingredients: 5,
    time: 30,
  ),
];
