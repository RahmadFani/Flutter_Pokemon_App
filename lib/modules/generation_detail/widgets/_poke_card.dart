part of '../generation_detail.dart';

class _PokeCard extends StatelessWidget {
  const _PokeCard({required this.pokemon});

  final PokemonSpesies pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            pokemon.imageUrl,
            fit: BoxFit.cover,
          )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              pokemon.name,
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
    );
  }
}
