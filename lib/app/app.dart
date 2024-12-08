import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:vazifalar/config/config.dart';

class FlutterRiverpodTodoApp extends ConsumerStatefulWidget {
  const FlutterRiverpodTodoApp({super.key});

  @override
  ConsumerState<FlutterRiverpodTodoApp> createState() => _FlutterRiverpodTodoAppState();
}

class _FlutterRiverpodTodoAppState extends ConsumerState<FlutterRiverpodTodoApp> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () { // 3 soniya kutish
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final route = ref.watch(routesProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: route,
      builder: (context, child) { // Splash screenni qo'shish
        if (_isLoading) {
          return Scaffold(
            body: Center(
              child: Lottie.asset('assets/animations/splash_logo.json'), // Splash screen dizayni
            ),
          );
        } else {
          return child!;
        }
      },
    );
  }
}