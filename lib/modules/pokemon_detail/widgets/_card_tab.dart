part of '../pokemon_detail.dart';

class _CardTab extends StatefulWidget {
  const _CardTab({required this.pokemon});

  final PokemonDetail pokemon;

  @override
  State<_CardTab> createState() => __CardTabState();
}

class __CardTabState extends State<_CardTab> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _tabButton,
        const SizedBox(
          height: 32,
        ),
        if (currentTab == 0) _aboutBody else _baseState
      ],
    );
  }

  Widget get _aboutBody => SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _tableText(
              'Height',
              '${widget.pokemon.height.toString()} m',
            ),
            const SizedBox(
              height: 14,
            ),
            _tableText(
              'Weight',
              '${widget.pokemon.weight.toString()} Kg',
            ),
            const SizedBox(
              height: 14,
            ),
            _tableText(
              'Abilities',
              widget.pokemon.abilities.map((e) => e.ability.name).join(', '),
            ),
          ],
        ),
      );

  Widget _tableText(String title, String value) => Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFF242424),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          const Text(':'),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            flex: 2,
            child: Text(
              value,
              style: const TextStyle(
                color: Color(0xFF242424),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      );

  Widget get _baseState {
    var pokeStats =
        widget.pokemon.stats.where((element) => element.stat.name != 'hp');
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          _tableText(
            'Hp',
            '${widget.pokemon.stats[0].baseStat} HP',
          ),
          ...pokeStats.map((e) => Padding(
                padding: const EdgeInsets.only(top: 14),
                child: _tableBar(e.stat.name, e.baseStat),
              ))
        ],
      ),
    );
  }

  Widget _tableBar(String title, int value) => Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFF242424),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          const Text(':'),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 20,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    children: [
                      Animate().toggle(
                        duration: 600.milliseconds,
                        builder: (context, toggle, child) {
                          return AnimatedContainer(
                            duration: 600.milliseconds,
                            height: 20,
                            width: toggle
                                ? 0
                                : constraints.maxWidth *
                                    (min(value, 100) / 100),
                            child: DecoratedBox(
                                decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: getColorBar(value),
                            )),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      );

  Color getColorBar(int value) {
    if (value >= 80) {
      return primaryColor;
    }
    if (value >= 50) {
      return const Color(0xffFFCE50);
    }
    return const Color(0xffFF7D94);
  }

  Widget get _tabButton => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: _button(
                isActive: currentTab == 0,
                label: 'About',
                onPressed: () {
                  setState(() {
                    currentTab = 0;
                  });
                }),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: _button(
                isActive: currentTab == 1,
                label: 'Base State',
                onPressed: () {
                  setState(() {
                    currentTab = 1;
                  });
                }),
          ),
        ],
      );

  Widget _button(
      {bool isActive = false, void Function()? onPressed, String label = ''}) {
    if (isActive) {
      return ElevatedButton(onPressed: onPressed, child: Text(label));
    }
    return OutlinedButton(onPressed: onPressed, child: Text(label));
  }
}
