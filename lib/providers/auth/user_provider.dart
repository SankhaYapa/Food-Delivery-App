import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/controllers/db_controller.dart';
import 'package:food_delivery_app/models/objects.dart';

import 'package:food_delivery_app/screens/login_screen/login_screen.dart';
import 'package:food_delivery_app/screens/main_screen/main_screen.dart';
import 'package:food_delivery_app/utils/util_function.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:logger/logger.dart';

class UserProvider extends ChangeNotifier {
  //database controller object
  final DatabaseController _databaseController = DatabaseController();
  //user model
  late UserModel _userModel;
//get user data
  UserModel get userModel => _userModel;

  //address model

  final AddressModel _addressModel =
      AddressModel(addressString: "", latitude: 0, logitude: 0);

//get address string
  String get address => _addressModel.addressString != ""
      ? _addressModel.addressString
      : "select your location";
  //initializ and check user sign in or not
  void initializUser(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        Logger().i('User is currently signed out!');
        UtilFunction.navigateTo(context, LoginScreen());
      } else {
        Logger().i('User is signed in!');
        await fetchSingleUSer(user.uid);
        UtilFunction.navigateTo(context, MainScreen());
      }
    });
  }

//sign out method
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    UtilFunction.navigateTo(context, LoginScreen());
  }

//get user data from database contorller
  Future<void> fetchSingleUSer(String id) async {
    _userModel = (await _databaseController.getuserData(id))!;
    notifyListeners();
  }

  //set delivery address
  void setaddress(PickResult result) {
    _addressModel.addressString = result.formattedAddress!;
    _addressModel.latitude = result.geometry!.location.lat;
    _addressModel.logitude = result.geometry!.location.lng;

//adding the address existing usermodel
    _userModel.address = _addressModel;
    Logger().w(_userModel.toJson());
    _databaseController.updateAddress(_userModel);
    notifyListeners();
  }
}
