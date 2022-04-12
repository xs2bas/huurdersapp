import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:huurdersapp/screens/welcome_page.dart';
import 'package:huurdersapp/widgets/navigation_drawer_widget.dart';
import 'package:huurdersapp/constants/app_colors.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Navigation Drawer';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 17,
            ),
          ),
          scaffoldBackgroundColor: AppColors.background,
          inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(color: AppColors.yellow),
            fillColor: Colors.orange,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white24),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
          fontFamily: 'Nunito',
          textTheme: const TextTheme(
            bodyText1: TextStyle(fontSize: 30),
            bodyText2: TextStyle(fontWeight: FontWeight.w100, fontSize: 14),
          ).apply(
            bodyColor: Colors.white,
            displayColor: const Color.fromARGB(255, 255, 0, 208),
          ),
          // primarySwatch: Color.fromARGB(255, 38, 255, 0),
        ),
        home: const MainPage(),
      );
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const NavigationDrawerWidget(),
        body: Builder(
          builder: (context) => const WelcomePage(),
        ),
      );
}
