import 'package:cookbook/Services/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

FireBaseServices fireBaseServices = FireBaseServices();

class UserInformation {
  final Map result;
  final UserCredential userCredential;

  UserInformation({this.result, this.userCredential});
}

class FacebookAuthenticationService {
  Future<UserInformation> login() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      final userData = await FacebookAuth.instance.getUserData();

      final OAuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken.token);

      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (userCredential.additionalUserInfo.isNewUser) {
        await fireBaseServices.addUser(indexes: [], userId: userData['id']);
      }
      return UserInformation(result: userData, userCredential: userCredential);
    }
    return null;
  }

  Future logout() async {
    await FacebookAuth.instance.logOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs?.setBool("isLoggedOut", false);
  }
}
