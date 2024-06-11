import 'package:flutter/material.dart';

void showCustomOverlay(BuildContext context, String title, Widget content) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return CustomOverlayContent(title: title, content: content);
    },
  );
}

class CustomOverlayContent extends StatelessWidget {
  final String title;
  final Widget content;

  const CustomOverlayContent(
      {super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const Spacer(),
              Text(
                title,
                style: const TextStyle(fontSize: 18),
              ),
              const Spacer(flex: 2),
            ],
          ),
          const SizedBox(height: 10),
          content,
        ],
      ),
    );
  }
}
