part of '../home.dart';

class _FavoriteList extends StatelessWidget {
  const _FavoriteList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: SafeArea(
                child: Text(
                  'FAVORITE (${state.favorites.length})',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                    letterSpacing: 0.16,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                decoration: ShapeDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment(-0.28, -0.96),
                    end: Alignment(0.28, 0.96),
                    colors: [Colors.white, Color(0xFFE6F9E8)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: state.favorites.isEmpty
                    ? const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Empty List Favorite'),
                        ],
                      )
                    : CustomScrollView(
                        slivers: [
                          SliverPadding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            sliver: SliverGrid.extent(
                              childAspectRatio: .78,
                              maxCrossAxisExtent: context.getSize.width * .5,
                              crossAxisSpacing: 14,
                              mainAxisSpacing: 14,
                              children: state.favorites.map((fav) {
                                return _PokeCard(
                                  fav: fav,
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
              ),
            ).animate().scale()
          ],
        );
      },
    );
  }
}
