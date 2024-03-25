import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio_web/constant.dart';
import 'package:portfolio_web/controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => PortfolioController()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio Web',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0 * 4, vertical: 16.0 * 2),
              child: Row(
                children: [
                  const Text('TM',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      )),
                  const Spacer(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildNavItem('Home', 0),
                        buildNavItem('About', 1),
                        buildNavItem('Services', 2),
                        buildNavItem('Portfolio', 3),
                        buildNavItem('Contact', 4),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0 * 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: const TextSpan(
                                text: "I'm ",
                                style: TextStyle(
                                  fontSize: 35.0,
                                  color: Colors.white,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Tushar Mahmud',
                                    style: TextStyle(
                                      fontSize: 45.0,
                                      color: seconderyColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            const Text(
                              "Experienced Jetpack Compose & Flutter Developer",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 16.0 * 2),
                            Consumer<PortfolioController>(
                                builder: (context, controller, child) {
                              return MouseRegion(
                                onEnter: (_) {
                                  controller.hireMeEnter();
                                },
                                onExit: (_) {
                                  controller.hireMeExit();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0 * 2, vertical: 16.0),
                                  decoration: BoxDecoration(
                                    color: controller.isHireMeHover
                                        ? Colors.transparent
                                        : seconderyColor,
                                    border: Border.all(
                                      color: seconderyColor,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Text(
                                    'Hire Me',
                                    style: TextStyle(
                                      color: controller.isHireMeHover
                                          ? seconderyColor
                                          : Colors.black,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                              );
                            }),
                            const SizedBox(height: 16.0),
                            Consumer<PortfolioController>(
                                builder: (context, controller, child) {
                              return MouseRegion(
                                onEnter: (_) {
                                  controller.cvEnter();
                                },
                                onExit: (_) {
                                  controller.cvExit();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0 * 2, vertical: 16.0),
                                  decoration: BoxDecoration(
                                    color: controller.isCVHover
                                        ? seconderyColor
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: seconderyColor,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Text(
                                    'Download CV',
                                    style: TextStyle(
                                      color: controller.isCVHover
                                          ? Colors.black
                                          : seconderyColor,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0 * 4),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Image.asset(
                            'assets/images/user.png',
                            height: MediaQuery.of(context).size.height * 0.6,
                          ),
                          Positioned(
                            top: 120,
                            right: 260,
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/icons/github.png',
                                  height: 40.0,
                                ),
                                const SizedBox(height: 20.0),
                                Image.asset(
                                  'assets/icons/twitter.png',
                                  height: 40.0,
                                ),
                                const SizedBox(height: 20.0),
                                Image.asset(
                                  'assets/icons/facebook.png',
                                  height: 40.0,
                                ),
                                const SizedBox(height: 20.0),
                                Image.asset(
                                  'assets/icons/youtube.png',
                                  height: 40.0,
                                ),
                                const SizedBox(height: 20.0),
                                Image.asset(
                                  'assets/icons/linkedin.png',
                                  height: 40.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0 * 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0 * 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'About Me',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 2,
                        width: 50,
                        color: seconderyColor,
                      ),
                      const SizedBox(width: 16.0),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: const Text(
                          'Experienced Software Developer proficient in Android and iOS app development using Flutter, Dart, Java, and Kotlin. Skilled in Jetpack Compose for Android UI development. Expertise includes database management with MySQL and MongoDB. Passionate about creating efficient and user-friendly mobile applications. Also adept in WordPress development for web solutions. Always eager to learn and adapt to new technologies.',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0 * 4),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0 * 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Skills',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0 * 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ServiceCard(
                        icon: 'assets/icons/java.png',
                        title: 'Java',
                      ),
                      SizedBox(width: 16.0),
                      ServiceCard(
                        icon: 'assets/icons/python.png',
                        title: 'Python',
                      ),
                      SizedBox(width: 16.0),
                      ServiceCard(
                        icon: 'assets/icons/js.png',
                        title: 'JavaScript',
                      ),
                      SizedBox(width: 16.0),
                      ServiceCard(
                        icon: 'assets/icons/php.png',
                        title: 'PHP',
                      ),
                      SizedBox(width: 16.0),
                      ServiceCard(
                        icon: 'assets/icons/dart.png',
                        title: 'Dart',
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ServiceCard(
                        icon: 'assets/icons/flutter.png',
                        title: 'Flutter',
                      ),
                      SizedBox(width: 16.0),
                      ServiceCard(
                        icon: 'assets/icons/html.png',
                        title: 'HTML',
                      ),
                      SizedBox(width: 16.0),
                      ServiceCard(
                        icon: 'assets/icons/css.png',
                        title: 'CSS',
                      ),
                      SizedBox(width: 16.0),
                      ServiceCard(
                        icon: 'assets/icons/aws.png',
                        title: 'AWS',
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ServiceCard(
                        icon: 'assets/icons/mongodb.png',
                        title: 'MongoDB',
                      ),
                      SizedBox(width: 16.0),
                      ServiceCard(
                        icon: 'assets/icons/mysql.png',
                        title: 'MySQL',
                      ),
                      SizedBox(width: 16.0),
                      ServiceCard(
                        icon: 'assets/icons/git.png',
                        title: 'Git',
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ServiceCard(
                        icon: 'assets/icons/firebase.png',
                        title: 'Firebase',
                      ),
                      SizedBox(width: 16.0),
                      ServiceCard(
                        icon: 'assets/icons/compose.png',
                        title: 'Jetpack Compose',
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0 * 4),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0 * 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'Portfolio',
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0 * 2),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 16.0,
                            mainAxisSpacing: 16.0,
                            childAspectRatio: 1.5,
                          ),
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                color: primaryAccentColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: Text(
                                  'Project ${index + 1}',
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 16.0 * 4),
                        Text(
                          'Experience',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16.0 * 2),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 2,
                              width: 50,
                              color: seconderyColor,
                            ),
                            SizedBox(width: 16.0),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Software Developer',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: seconderyColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    'Company Name, Location',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildNavItem(String title, int index) {
    return Consumer<PortfolioController>(builder: (context, controller, child) {
      return MouseRegion(
        onEnter: (_) {
          controller.onEnter(index);
        },
        onExit: (_) {
          controller.onExit(index);
        },
        child: Text(
          title,
          style: TextStyle(
            color: controller.isHoverList[index]
                ? Colors.deepOrange
                : Colors.white,
            fontWeight: controller.isHoverList[index]
                ? FontWeight.bold
                : FontWeight.normal,
            fontSize: controller.isHoverList[index] ? 18.0 : 16.0,
            decoration: controller.isHoverList[index]
                ? TextDecoration.underline
                : TextDecoration.none,
          ),
        ),
      );
    });
  }
}

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
  });
  final String icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Consumer<PortfolioController>(builder: (context, controller, child) {
      return MouseRegion(
        onEnter: (_) {},
        onExit: (_) {},
        child: Container(
          height: 180,
          width: 180,
          decoration: BoxDecoration(
            color: primaryAccentColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                icon,
                height: 50.0,
              ),
              const SizedBox(height: 16.0),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
