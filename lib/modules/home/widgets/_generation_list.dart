part of '../home.dart';

class _GenerationList extends StatelessWidget {
  const _GenerationList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.loading != current.loading ||
          current.generations != previous.generations,
      builder: (context, state) {
        return Column(
          children: [
            const Flexible(
              flex: 1,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'EXPLORE POKEMON',
                  textAlign: TextAlign.center,
                  style: TextStyle(
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
              flex: 5,
              child: Container(
                child: state.loading
                    ? _listLoading
                    : _listGenerationBody(context, state),
              ),
            )
          ],
        );
      },
    );
  }

  Widget get _listLoading => const Center(
        child: CircularProgressIndicator.adaptive(),
      );

  Widget _listGenerationBody(BuildContext context, HomeState state) {
    return ListView.builder(
        itemCount: state.generations.length,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        itemBuilder: (_, index) {
          final generation = state.generations[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                onPressed: () {},
                child: Text(
                  generation.name.toUpperCase(),
                ),
              ),
            ),
          ).animate().scale(delay: (index * 200).milliseconds);
        });
  }
}
