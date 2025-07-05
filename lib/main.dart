import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instastyle/core/localstorage/local_data.dart';
import 'package:instastyle/core/locator/locator.dart';
import 'package:instastyle/core/theme/theme.dart';
import 'package:instastyle/feature/home/presentation/screens/home_screen.dart';
import 'package:instastyle/feature/status/presentation/bloc/status_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  await locator<LocalData>().loadApproToken();
  await locator<LocalData>().loadFinalToken();
  await locator<LocalData>().loadUserMobileNumber();
  await locator<LocalData>().loadImageUrl();
  await locator<LocalData>().loadFreeUsageCount();
  await locator<LocalData>().loadStatus();
  await locator<LocalData>().loadStoreMessageCount();
  await locator<LocalData>().loadTheme();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'texim',
      themeMode: ThemeMode.light,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => locator<StatusBloc>(),
        child: const HomeScreen(),
      ),
    );
  }
}
