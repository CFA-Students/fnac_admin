import 'package:equatable/equatable.dart';

abstract class TravelsEvent extends Equatable {
  const TravelsEvent();

  @override
  List<Object> get props => [];
}

class ReloadTravels extends TravelsEvent {
  const ReloadTravels();
}

class GetTravels extends TravelsEvent {
  const GetTravels();
}

class GetTravel extends TravelsEvent {
  final int id;
  const GetTravel(this.id);
}

class PostTravel extends TravelsEvent {
  const PostTravel();
}

class UpdateTravel extends TravelsEvent {
  const UpdateTravel();
}

class DeleteTravel extends TravelsEvent {
  const DeleteTravel();
}
