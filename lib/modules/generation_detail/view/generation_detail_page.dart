part of '../generation_detail.dart';

class GenerationDetailPage extends StatelessWidget {
  const GenerationDetailPage({
    super.key,
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenerationDetailBloc(
        name: name,
        url: url,
      ),
      child: const Scaffold(
        body: GenerationDetailView(),
      ),
    );
  }
}

class GenerationDetailView extends StatelessWidget {
  const GenerationDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final detail = context.read<GenerationDetailBloc>();
    return BackgroundWidget(
      opacity: .6,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: SafeArea(
              bottom: false,
              child: AppBarTransparant(
                title: detail.name.toUpperCase(),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Animate().toggle(
                duration: 800.ms,
                builder: (context, value, child) {
                  return AnimatedContainer(
                    duration: 600.ms,
                    curve: Curves.easeOutCirc,
                    height: value ? 0 : context.getSize.height * .83,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }
}
