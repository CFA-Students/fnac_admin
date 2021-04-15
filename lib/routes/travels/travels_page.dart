import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './travels_state.dart';
import './travels_bloc.dart';
import './travels_event.dart';
import '../../api/json_models/travel.dart';
import '../../routing/drawer_menu.dart';

class TravelsPage extends StatelessWidget {
  final String title;

  const TravelsPage({Key? key, title})
      : title = 'Table : Travel',
        super(key: key);

  @override
  Widget build(_) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: const DrawerMenu(),
      body: const Center(child: const TravelsPageBlocReload()),
    );
  }
}

class TravelsPageBlocReload extends StatelessWidget {
  const TravelsPageBlocReload();

  @override
  Widget build(BuildContext context) => BlocProvider<TravelsBloc>(
        create: (context) => TravelsBloc()..add(const GetTravels()),
        child: BlocBuilder<TravelsBloc, TravelsState>(
          builder: (context, state) {
            return (state.travels.length > 0)
                ? TravelsList(state.travels)
                : const NoDataTextWidget();
          },
        ),
      );
}

class TravelsPageContent extends StatelessWidget {
  const TravelsPageContent();

  @override
  Widget build(BuildContext context) {
    final travelsBloc = context.read<TravelsBloc>();

    if (travelsBloc.state.travels.length > 0) {
      return TravelsList(travelsBloc.state.travels);
    }

    travelsBloc.add(GetTravels());
    return const NoDataTextWidget();
  }
}

// class TravelsPageContent extends StatefulWidget {
//   const TravelsPageContent();

//   @override
//   _TravelsPageContentState createState() => _TravelsPageContentState();
// }

// class _TravelsPageContentState extends State<TravelsPageContent> {
//   late final Future<List<Travel>> travels;

//   @override
//   void initState() {
//     super.initState();
//     travels = RequestREST(endpoint: '/travels')
//         .executeGet<List<Travel>>(const TravelParser());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Travel>>(
//       future: travels,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           // Remember that 'snapshot.data' returns a nullable
//           final data = snapshot.data ?? <Travel>[];
//           return (data.length > 0) ? TravelsList(data) : const NoDataTextWidget();
//         }
//         if (snapshot.hasError) {
//           return const ErrorTextWidget();
//         }
//         return const Center(
//           child: const CircularProgressIndicator(),
//         );
//       },
//     );
//   }
// }

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
        '${data.destination}',
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
