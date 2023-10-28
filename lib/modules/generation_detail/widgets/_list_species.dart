part of '../generation_detail.dart';

class _ListSpecies extends StatelessWidget {
  const _ListSpecies();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenerationDetailBloc, GenerationDetailState>(
      buildWhen: (previous, current) => previous.detail != current.detail,
      builder: (context, state) {
        if (state.detail == null) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
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
          );
        }
        final detail = state.detail!;
        return Column(
          children: [
            _Region(
              detail: detail,
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    sliver: SliverGrid.extent(
                      childAspectRatio: .78,
                      maxCrossAxisExtent: context.getSize.width * .85,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      children: detail.pokemons.map((pokemon) {
                        return _PokeCard(pokemon: pokemon);
                      }).toList(),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
