part of '../home.dart';

class _PokeCard extends StatelessWidget {
  const _PokeCard({required this.fav});

  final Favorite fav;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: const Key('_pokeCardTapToPokemonDetail'),
      onTap: () {
        PokemonDetailRoute(
          name: fav.name,
          url: fav.url,
          $extra: [],
        ).push(context);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color(0x1E6F8BA5),
                blurRadius: 10,
                offset: Offset(0, 6),
                spreadRadius: 0,
              )
            ],
            borderRadius: BorderRadius.circular(
              10,
            )),
        child: Column(
          children: [
            Expanded(
                child: Image.network(
              fav.imageUrl,
              fit: BoxFit.cover,
            )),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                fav.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF242424),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0,
                  letterSpacing: 0.16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
