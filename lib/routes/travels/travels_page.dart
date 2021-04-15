// import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../../api/json_parsers/json_parser.dart';
import '../../api/json_models/travel.dart';
import '../../api/http_client.dart';
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

// class TravelsPageContent extends StatelessWidget {
//   const TravelsPageContent();

//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: DataTable(
//         sortColumnIndex: 1,
//         sortAscending: false,
//         columns: <DataColumn>[
//           DataColumn(
//               label: Text('ID'),
//               numeric: true,
//               onSort: (int colIndex, bool ascending) {}),
//           const DataColumn(label: Text('created_at')),
//           const DataColumn(label: Text('updated_at')),
//           const DataColumn(label: Text('agency')),
//           const DataColumn(label: Text('destination')),
//           const DataColumn(label: Text('price_ht'), numeric: true),
//           const DataColumn(label: Text('price'), numeric: true),
//           const DataColumn(label: Text('description')),
//           const DataColumn(label: Text('main_photo')),
//         ],
//         rows: [
//           DataRow(cells: [
//             DataCell(Text('id')),
//             DataCell(Text('date')),
//             DataCell(Text('date')),
//             DataCell(Text('Air Vietnam')),
//             DataCell(Text('Vietnam')),
//             DataCell(Text('1000')),
//             DataCell(Text('1200')),
//             DataCell(Text('Voyage en Vietnam')),
//             DataCell(Text('Vietnam.jpg')),
//           ]),
//         ],
//       ),
//     );
//   }
// }
class TravelsPageContent extends StatefulWidget {
  const TravelsPageContent();

  @override
  _TravelsPageContentState createState() => _TravelsPageContentState();
}

class _TravelsPageContentState extends State<TravelsPageContent> {
  late final Future<List<Travel>> travels;

  @override
  void initState() {
    super.initState();
    travels = RequestREST(endpoint: '/travels')
        .executeGet<List<Travel>>(const TravelParser());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Travel>>(
      future: travels,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // Remember that 'snapshot.data' returns a nullable
          final data = snapshot.data ?? <Travel>[];
          print(data[0].createdAt);
          return (data.length > 0)
              ? TravelItemList(data)
              : const NoDataWidget();
        }
        if (snapshot.hasError) {
          return const ErrorWidget();
        }
        return const Center(
          child: const CircularProgressIndicator(),
        );
      },
    );
  }
}

class TravelItemList extends StatelessWidget {
  final List<Travel> data;
  const TravelItemList(this.data);

  @override
  Widget build(_) => ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => TravelItem(data[index]),
      );
}

class TravelItem extends StatelessWidget {
  final Travel travel;
  const TravelItem(this.travel);

  @override
  Widget build(_) {
    return ListTile(
      title: Text('${travel.id} : ${travel.destination}, ${travel.price}'),
      onTap: () {},
    );
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget();

  @override
  Widget build(_) => Text('Error');
}

class NoDataWidget extends StatelessWidget {
  const NoDataWidget();

  @override
  Widget build(_) => Text('Aucune donnée');
}
