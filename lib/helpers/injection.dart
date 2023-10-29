import 'package:esensi_solusi_buana_test/modules/favorites/bloc/favorites_bloc.dart';
import 'package:esensi_solusi_buana_test/router/router.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

GetIt getIt = GetIt.I;

class Injection {
  static init() {
    // inject Router
    final router = MyRouter.init();
    getIt.registerLazySingleton<GoRouter>(() => router);

    // inject bloc favorite
    getIt.registerLazySingleton<FavoritesBloc>(() => FavoritesBloc());
  }
}
