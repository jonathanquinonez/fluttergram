library app.auth;

import 'package:flutter/material.dart';
import 'package:fluttergram/bloc/bloc.dart';
import 'package:fluttergram/helpers/navigator.dart';
import 'package:fluttergram/ui_shared/constants.dart';
import 'package:fluttergram/ui_shared/size_config.dart';
import 'package:fluttergram/ui_shared/behavior.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fluttergram/widgets/input/input.dart';
import 'package:fluttergram/widgets/social_button.dart';
import 'package:fluttergram/helpers/validator.dart';
import 'package:fluttergram/widgets/button.dart';

import 'package:fluttergram/bloc/login/login_bloc.dart';
import 'package:fluttergram/locator.dart';

part 'login_view.dart';
part 'signin_view.dart';
part 'forgot_password.dart';
part 'complete_info_view.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key key}) : super(key: key);

  final NavigationService navigator = locator<NavigationService>();

  static String route = '/auth';
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: LoginScreen.route,
      key: navigator.authNavigatorKey,
      onGenerateRoute: authenticationNavStack,
    );
  }
}

Route<dynamic> authenticationNavStack(RouteSettings settings) {
  Map<String, Route<dynamic>> authRouting = <String, Route<dynamic>>{
    LoginScreen.route: MaterialPageRoute<dynamic>(
      settings: RouteSettings(name: LoginScreen.route),
      builder: (_) => LoginScreen(),
    ),
    ForgotPasswordScreen.route: MaterialPageRoute<dynamic>(
      settings: RouteSettings(name: ForgotPasswordScreen.route),
      builder: (_) => ForgotPasswordScreen(),
    ),
    SigninScreen.route: MaterialPageRoute<dynamic>(
      settings: RouteSettings(name: SigninScreen.route),
      builder: (_) => SigninScreen(),
    ),
    CompleteUserInfoScreen.route: MaterialPageRoute<dynamic>(
      settings: RouteSettings(name: CompleteUserInfoScreen.route),
      builder: (_) => CompleteUserInfoScreen(),
    ),
  };
  return authRouting[settings.name];
}
