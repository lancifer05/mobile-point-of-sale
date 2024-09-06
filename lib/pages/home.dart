import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:p3_app_dev/pages/components/card.dart'; // Ensure this path is correct

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  void _onCartButtonPressed() {
    // Implement your cart button action here
    // For example, navigate to a cart page
    GoRouter.of(context).go('/cart');
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isWideScreen = screenWidth > 600;

    return Scaffold(
      key: _scaffoldKey,
      appBar: isWideScreen
          ? null
          : AppBar(
              backgroundColor: const Color(0xFF3F52E3),
              title: const Text('Flutter Drawer Example'),
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: _openDrawer,
              ),
            ),
      drawer: !isWideScreen
          ? Drawer(
              backgroundColor: const Color(0xffF6F6F6),
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Container(
                    height: 100,
                    color: const Color(0xFF3F52E3),
                    child: const DrawerHeader(
                      decoration: BoxDecoration(
                        color: Color(0xFF3F52E3),
                      ),
                      child: Text(
                        'Menu',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  _buildDrawerItem(Icons.home, 'Home', '/home'),
                  _buildDrawerItem(Icons.settings, 'Settings', '/settings'),
                  _buildDrawerItem(Icons.contacts, 'Contacts', '/contacts'),
                  _buildDrawerItem(Icons.logout, 'Logout', '/logout'),
                ],
              ),
            )
          : null,
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: const Color(0xffF6F6F6),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: CardBackground(
                        child: Container(
                          height: screenWidth < 600 ? 90 : 100,
                          color: const Color(0xFF3F52E3),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Expanded(
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              final isVerticalLayout =
                                  constraints.maxWidth < 600;

                              return Flex(
                                direction: isVerticalLayout
                                    ? Axis.vertical
                                    : Axis.horizontal,
                                children: [
                                  if (isVerticalLayout)
                                    Container(
                                      height: 50,
                                      child: const Row(),
                                    ),
                                  if (isWideScreen)
                                    Container(
                                      width: 240,
                                      color: const Color(0xFF3F52E3),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 120,
                                          ),
                                          _buildDrawerItem(Icons.home, 'Home', '/sample'),
                                          _buildDrawerItem(Icons.settings, 'Settings', '/settings'),
                                          _buildDrawerItem(Icons.contacts, 'Contacts', '/contacts'),
                                          _buildDrawerItem(Icons.logout, 'Logout', '/logout'),
                                        ],
                                      ),
                                    ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          width: isVerticalLayout ? 350 : 400,
                                          height: 70,
                                          child: TextFormField(
                                            decoration: const InputDecoration(
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xffF6F6F6),
                                                  width: 2.0,
                                                ),
                                              ),
                                              hintText: "Search",
                                              hintStyle: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 7, 7, 7),
                                              ),
                                            ),
                                          ),
                                        ),
                                        if (!isVerticalLayout)
                                          const SizedBox(height:80),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    screenWidth < 600 ? 0 : 12),
                                            alignment: Alignment.center,
                                            child: SingleChildScrollView(
                                              child: Wrap(
                                                spacing: 10.0,
                                                runSpacing: 15.0,
                                                children:
                                                    List.generate(100, (index) {
                                                  return Container(
                                                    padding:
                                                        const EdgeInsets.all(4),
                                                    child: Cards(
                                                      height: screenWidth < 600
                                                          ? 220
                                                          : 250,
                                                      width: screenWidth < 600
                                                          ? 170
                                                          : 200,
                                                      imagePath:
                                                          'assets/crogi.jpg',
                                                    ),
                                                  );
                                                }),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onCartButtonPressed,
        backgroundColor: const Color(0xFF3F52E3),
        child: const Icon(Icons.shopping_cart,
        color: Color(0xffF6F6F6),),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String text, String route) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: () {
        GoRouter.of(context).go(route);
        _closeDrawer(); // Close drawer after navigation
      },
    );
  }
}

class CardBackground extends StatelessWidget {
  final Widget child;
  final double borderRadius;

  CardBackground({required this.child, this.borderRadius = 30.0});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Material(
      elevation: 4,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(screenWidth < 600 ? borderRadius : 0),
        bottomRight: Radius.circular(screenWidth < 600 ? borderRadius : 0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(screenWidth < 600 ? borderRadius : 0),
          bottomRight: Radius.circular(screenWidth < 600 ? borderRadius : 0),
        ),
        child: Container(
          color: const Color(0xFFFFC436),
          child: child,
        ),
      ),
    );
  }
}
