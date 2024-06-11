import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:secondsouffleapp/ui/widgets/base_page.dart';
import 'package:secondsouffleapp/ui/widgets/overlay.dart';

class AccountPage extends BasePage {
  const AccountPage({super.key}) : super(selectedIndex: 2);

  @override
  // ignore: library_private_types_in_public_api
  _AccountPageState createState() => _AccountPageState();

  @override
  Widget buildPage(BuildContext context) {
    return const AccountContent();
  }
}

class _AccountPageState extends BasePageState<AccountPage> {}

class AccountContent extends StatelessWidget {
  const AccountContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'Mon compte',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              'assets/mockAccountPicture.png',
              width: double.infinity,
              height: 270,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            initialValue: 'Morgane',
            decoration: InputDecoration(
              labelText: 'Nom',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            initialValue: 'morgane.doe@gmail.com',
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            initialValue: '************',
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Mot de passe',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Notifications',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  showCustomOverlay(
                    context,
                    'Gestion notifications',
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Recevoir des notifications',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Switch(
                          value: true,
                          onChanged: (bool newValue) {},
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2F304C), // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15.0),
              ),
              child: const Text(
                'Sauvegarder',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
