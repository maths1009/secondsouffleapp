import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const NavBar(
      {super.key, required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(90.0),
        border: Border.all(
          color: const Color(0xFF2F304C),
          width: 2.0,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 17.0),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Ensure it fits content
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.map, 'Map', 0),
          const SizedBox(width: 20.0),
          _buildNavItem(Icons.grid_view, 'Products', 1),
          const SizedBox(width: 20.0),
          _buildNavItem(Icons.person, 'Account', 2),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? const Color(0xFFEBF2CF)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF2F304C)),
            if (selectedIndex == index)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFF2F304C),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
