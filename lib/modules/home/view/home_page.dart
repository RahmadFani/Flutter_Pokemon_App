part of '../home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(GettingListGeneration()),
      child: const Scaffold(
        body: HomeView(),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static List<Widget> tabView = [
    const _GenerationList(),
    const _FavoriteList(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.currentTab != current.currentTab,
      builder: (context, state) {
        return BackgroundWidget(
          opacity: .5,
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: tabView.elementAt(state.currentTab),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButtonIconWidget(
                        onPressed: () {
                          context
                              .read<HomeBloc>()
                              .add(ChangeCurrentTabHome(value: 0));
                        },
                        isOutline: !(state.currentTab == 0),
                        icon: Image.asset('assets/icons/pokeball.png'),
                        label: const Text(
                          'EXPLORE',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      CustomButtonIconWidget(
                        onPressed: () {
                          context
                              .read<HomeBloc>()
                              .add(ChangeCurrentTabHome(value: 1));
                        },
                        isOutline: !(state.currentTab == 1),
                        icon: Image.asset('assets/icons/heart.png'),
                        label: const Text(
                          'FAVORITE',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
