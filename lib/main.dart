import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/provider/Search_provider.dart';
import 'package:news_app/screens/category/news_details_view.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/search/search_screen.dart';
import 'package:news_app/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<SearchProvider>(create: (_) => SearchProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: DevicePreview.appBuilder,
          routes: {
            HomeScreen.routeName: (_) => const HomeScreen(),
            NewsDetailsView.routeName: (_) => const NewsDetailsView(),
            SearchScreen.routeName: (_) => const SearchScreen()
          },
          home: child,
          theme: AppTheme.lightTheme,
        );
      },
      child: const HomeScreen(),
    );
  }
}
