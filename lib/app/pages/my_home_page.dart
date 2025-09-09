import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifolio/app/widgets/sections/about_me_section.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scrollController = ScrollController();

  bool _hovering = false;

  final List<String> _sectionNames = [
    'Sobre',
    'Experiência',
    'Contatos',
    'Nova',
  ];

  // Calcula a posição baseada no índice
  void _jumpToSection(int index, double sectionHeight) {
    _scrollController.animateTo(
      sectionHeight * index,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final sectionHeight = size.height; // cada seção ocupa a altura da tela

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            leadingWidth: 100,
            leading: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: SvgPicture.asset(
                'assets/images/svg/Logo.svg',
                height: 200,
              ),
            ),
            centerTitle: false,
            pinned: true,
            title: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Carlos Oliveira',
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    color: const Color(0xff2E3541),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Flutter Dev',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: const Color(0xff2E3541),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            actions: List.generate(_sectionNames.length, (index) {
              return TextButton(
                onPressed: () => _jumpToSection(index, sectionHeight),
                child: Text(
                  _sectionNames[index],
                  style: TextStyle(color: Color(0xff21518F)),
                ),
              );
            }),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              AboutMeSection(width: size.width, height: sectionHeight),

              Container(
                width: size.width,
                height: sectionHeight,
                color: Colors.yellow,
                child: const Center(child: Text('Experiência')),
              ).animate().fadeIn().slide(),
              Container(
                width: size.width,
                height: sectionHeight,
                color: Colors.blue,
                child: const Center(child: Text('Contatos')),
              ).animate().fadeIn().slide(),
              Container(
                width: size.width,
                height: sectionHeight,
                color: Colors.green,
                child: const Center(child: Text('Contatos')),
              ).animate().fadeIn().slide(),
            ]),
          ),
        ],
      ),
    );
  }
}
