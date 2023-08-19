import 'package:cosmeticstest/core/features/Providers/productsProvider/ProductProvider.dart';
import 'package:cosmeticstest/presentation/pages/IntroScreens/OnBoardingScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{

 WidgetsFlutterBinding.ensureInitialized();


 runApp( ChangeNotifierProvider(
   create: (context) => ProductProvider(),
   child: MaterialApp(
     title: 'Flutter Provider Example',
     debugShowCheckedModeBanner: false,
     home: MyApp(),
   ),
 ));
 /*runApp(ChangeNotifierProvider<ProductProvider>(
   create: (context){
     return ProductProvider();
   },
         child: MaterialApp( debugShowCheckedModeBanner: false,
          home: MyApp())),

  );*/

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontFamily: 'Bahij_TheSansArabic-Plain',  // Default font family
            // Add more text properties here as needed
          ),
        ),

      ),
      home:  onBoardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
