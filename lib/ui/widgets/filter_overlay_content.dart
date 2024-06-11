import 'package:flutter/material.dart';

class FilterOverlayContent extends StatelessWidget {
  const FilterOverlayContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Text(
          'Rechercher',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            hintText: 'Gaze de coton',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Stock',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Switch(
          value: true,
          onChanged: (bool newValue) {},
        ),
        const SizedBox(height: 20),
        const Text(
          'Distance',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Slider(
          value: 20,
          min: 0,
          max: 100,
          divisions: 5,
          label: '20km',
          onChanged: (double value) {},
        ),
        const SizedBox(height: 20),
        const Text(
          'Matière',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Wrap(
          spacing: 10,
          children: [
            ChoiceChip(
              label: const Text('Tissu'),
              selected: true,
              onSelected: (bool selected) {},
            ),
            ChoiceChip(
              label: const Text('Cabessa'),
              selected: false,
              onSelected: (bool selected) {},
            ),
            ChoiceChip(
              label: const Text('Jersey'),
              selected: false,
              onSelected: (bool selected) {},
            ),
            ChoiceChip(
              label: const Text('Calmouk'),
              selected: false,
              onSelected: (bool selected) {},
            ),
            ChoiceChip(
              label: const Text('Calicot'),
              selected: false,
              onSelected: (bool selected) {},
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text(
                  'Effacer',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2F304C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text(
                  'Appliquer les filtres',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
