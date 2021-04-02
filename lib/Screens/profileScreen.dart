import 'package:cookbook/Constants/variables.dart';
import 'package:cookbook/Routes/appRoutes.dart';
import 'package:cookbook/Routes/routeAnimation.dart';
import 'package:cookbook/Screens/favouritesScreen.dart';
import 'package:cookbook/Services/facebookAuthentication.dart';
import 'package:cookbook/Services/firebase.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FacebookAuthenticationService _auth = FacebookAuthenticationService();

  @override
  Widget build(BuildContext context) {
    return isLoggedIn
        ? UserLoggedIn(
            userInfo: userInfo,
            signOut: () async {
              _auth.logout();
              setState(() {
                isLoggedIn = false;
              });
            },
          )
        : Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign In to create Your Profile',
                    style: GoogleFonts.lato(
                      fontSize: 26,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Divider(
                    height: 50,
                    thickness: 1.5,
                  ),
                  ElevatedButton(
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.7,
                        alignment: Alignment.center,
                        child: Text('login with Facebook '),
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        var info = await _auth.login();
                        setState(() {
                          isLoggedIn = true;
                          FavouritesScreen documentId = FavouritesScreen(
                            documentId: info.result['id'],
                          );
                          userInfo = info;
                        });
                      }),
                ],
              ),
            ),
          );
  }
}

class UserLoggedIn extends StatelessWidget {
  final UserInformation userInfo;
  final Function signOut;

  UserLoggedIn({this.userInfo, this.signOut});

  final FireBaseServices fireStore = FireBaseServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage:
                    NetworkImage(userInfo.result['picture']['data']['url']),
                radius: 60,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                userInfo.userCredential.user.displayName,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                userInfo.userCredential.user.email,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/third');
                },
                leading: Icon(
                  Icons.favorite_outlined,
                  color: Theme.of(context).accentColor,
                ),
                visualDensity: VisualDensity(
                  vertical: 0.0,
                  horizontal: -4.0,
                ),
                title: Text('Your Favourites'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).accentColor,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 3),
                    backgroundColor: Theme.of(context).primaryColor,
                    content: Text('Functionality coming soon'),
                  ));
                },
                leading: Icon(
                  Icons.comment_rounded,
                  color: Theme.of(context).accentColor,
                ),
                visualDensity: VisualDensity(
                  vertical: 0.0,
                  horizontal: -4.0,
                ),
                title: Text('Your Comments'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).accentColor,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: signOut,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColor),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Center(
                    child: Text('LogOut'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
