part of 'app_bloc.dart';

@immutable
abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class AppLoadingState extends AppState {
  @override
  List<Object> get props => [];
}

class AppLoadedState extends AppState {
  final List<Album> albums;

  const AppLoadedState({required this.albums});

  @override
  List<Object> get props => [albums];
}

class AppErrorState extends AppState {
  final String error;

  const AppErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
