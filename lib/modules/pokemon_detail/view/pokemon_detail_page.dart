part of '../pokemon_detail.dart';

class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({super.key});

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
