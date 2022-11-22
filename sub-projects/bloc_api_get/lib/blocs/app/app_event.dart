part of 'app_bloc.dart';

@immutable
abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class GetAlbumEvent extends AppEvent {
  @override
  List<Object> get props => [];
}
