import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'travels_bloc.dart';

import '/api/json_models/travel.dart';
import '/routing/drawer_menu.dart';

class TravelsPage extends StatelessWidget {
  final String _title;
  const TravelsPage({Key? key, String title = 'Table : Travel'})
      : _title = title,
        super(key: key);

  @override
  Widget build(_) {
    return Scaffold(
      appBar: AppBar(title: Text(_title)),
      drawer: const DrawerMenu(),
      body: const Center(child: const TravelsPageBlocReload()),
    );
  }
}

class TravelsPageBlocReload extends StatelessWidget {
  const TravelsPageBlocReload();

  @override
  Widget build(BuildContext context) => BlocBuilder<TravelsBloc, TravelsState>(
        builder: (context, state) {
          return (state.travels.length > 0)
              ? TravelsList(state.travels)
              : const NoDataTextWidget();
        },
      );
}

// return const Center(
//   child: const CircularProgressIndicator(),
// );

class TravelsList extends StatelessWidget {
  final List<Travel> data;

  const TravelsList(this.data);

  @override
  Widget build(_) => ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => TravelsListItem(data[index]),
      );
}

class TravelsListItem extends StatelessWidget {
  final Travel data;

  const TravelsListItem(this.data);

  @override
  Widget build(_) {
    return ListTile(
      leading: Text(
        '${data.id}',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        textAlign: TextAlign.center,
      ),
      title: Text(
        'Voyage en ${data.destination}',
        style: TextStyle(fontSize: 18),
      ),
      onTap: () {},
    );
  }
}

class ErrorTextWidget extends StatelessWidget {
  const ErrorTextWidget();

  @override
  Widget build(_) => Text('Error');
}

class NoDataTextWidget extends StatelessWidget {
  const NoDataTextWidget();

  @override
  Widget build(_) => Text('Aucune donnée');
}
