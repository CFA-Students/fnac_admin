// import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../../routing/drawer_menu.dart';

class TravelsPage extends StatelessWidget {
  final title = 'Table : Travel';

  const TravelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: const DrawerMenu(),
      body: const Center(child: const TravelsPageContent()),
    );
  }
}

class TravelsPageContent extends StatelessWidget {
  const TravelsPageContent();

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        sortColumnIndex: 1,
        sortAscending: false,
        columns: <DataColumn>[
          DataColumn(
              label: Text('ID'),
              numeric: true,
              onSort: (int colIndex, bool ascending) {}),
          const DataColumn(label: Text('created_at')),
          const DataColumn(label: Text('updated_at')),
          const DataColumn(label: Text('agency')),
          const DataColumn(label: Text('destination')),
          const DataColumn(label: Text('price_ht'), numeric: true),
          const DataColumn(label: Text('price'), numeric: true),
          const DataColumn(label: Text('description')),
          const DataColumn(label: Text('main_photo')),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('id')),
            DataCell(Text('date')),
            DataCell(Text('date')),
            DataCell(Text('Air Vietnam')),
            DataCell(Text('Vietnam')),
            DataCell(Text('1000')),
            DataCell(Text('1200')),
            DataCell(Text('Voyage en Vietnam')),
            DataCell(Text('Vietnam.jpg')),
          ]),
        ],
      ),
    );
  }
}
