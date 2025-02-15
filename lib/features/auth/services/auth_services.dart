import 'dart:convert';
import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/globalvariables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/home/screens/home_screen.dart';
import 'package:amazon_clone/model/user.dart';
import 'package:amazon_clone/provider/user_provier.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // sign up user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        password: password,
        email: email,
        address: '',
        type: '',
        token: '',
      );
      http.Response res = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      if (!context.mounted)  return;
       
    

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: ()  {
          
           showSnackBar( 
    context :context,
    text: 'Account Created!,Login with same credentials',
      );
          },
          );
    } catch (e) {
      showSnackBar(context: context,text:  e.toString());
    }
  }
 //SignIn
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(Uri.parse('$uri/api/signin'),
          body: jsonEncode({'email': email, 'password': password}),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      if (!context.mounted) {
        return;
      }

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
                SharedPreferences prefs =  await SharedPreferences.getInstance();
                if(!context.mounted)
                {
                  return;
                }
                Provider.of<UserProvider>(context,listen: false).setUser(res.body);
                await  prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
                if(!context.mounted)
                {
                  return;
                }
                Navigator.pushNamedAndRemoveUntil(  context, HomeScreen.routeName, (route) => false);
      
          },
          );
    } catch (e) {
      showSnackBar(context: context , text:  e.toString());
    }
  }
}
