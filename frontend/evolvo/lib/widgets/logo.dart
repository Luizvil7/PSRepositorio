import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:evolvo/theme/app_cores.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.tamanho = 50,
    this.mostrarFundo = true,
  });

  final double tamanho;
  final bool mostrarFundo;

  static const String _svg = r'''
<svg version="1.0" xmlns="http://www.w3.org/2000/svg" width="500px" height="500px" viewBox="120 90 260 300" preserveAspectRatio="xMidYMid meet">
 <g fill="#ffffff">
  <path d="M175 370.9 c-11 -1.8 -21 -6.8 -28.8 -14.3 -6 -5.7 -9 -10.4 -12.4 -19.1 -3 -7.9 -3.3 -26.1 -0.5 -37.5 7.2 -29.1 15.1 -44 31.8 -59.4 13.1 -12.1 26.8 -19.3 43.3 -22.7 8.3 -1.7 14.4 -1.9 65.9 -1.9 31.2 0 56.7 0.2 56.7 0.4 0 0.3 -5.3 7.6 -11.9 16.3 -12.6 16.8 -18.3 22.7 -25.3 26.5 -4.3 2.3 -4.8 2.3 -45.8 2.8 l-41.5 0.5 -7.3 2.9 c-8.2 3.3 -15.1 8.9 -19.3 15.5 -3.7 5.8 -7.4 21.5 -6.5 27.5 0.9 6.1 5.6 12.3 11.4 14.9 4.7 2.2 5.2 2.2 79.5 2.5 41.1 0.1 74.7 0.5 74.7 0.9 0 0.3 -2.4 3.6 -5.3 7.2 -2.9 3.6 -7.9 10 -11 14.2 -8.7 11.7 -16.8 18.3 -26.6 21.7 -4 1.3 -12.3 1.6 -60.1 1.8 -30.5 0.1 -58 -0.2 -61 -0.7z"/>
  <path d="M143.6 241.2 c-0.3 -0.6 -0.2 -2.2 0.3 -3.5 0.6 -1.4 2.2 -8.1 3.7 -14.9 1.4 -6.8 3 -13.9 3.4 -15.8 1.9 -8.3 3.1 -13.8 4.1 -19 7.1 -36.3 27.8 -60.4 62.1 -72.1 7.9 -2.7 15.9 -2.9 101.6 -3.2 41.6 -0.1 63.2 0.1 63.2 0.8 -0.1 0.6 -5.4 8 -11.8 16.5 -9.6 12.7 -12.8 16.2 -18.2 19.7 -3.5 2.4 -8 4.9 -10 5.5 -2.5 0.9 -20.1 1.4 -60.5 1.8 -52.2 0.5 -57.4 0.7 -62 2.4 -13.1 4.8 -22.5 13.1 -33.7 29.6 -20.9 30.9 -40.5 55 -42.2 52.2z"/>
 </g>
</svg>
''';

  @override
  Widget build(BuildContext context) {
    Widget logo = SvgPicture.string(
      _svg,
      width: tamanho * 0.8,
      height: tamanho * 0.8,
    );

    if (!mostrarFundo) {
      return logo;
    }

    return Container(
      width: tamanho,
      height: tamanho,
      decoration: BoxDecoration(
        color: AppCores.roxo,
        borderRadius: BorderRadius.circular(tamanho * .3),
      ),
      child: Center(child: logo),
    );
  }
}