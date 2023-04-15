import 'package:flutter/material.dart';
import 'package:interview_pilar/app/presentation/pages/home_page.dart';
import 'package:interview_pilar/core/theme/pilar_colors.dart';
import 'package:interview_pilar/core/theme/pilar_textstyle.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PilarColor.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Pilar',
                style: PilarTextStyle.h1().copyWith(color: PilarColor.white),
              ),
              const SizedBox(height: 20),
              Container(
                height: 2,
                width: 50,
                color: PilarColor.second,
              ),
              const SizedBox(height: 20),
              Text(
                'Reinventando a forma como\ncorretores e imobiliárias\nboutique operam e crescem\nseus negócios.',
                style: PilarTextStyle.h4().copyWith(color: PilarColor.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
