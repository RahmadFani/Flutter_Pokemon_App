part of '../generation_detail.dart';

class _Region extends StatelessWidget {
  const _Region({required this.detail});
  final GenerationDetail detail;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 50,
          decoration: BoxDecoration(
              color: secondaryColor, borderRadius: BorderRadius.circular(40)),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icons/pokeball.png'),
              const SizedBox(
                width: 6,
              ),
              const Text(
                'REGION : ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF242424),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                  height: 0,
                ),
              ),
              Text(
                detail.mainRegion.name.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF242424),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
