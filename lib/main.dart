import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pharma_connect_app/routes/app_route.dart';
import 'package:pharma_connect_app/routes/app_route_pages.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(const MyApp());
  } catch (e) {
    debugPrint(" Firebase Initialization Error: $e");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PharmaConnect',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.dashboard,
      getPages: AppRoutePages.pages,
    );
  }
}
