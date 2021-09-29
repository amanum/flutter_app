import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_pick/core/constants/developers.dart';
import 'package:quick_pick/core/constants/enums.dart';

import 'package:quick_pick/core/exceptions/route_exception.dart';
import 'package:quick_pick/main.dart';
import 'package:quick_pick/models/card_user.dart';
import 'package:quick_pick/models/employer.dart';
import 'package:quick_pick/screens/auth/sign_up.dart';
import 'package:quick_pick/screens/auth/select_type_registration.dart';
import 'package:quick_pick/screens/auth/client/about.dart';
import 'package:quick_pick/screens/auth/client/about_next_step.dart';
import 'package:quick_pick/screens/auth/client/upload_file.dart';
import 'package:quick_pick/screens/auth/company/about.dart';
import 'package:quick_pick/screens/auth/company/about_vacancy.dart';
import 'package:quick_pick/screens/auth/company/complete_information.dart';
import 'package:quick_pick/screens/auth/auth.dart';
import 'package:quick_pick/screens/chat/all_chats.dart';
import 'package:quick_pick/screens/home/home.dart';
import 'package:quick_pick/screens/home/user_info.dart';
import 'package:quick_pick/screens/home/match.dart';
import 'package:quick_pick/screens/home/user_profile.dart';

class AppRouter {
  static const String home = '/home';

  static const String auth = '/auth';

  static const String signUp = '/sign_up';
  static const String signUpSelectType = '/sign_up/type';
  static const String signUpEmployerCompany = '/sign_up/employer/company';
  static const String signUpEmployerVacancy = '/sign_up/employer/vacancy';
  static const String signUpEmployerAddInfo = '/sign_up/employer/add-info';
  static const String signUpEmployeeInfo = '/sign_up/employee/info';
  static const String signUpEmployeeInfoMore = '/sign_up/employee/info-more';
  static const String signUpEmployeeDocs = '/sign_up/employee/docs';

  static const String userInfo = '/user';
  static const String match = '/match';
  static const String userProfile = '/user-profile';

  static const String allChats = '/chats';
  static const String chat = '/chats/item';

  static const String developers = '/developers';
  static const String splash = '/';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case auth:
        return MaterialPageRoute(
          builder: (_) => Auth(),
        );
      case signUp:
        return MaterialPageRoute(
          builder: (_) => SignUp(),
        );
      case signUpSelectType:
        return MaterialPageRoute(
          builder: (_) => SelectTypeRegistration(),
        );
      case signUpEmployerCompany:
        return MaterialPageRoute(
          builder: (_) => AboutCompanyRegis(),
        );
      case signUpEmployerVacancy:
        return MaterialPageRoute(
          builder: (_) => AboutVacancy(),
        );
      case signUpEmployerAddInfo:
        return MaterialPageRoute(
          builder: (_) => CompleteInformation(),
        );
      case signUpEmployeeInfo:
        return MaterialPageRoute(
          builder: (_) => AboutClientRegis(),
        );
      case signUpEmployeeInfoMore:
        return MaterialPageRoute(
          builder: (_) => AboutClientNextStep(),
        );
      case signUpEmployeeDocs:
        return MaterialPageRoute(
          builder: (_) => UploadFileClientRegis(),
        );
      case home:
        late UserType userType;
        if(settings.arguments == null) {
          userType = UserType.employee;
        } else {
          userType = settings.arguments as UserType;
        }
        return MaterialPageRoute(
          builder: (_) => MainPage(
            client: userType == UserType.employee,
          ),
        );
      case userInfo:
        ICardUser user = settings.arguments as ICardUser;
        return CupertinoPageRoute(
          builder: (_) => UserInfo(user),
        );
      case developers:
        return MaterialPageRoute(
          builder: (_) => Developers(),
        );
      case match:
        Employer employer = settings.arguments as Employer;
        return MaterialPageRoute(
          builder: (_) => Match(employer: employer,),
        );
      case userProfile:
        return MaterialPageRoute(
          builder: (_) => UserProfile(),
        );
      case allChats:
        return MaterialPageRoute(
          builder: (_) => AllChats(),
        );
      case chat:
        return MaterialPageRoute(
          builder: (_) => AllChats(),
        );
      case splash:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}