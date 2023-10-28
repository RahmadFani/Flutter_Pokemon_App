part of '../pokemon_detail.dart';

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
    return const Scaffold(
      body: PokemonDetailView(),
    );
  }
}

class PokemonDetailView extends StatelessWidget {
  const PokemonDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackgroundScanWidget(child: Placeholder());
  }
}
