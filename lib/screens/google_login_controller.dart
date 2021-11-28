import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_user_authentication_application/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInController with ChangeNotifier {
  var _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleAccount;
  UserModel? userModel;

  login() async {
    this.googleAccount = await _googleSignIn.signIn();
    notifyListeners();
  }

  logOut() async {
    this.googleAccount = await _googleSignIn.signOut();
    notifyListeners();
  }

  googleLogin() async {
    this.googleAccount = await _googleSignIn.signIn();
    // inserting values to our user details model

    this.userModel = new UserModel(
      firstName: this.googleAccount!.displayName,
      email: this.googleAccount!.email,
      // photoURL: this.googleAccount!.photoUrl,
    );

    // call
    notifyListeners();
  }

  // function for facebook login
  facebooklogin() async {
    var result = await FacebookAuth.i.login(
      permissions: ["public_profile", "email"],
    );

    // check the status of our login
    if (result.status == LoginStatus.success) {
      final requestData = await FacebookAuth.i.getUserData(
        fields: "email, name, picture",
      );

      this.userModel = new UserModel(
        firstName: requestData["name"],
        email: requestData["email"],
        // photoURL: requestData["picture"]["data"]["url"] ?? " ",
      );
      notifyListeners();
    }
  }
}
