//Main providers
import 'package:ecommerce_app/core/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [...remoteProviders];

//Independent Providers
List<SingleChildWidget> remoteProviders = [
  ChangeNotifierProvider(create: (_) => AuthProvider())
];
