import 'package:flutter/material.dart';
import 'package:medical_store_app/components/mycontainer.dart';
import 'package:medical_store_app/components/on_board_model.dart';
import 'package:medical_store_app/page/auth_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardscreen extends StatefulWidget {
  OnBoardscreen({super.key});

  @override
  State<OnBoardscreen> createState() => _OnBoardscreenState();
}

class _OnBoardscreenState extends State<OnBoardscreen> {
  int selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 55),
            SizedBox(
              height: 550,
              child: PageView.builder(
                itemCount: images.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingScreen(
                    image: images[index]['image']!,
                    title: images[index]['title']!,
                    des: images[index]['des']!,
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        if (selectedIndex > 0) {
                          selectedIndex--;
                          _pageController.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        } else {
                          onContinue(context);
                        }
                      });
                    },
                    child: Text(
                      selectedIndex == 0 ? 'Skip' : 'Back',
                      style: TextStyle(
                          color: selectedIndex == 0
                              ? Colors.grey
                              : Color(0xff4157FF)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      images.length,
                      (index) => Padding(
                        padding: EdgeInsets.all(2),
                        child: Mycontainer(isActive: selectedIndex == index),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectedIndex < images.length - 1) {
                          selectedIndex++;
                          _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        } else {
                          onContinue(context);
                        }
                      });
                    },
                    child: Container(
                      child: Text(
                        selectedIndex < images.length - 1 ? 'Next' : 'Continue',
                        style: TextStyle(
                            color: selectedIndex < images.length - 1
                                ? Color(0xff4157FF)
                                : Colors.grey),
                      ),
                      width: 60,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onContinue(context) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool('On_BOARDING', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AuthPage(),
      ),
    );
  }
}
