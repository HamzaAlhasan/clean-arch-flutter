import 'package:clean_arch_app/core/di/dependency_injection.dart';
import 'package:clean_arch_app/features/auth/presentation/pages/login_page.dart';
import 'package:clean_arch_app/features/auth/presentation/provider/login_provider.dart';
import 'package:clean_arch_app/features/instructor/presentation/provider/instructor_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => serviceLocator<LoginProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => serviceLocator<InstructorProvider>(),
        ),
      ],
      child: MaterialApp(
        title: 'Clean Architecture App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
