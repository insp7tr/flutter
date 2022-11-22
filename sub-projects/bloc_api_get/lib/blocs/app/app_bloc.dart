import 'package:bloc_api_get/models/album_model.dart';
import 'package:bloc_api_get/repos/repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AlbumRepository _albumRepository;

  AppBloc(this._albumRepository) : super(AppLoadingState()) {
    on<GetAlbumEvent>((event, emit) async {
      emit(AppLoadingState());
      try {
        final albums = await _albumRepository.getAlbums();

        emit(AppLoadedState(albums: albums));
      } catch (e) {
        emit(AppErrorState(error: e.toString()));
      }
    });
  }
}
