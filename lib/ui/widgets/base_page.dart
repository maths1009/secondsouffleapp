import 'package:flutter/material.dart';
import 'package:secondsouffleapp/ui/widgets/navbar.dart';

abstract class BasePage extends StatefulWidget {
  final int selectedIndex;

  const BasePage({super.key, required this.selectedIndex});

  @override
  BasePageState createState();

  Widget buildPage(
      BuildContext context); // Abstract method to be implemented by subclasses
}

abstract class BasePageState<T extends BasePage> extends State<T> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  void onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
      switch (index) {
        case 0:
          Navigator.pushReplacementNamed(context, '/map');
          break;
        case 1:
          Navigator.pushReplacementNamed(context, '/products');
          break;
        case 2:
          Navigator.pushReplacementNamed(context, '/account');
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          widget.buildPage(context), // Call the abstract method
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: NavBar(
                selectedIndex: _selectedIndex,
                onItemTapped: onItemTapped,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
