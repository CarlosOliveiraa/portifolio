import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMeSection extends StatefulWidget {
  final double width;
  final double height;

  const AboutMeSection({super.key, required this.width, required this.height});

  @override
  State<AboutMeSection> createState() => _AboutMeSectionState();
}

class _AboutMeSectionState extends State<AboutMeSection> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Center(
        child: Row(
          spacing: 100,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
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
            MouseRegion(
              onEnter: (_) => setState(() => _hovering = true),
              onExit: (_) => setState(() => _hovering = false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                transform: _hovering
                    ? (Matrix4.identity()..scale(1.05))
                    : Matrix4.identity(),
                // decoration: BoxDecoration(
                //   // borderRadius: BorderRadius.circular(16),
                //   shape: BoxShape.circle,
                //   boxShadow: [
                //     BoxShadow(
                //       color: Colors.black26,
                //       blurRadius: 20,
                //       // offset: Offset(0, 5),
                //     ),
                //   ],
                // ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/images/avatar_ghibly.png',
                    width: 500,
                    height: 500,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn().slide();
  }
}
