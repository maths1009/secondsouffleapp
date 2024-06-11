import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String name;
  final String description;
  final int quantity;
  final void Function() onAdd;
  final void Function() onRemove;

  const ProductItem({
    super.key,
    required this.name,
    required this.description,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: const Color(0xFF2F304C), width: 1.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(name,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 8,
                                  backgroundColor: Colors.brown[900],
                                ),
                                const SizedBox(width: 8),
                                CircleAvatar(
                                  radius: 8,
                                  backgroundColor: Colors.brown[700],
                                ),
                                const SizedBox(width: 8),
                                CircleAvatar(
                                  radius: 8,
                                  backgroundColor: Colors.brown[500],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: onRemove,
                              icon: const Icon(Icons.remove),
                              color: const Color(0xFF2F304C),
                            ),
                            Text(
                              '$quantity',
                              style: const TextStyle(fontSize: 16),
                            ),
                            IconButton(
                              onPressed: onAdd,
                              icon: const Icon(Icons.add),
                              color: const Color(0xFF2F304C),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(description),
                    const SizedBox(height: 8),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        elevation: 0,
                      ).copyWith(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {},
                      icon: const CircleAvatar(
                        backgroundColor: Color(0xFF2F304C),
                        child: Icon(Icons.add),
                      ),
                      label: const Text('Réserver le produit'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
