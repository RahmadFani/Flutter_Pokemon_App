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
      )..add(
          GetGenerationDetail(),
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
    return BlocBuilder<GenerationDetailBloc, GenerationDetailState>(
      buildWhen: (previous, current) => previous.loading != current.loading,
      builder: (context, state) {
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
                      clipBehavior: Clip.antiAlias,
                      duration: 600.ms,
                      curve: Curves.easeOutCirc,
                      height: value ? 0 : context.getSize.height * .83,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(-0.28, -0.96),
                          end: Alignment(0.28, 0.96),
                          colors: [Colors.white, Color(0xFFE6F9E8)],
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: state.loading
                          ? const Center(
                              child: CircularProgressIndicator.adaptive(),
                            )
                          : const _ListSpecies(),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
