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

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      opacity: .5,
      child: SafeArea(
        child: Column(
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
                  color: Colors.red,
                )),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButtonIconWidget(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/pokeball.png'),
                    label: const Text(
                      'EXPLORE',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  CustomButtonIconWidget(
                    onPressed: () {},
                    isOutline: true,
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
  }
}
