import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';

import 'components/card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  OverlayEntry? _overlayEntry;

  // Drawer functions
  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  // Overlay functions
  void _onCartButtonPressed() {
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context)?.insert(_overlayEntry!);
    } else {
      _removeOverlay();
    }
  }

  OverlayEntry _createOverlayEntry() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: _removeOverlay,
        child: Stack(
          children: [
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0.7, sigmaY: 0.7),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Prevent tap events from propagating to the GestureDetector that closes the overlay
                },
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        "Hello Boss!!!",
                        style: TextStyle(fontSize: 24, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
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
              title: const Text('Hello Prilan'),
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
            if (isWideScreen)
              Container(
                width: 240,
                color: const Color(0xFF3F52E3),
                child: Column(
                  children: [
                    const SizedBox(height: 120),
                    _buildDrawerItem(Icons.home, 'Home', '/home'),
                    _buildDrawerItem(Icons.settings, 'Settings', '/settings'),
                    _buildDrawerItem(Icons.contacts, 'Contacts', '/contacts'),
                    _buildDrawerItem(Icons.logout, 'Logout', '/logout'),
                  ],
                ),
              ),
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
                        Container(
                          padding: const EdgeInsets.all(5),
                          width: screenWidth < 600 ? 350 : 400,
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
                                color: Color.fromARGB(255, 7, 7, 7),
                              ),
                            ),
                          ),
                        ),
                      Container(color: Colors.transparent,height: 50, ),
                        Expanded(
                          child: SingleChildScrollView(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth < 600 ? 5 : 12),
                            child: Wrap(
                              spacing: 10.0,
                              runSpacing: 10.0,
                              children: List.generate(100, (index) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                  child: Cards(
                                    height: screenWidth < 600 ? 260 : 300,
                                    width: screenWidth < 600 ? 170 : 200,
                                    imagePath: 'assets/crogi.jpg',
                                  ),
                                );
                              }),
                            ),
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
        child: const Icon(
          Icons.shopping_cart,
          color: Color(0xffF6F6F6),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String text, String route) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: () {
        GoRouter.of(context).go(route);
        _closeDrawer();
      },
    );
  }
}

// My Card Background
class CardBackground extends StatelessWidget {
  final Widget child;
  final double borderRadius;

  const CardBackground(
      {super.key, required this.child, this.borderRadius = 30.0});

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
          child: child,
        ),
      ),
    );
  }
}
