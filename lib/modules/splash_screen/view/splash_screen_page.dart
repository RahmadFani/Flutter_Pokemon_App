part of '../splash_screen.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashScreenView(),
    );
  }
}

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/pokemon/ball.png',
                        width: 150,
                        height: 150,
                      )
                    ],
                  ),
                ).animate().scale(duration: 400.milliseconds),
                Animate().toggle(
                  duration: 600.ms,
                  builder: (_, value, __) => AnimatedContainer(
                    duration: 600.ms,
                    height: value ? 0 : 80,
                    child: Image.asset(
                      'assets/pokemon/logo-text.png',
                    ).animate(
                      onComplete: (controller) {
                        const HomeRoute().go(context);
                      },
                    ).fadeIn(
                      delay: 700.milliseconds,
                      duration: 600.milliseconds,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Title ESB
          _titleEsb
        ],
      ),
    );
  }

  Widget get _titleEsb => const Positioned(
        bottom: 29,
        left: 0,
        right: 0,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'Flutter ESB Technical Test',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w300,
              height: 0.08,
              letterSpacing: -0.17,
            ),
          ),
        ),
      );
}
