import 'package:flutter/material.dart';
import 'package:namari/src/features/auth/screens/splash/splash_screen2.dart';
import 'package:namari/src/shared/app_button.dart';
import 'package:namari/src/utils/constant/images.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen1> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1EDC8B), // top green
              Color(0xFFBFF5DA), // light green
              Color(0xFFF5F5F5), // soft white
            ],
            stops: [0.0, 0.35, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _controller,
                  physics:
                      const NeverScrollableScrollPhysics(), // swipe disable
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: [
                    buildPage(width, height),
                    buildPage(width, height),
                    buildPage(width, height),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPage(double width, double height) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              AppImages.splash,
              width: width,
              height: height * 0.55,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.09,
              vertical: height * 0.02,
            ),
            child: Column(
              children: [
                Text(
                  "Find Your Next \n Flight Effortless",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: width * 0.09,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: height * 0.005),

                Text(
                  "Create Your Account And Enjoy big \n discounts for early adopters...",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: width * 0.04, color: Colors.grey),
                ),

                SizedBox(height: height * 0.03),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentPage == index ? 12 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Colors.black
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  }),
                ),

                SizedBox(height: height * 0.03),

                SizedBox(
                  width: double.infinity,
                  height: height * 0.055,
                  child: AppButton(
                    text: "Get Started",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SplashScreen2(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
