part of '../pokemon_detail.dart';

class _PokemonCard extends StatelessWidget {
  const _PokemonCard({required this.state});

  final PokemonDetailState state;

  @override
  Widget build(BuildContext context) {
    final pokemon = state.pokemon!;
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          left: 16,
          right: 16,
          top: 200,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
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
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('ADD TO FAVORITE'),
                  ),
                ]),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Image.network(
            state.imageUrl,
            height: 280,
            width: 280,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
