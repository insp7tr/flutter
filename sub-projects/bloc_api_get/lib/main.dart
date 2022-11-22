import 'package:bloc_api_get/blocs/app/app_bloc.dart';
import 'package:bloc_api_get/models/album_model.dart';
import 'package:bloc_api_get/repos/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RepositoryProvider(
        create: (context) => AlbumRepository(),
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AppBloc(RepositoryProvider.of<AlbumRepository>(context))
            ..add(GetAlbumEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            if (state is AppLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AppLoadedState) {
              List<Album> albums = state.albums;
              return ListView.builder(
                itemCount: albums.length,
                itemBuilder: (_, index) {
                  return Text(albums[index].title);
                },
              );
            } else if (state is AppErrorState) {
              return Center(
                child: Text(state.error),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
