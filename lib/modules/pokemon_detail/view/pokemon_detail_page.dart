part of '../pokemon_detail.dart';

GetIt getIt = GetIt.I;

class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({
    super.key,
    required this.name,
    required this.url,
    this.pokemons = const [],
  });

  final String name;
  final String url;
  final List<PokemonSpesies> pokemons;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PokemonDetailBloc>(
          create: (context) => PokemonDetailBloc(
            name: name,
            url: url,
            pokemons: pokemons,
          )..add(GetPokemonDetail()),
        ),
        BlocProvider<FavoritesBloc>.value(
          value: getIt<FavoritesBloc>(),
        )
      ],
      child: const Scaffold(
        body: PokemonDetailView(),
      ),
    );
  }
}

class PokemonDetailView extends StatelessWidget {
  const PokemonDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailBloc, PokemonDetailState>(
      builder: (context, state) {
        return BackgroundScanWidget(
          child: Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).padding.top + kToolbarHeight,
                left: 0,
                right: 0,
                bottom: 0,
                child: state.errorMessage.isNotEmpty && state.pokemon == null
                    ? _errorBody(context, state)
                    : state.pokemon == null
                        ? const SizedBox.shrink()
                        : _PokemonCard(
                            state: state,
                          ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: SafeArea(
                  child: AppBarTransparant(
                    title: '',
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _errorBody(BuildContext context, PokemonDetailState state) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: context.getSize.width * .7,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.network_check_outlined,
                size: 40,
              ),
              Text(
                state.errorMessage.isEmpty ? '-' : state.errorMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
