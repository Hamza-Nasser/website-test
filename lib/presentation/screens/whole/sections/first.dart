import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:website_test/presentation/widgets/text_reveal.dart';

class FirstSection extends StatefulWidget {
  const FirstSection({super.key});

  @override
  State<FirstSection> createState() => _FirstSectionState();
}

class _FirstSectionState extends State<FirstSection>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> textRevealAnimation;
  late Animation<double> textOpacityAnimation;
  late Animation<double> descriptionAnimation;
  late Animation<double> smallImageRevealAnimation;
  late Animation<double> smallImageOpacityAnimation;
  late Animation<double> navBarOpacityAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1700),
      reverseDuration: const Duration(milliseconds: 370),
    );
    textRevealAnimation = Tween<double>(begin: 100, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeInOut),
      ),
    );
    textOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeInOut),
      ),
    );
    descriptionAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.5, curve: Curves.easeInOut),
      ),
    );
    smallImageRevealAnimation = Tween<double>(begin: 180, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 0.7, curve: Curves.easeInOut),
      ),
    );
    smallImageOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 0.8, curve: Curves.easeInOut),
      ),
    );
    navBarOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.8, 1, curve: Curves.easeInOut),
      ),
    );
    Future.delayed(const Duration(milliseconds: 1000), () {
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 70),
      height: 920,
      child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeTransition(
                        opacity: textOpacityAnimation,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Text(
                            "Logo",
                            style: GoogleFonts.montserrat(),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextReveal(
                                maxHeight: 90,
                                controller: _controller,
                                textRevealAnimation: textRevealAnimation,
                                textOpacityAnimation: textOpacityAnimation,
                                child: Text(
                                  "Healthy & Tasty",
                                  style: GoogleFonts.quicksand(
                                    fontSize: 50,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              TextReveal(
                                maxHeight: 90,
                                controller: _controller,
                                textRevealAnimation: textRevealAnimation,
                                textOpacityAnimation: textOpacityAnimation,
                                child: Text(
                                  "Food",
                                  style: GoogleFonts.quicksand(
                                    fontSize: 50,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              FadeTransition(
                                opacity: descriptionAnimation,
                                child: Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                                  style: GoogleFonts.quicksand(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 40),
                              FadeTransition(
                                opacity: descriptionAnimation,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 15,
                                        color: Colors.black12,
                                      )
                                    ],
                                  ),
                                  child: SizeTransition(
                                    sizeFactor: descriptionAnimation,
                                    axis: Axis.horizontal,
                                    axisAlignment: -1,
                                    child: Row(
                                      children: [
                                        const Flexible(
                                          child: TextField(
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                                  EdgeInsets.all(12),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius.zero,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 49,
                                          height: 49,
                                          color: Colors.red,
                                          child: const Icon(
                                            Icons.search,
                                            color: Colors.black38,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 40),
                              Flexible(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 120,
                                      width: 180,
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(1),
                                            child: Image.network(
                                              "https://images.unsplash.com/photo-1609618298169-425a11118f24?ixlib-rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWd1fHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80",
                                              fit: BoxFit.cover,
                                              width: 180,
                                            ),
                                          ),
                                          Container(
                                            height: 120,
                                            width:
                                                smallImageRevealAnimation.value,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Flexible(
                                      child: FadeTransition(
                                        opacity: smallImageOpacityAnimation,
                                        child: Text(
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's.",
                                          style: GoogleFonts.quicksand(
                                            fontSize: 16,
                                            height: 1.5,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 130),
                const Expanded(child: FirstPageImage()),
                SizedBox(
                  height: 500,
                  width: 100,
                  child: FadeTransition(
                    opacity: navBarOpacityAnimation,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 80,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.menu),
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: ['Home', 'About', 'Offers', 'Accounts']
                                .map<Widget>((title) {
                              return RotatedBox(
                                quarterTurns: 1,
                                child: Text(
                                  title,
                                  style: GoogleFonts.quicksand(
                                    fontSize: 14,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}

class FirstPageImage extends StatefulWidget {
  const FirstPageImage({super.key});

  @override
  State<FirstPageImage> createState() => _FirstPageImageState();
}

class _FirstPageImageState extends State<FirstPageImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 775));
    _animation = Tween<double>(begin: 920, end: 0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://images.unsplash.com/photo-1551879400-111a9087cd86?ixlib-rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHxfGVufDB8fHx8&auto=format&fit=crop&w=1974&q-80",
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          Future.delayed(const Duration(milliseconds: 370), () {
            if (_controller.isDismissed) {
              _controller.forward();
            }
          });
          return AnimatedBuilder(
              animation: _animation,
              child: child,
              builder: (context, child) {
                return Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      height: 920,
                      width: double.infinity,
                      child: child,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: _animation.value,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                    )
                  ],
                );
              });
        }
        return const SizedBox();
      },
    );
  }
}
