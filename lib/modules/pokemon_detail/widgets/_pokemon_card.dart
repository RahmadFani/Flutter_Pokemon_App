part of '../pokemon_detail.dart';

class _PokemonCard extends StatelessWidget {
  const _PokemonCard({required this.state});

  final PokemonDetailState state;

  @override
  Widget build(BuildContext context) {
    final pokemon = state.pokemon!;
    return Stack(
      key: const Key('_PokemonCard_Detail'),
      fit: StackFit.expand,
      children: [
        Positioned(
          left: 16,
          right: 16,
          top: 200,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white.withOpacity(.6),
            ),
            width: double.infinity,
            constraints:
                BoxConstraints(maxHeight: context.getSize.height * .55),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    state.name.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF242424),
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    pokemon.types.map((e) => e.type.name).join(' / '),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF9B9B9E),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  _CardTab(
                    pokemon: pokemon,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<FavoritesBloc, FavoritesState>(
                    builder: (context, favorites) {
                      bool isFavorite = favorites.favorites
                          .where((element) => element.url == state.url)
                          .isNotEmpty;
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                isFavorite ? const Color(0xffAA184C) : null),
                        onPressed: () {
                          context.read<FavoritesBloc>().add(
                                SetFavorite(
                                  favorite: Favorite(
                                      name: state.name,
                                      url: state.url,
                                      pokemon: pokemon),
                                ),
                              );
                        },
                        child:
                            Text(isFavorite ? 'UNFAVORITE' : 'ADD TO FAVORITE'),
                      );
                    },
                  ),
                ]),
              ),
            ),
          ),
        ).animate().fadeIn(
              delay: 900.milliseconds,
            ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Image.network(
            state.imageUrl,
            height: 250,
            width: 250,
            fit: BoxFit.cover,
          ),
        ).animate().scale(delay: 500.milliseconds)
      ],
    );
  }
}
