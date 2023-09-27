import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _slides = <SlideInfo>[
  SlideInfo(
      title: "Onboarding",
      caption:
          "Welcome to QuickDeliver, your go-to mobile delivery app for all your needs. We are here to make your life easier by bringing your favorite items right to your doorstep, whether it's food, groceries, or other essentials. Let's take a quick tour to get you started.",
      imageUrl: "assets/images/1.png"),
  SlideInfo(
      title: "Discover and Order",
      caption:
          "Discover a world of convenience at your fingertips. With QuickDeliver, you can browse through a wide range of local restaurants, stores, and businesses. From mouthwatering dishes to daily essentials, we've got it all. Simply select your desired items, customize your order, and add them to your cart.",
      imageUrl: "assets/images/2.png"),
  SlideInfo(
      title: "Fast and Reliable Delivery",
      caption:
          "We understand that speed matters. Once you've placed your order, our dedicated team of delivery experts will ensure your items are picked up promptly and delivered right to your doorstep. You can track your delivery in real-time, so you'll always know when to expect your package.",
      imageUrl: "assets/images/3.png"),
];

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(
      {required this.title, required this.caption, required this.imageUrl});
}

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final pageViewControler = PageController();
  bool _showButton = false;
  double indexController = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageViewControler.addListener(() {
      indexController = pageViewControler.page ?? 0;
      setState(() {
        if (indexController >= (_slides.length - 1.25)) {
          _showButton = true;
          return;
        } else if (indexController <= (_slides.length - 2)) _showButton = false;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageViewControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Tutorial Screen"),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        return SingleChildScrollView(
          child: Container(
            height: orientation== Orientation.landscape ? 1200 : screenSize.height*.90,
            child: Stack(children: [
              PageView(
                  controller: pageViewControler,
                  // physics: const BouncingScrollPhysics(),
                  children: [
                    ..._slides.map((slide) => _Slide(
                        title: slide.title,
                        caption: slide.caption,
                        imageUrl: slide.imageUrl)),
                  ]),
              if (!_showButton)
                Positioned(
                    top: 20,
                    right: 20,
                    child: TextButton(
                      child: const Text("Skip"),
                      onPressed: () => context.pop(),
                    )),
              _bottonButton(),
              Positioned(
                  left: 20,
                  right: 20,
                  bottom: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ..._slides.asMap().entries.map((entry) {
                        return (entry.key ==indexController.ceil() )
                            ? const Icon(
                          Icons.circle,
                          size: 20,
                        )
                            : const Icon(
                          Icons.circle_outlined,
                          size: 15,
                        );
                      }),
                    ],
                  )),
            ]),
          ),
        );
      },),
    );
  }

  Widget _bottonButton() {
    return Positioned(
        bottom: 20,
        right: 20,
        child: FilledButton(
            child: Text(!_showButton ? "Continue" : "Begin"),
            onPressed: () => _showButton
                ? context.pop()
                : pageViewControler.nextPage(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeOut)));
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {super.key,
      required this.title,
      required this.caption,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodyLarge;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageUrl, fit: BoxFit.fitWidth,),
          const SizedBox(height: 10),
          Text(
            title,
            style: titleStyle,
          ),
          const SizedBox(height: 10),
          Text(
            caption,
            style: captionStyle,
          ),
        ],
      ),
    );
  }
}
