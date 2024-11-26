import 'package:flutter/material.dart';
import 'package:healthious_demo/screens/food_tracker_screen.dart';
import 'package:healthious_demo/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  final _screens = [HomeScreen(), FoodTrackerScreen()];

  void _onItemTapped(int index) {
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _screens, // Prevents manual swiping
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.fastfood), label: 'Food Tracker'),
          ]),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
