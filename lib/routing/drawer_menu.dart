import 'package:flutter/material.dart';
import '../routing/routes.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            child: const DrawerMenuHeader(),
          ),
          const DrawerSectionTitle('API Management'),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: Colors.teal,
            ),
            title: const Text('Home'),
            onTap: () =>
                Navigator.of(context)?.pushNamed(RouteGenerator.homePage),
          ),
          const Divider(
            indent: 15,
            endIndent: 15,
            height: 1,
          ),
          ListTile(
            leading: const Icon(
              Icons.flight,
              color: Colors.teal,
            ),
            title: const Text('Travels'),
            onTap: () =>
                Navigator.of(context)?.pushNamed(RouteGenerator.travelsPage),
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Colors.teal,
            ),
            title: const Text('Users'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(
              Icons.category,
              color: Colors.teal,
            ),
            title: const Text('Categories'),
            onTap: () => {},
          ),
          const DrawerSectionTitle('Other'),
          ListTile(
            leading: const Icon(
              Icons.email,
              color: Colors.teal,
            ),
            title: const Text('Contact'),
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}

class DrawerMenuHeader extends StatelessWidget {
  const DrawerMenuHeader();

  @override
  Widget build(_) {
    return Wrap(
      direction: Axis.vertical,
      children: const <Widget>[
        const Icon(
          Icons.admin_panel_settings,
          size: 50,
          color: Colors.teal,
        ),
        const Text(
          'Fnac Voyages',
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          'Admin Panel',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class DrawerSectionTitle extends StatelessWidget {
  final String text;
  const DrawerSectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
      child: Text(
        text,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      ),
    );
  }
}
