import 'package:flutter/material.dart';
import 'package:nano_health/view/screens/home/home_screen.dart';
import 'package:nano_health/viewModels/auth_view_model.dart';
import 'package:nano_health/viewModels/home_view_model.dart';
import 'package:provider/provider.dart';
import 'injection_container.dart' as di;
import 'route_generator.dart';
import 'util/navigation_service.dart';
import 'view/screens/login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => di.serviceLocator<AuthViewModel>(),
        ),
        ChangeNotifierProvider(
          create: (context) => di.serviceLocator<HomeViewModel>(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        title: 'Nano Health',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
        onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        ),
      ),
    );
  }
}
