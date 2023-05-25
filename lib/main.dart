import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:quis_kebangsaan/src/commons/utils.dart';
import 'package:quis_kebangsaan/src/domain/entities/Topic.dart';
import 'package:quis_kebangsaan/src/presentation/bloc/dashboard/dashboard_bloc.dart';
import 'package:quis_kebangsaan/src/presentation/screen/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quis_kebangsaan/src/presentation/screen/question_screen.dart';
import 'package:quis_kebangsaan/src/presentation/screen/topic_screen.dart';
import 'firebase_options.dart';
import 'package:quis_kebangsaan/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print('Hello, World!');
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<DashboardBloc>(),
        ),
      ],
      child: MaterialApp(
          title: 'Quiz',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MainScreen(),
          navigatorObservers: [routeObserver],
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case '/':
                return MaterialPageRoute(builder: (_) => const MainScreen());
              case '/topics':
                return MaterialPageRoute(builder: (_) => const TopicScreen());
              case '/question':
                Map arg = settings.arguments as Map;
                return MaterialPageRoute(builder: (_) => QuestionScreen(argument: arg,),settings: settings);
            }
          },
        ),
    );
  }
}

