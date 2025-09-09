import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scrollController = ScrollController();

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
                child: Text(_sectionNames[index]),
              );
            }),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                width: size.width,
                height: sectionHeight,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Olá! 👋',
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.poppins(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: 'Sou ',
                              style: TextStyle(
                                color: Color(0xff21518F),
                              ), // cor neutra
                            ),
                            TextSpan(
                              text: 'Carlos Oliveira\n',
                              style: TextStyle(
                                color: Color(0xff26A8F9),
                              ), // cor destaque
                            ),
                            TextSpan(
                              text: 'Desenvolvedor Flutter',
                              style: TextStyle(
                                color: Color(0xff21518F),
                              ), // cor neutra
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        '💻 Transformo ideias em apps para web, mobile e desktop\n🚀 Sempre buscando criar experiências incríveis para os usuários',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          height: 1.3,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton.icon(
                            icon: Icon(
                              FontAwesomeIcons.github,
                              size: 24,
                              color: Color(0xff21518F),
                            ),
                            onPressed: () {},
                            label: Text(
                              'Git Hub',
                              style: TextStyle(color: Color(0xff21518F)),
                            ),
                          ),
                          TextButton.icon(
                            icon: Icon(
                              FontAwesomeIcons.linkedin,
                              size: 24,
                              color: Color(0xff21518F),
                            ),
                            onPressed: () {},
                            label: Text(
                              'Linkedin',
                              style: TextStyle(color: Color(0xff21518F)),
                            ),
                          ),
                          TextButton.icon(
                            icon: Icon(
                              FontAwesomeIcons.instagram,
                              size: 24,
                              color: Color(0xff21518F),
                            ),
                            onPressed: () {},
                            label: Text(
                              'Instagram',
                              style: TextStyle(color: Color(0xff21518F)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ).animate().fadeIn().slide(curve: Curves.easeInOut),

              Container(
                width: size.width,
                height: sectionHeight,
                color: Colors.yellow,
                child: const Center(child: Text('Experiência')),
              ),
              Container(
                width: size.width,
                height: sectionHeight,
                color: Colors.blue,
                child: const Center(child: Text('Contatos')),
              ),
              Container(
                width: size.width,
                height: sectionHeight,
                color: Colors.green,
                child: const Center(child: Text('Contatos')),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
