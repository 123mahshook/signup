import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:signup/app/config/app_module_container.dart';
import 'package:signup/core/config/module_container.dart';
import 'package:signup/screens/splash_screen/splash_screen.dart';
import 'package:signup/utility/ui/providers/customer_details_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:signup/utility/ui/providers/google_sign_in_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await ModuleContainer.initialise(Injector());
  await AppModuleContainer.initialise(Injector());
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 760),
      builder: (context, child) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sign Up',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
