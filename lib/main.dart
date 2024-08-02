import 'package:art_galery_app_ui/constants/colors.dart';
import 'package:art_galery_app_ui/screens/image_detail.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(const ArtGalleryApp());
}

class ArtGalleryApp extends StatelessWidget {
  const ArtGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WidgetDetail(),
    );
  }
}

class WidgetDetail extends StatefulWidget {
  const WidgetDetail({super.key});

  @override
  State<WidgetDetail> createState() => _WidgetDetailState();
}

class _WidgetDetailState extends State<WidgetDetail> {
  int _selectedIndex = 0;

  final List<String> listImages = [
    'lib/assets/images/list-image-1.png',
    'lib/assets/images/list-image-2.png',
    'lib/assets/images/list-image-3.png',
    'lib/assets/images/list-image-1.png',
    'lib/assets/images/list-image-2.png',
    'lib/assets/images/list-image-3.png',
  ];

  final List<String> imageNames = [
    'Oil paintings',
    'Museums',
    'Wall arts',
    'Oil paintings',
    'Museums',
    'Wall arts'
  ];

  void _navigateImageDetailScreen(String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageDetail(imagePath: imagePath),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(backgroundColor),
      bottomNavigationBar: Container(
        height: 70,
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          child: CurvedNavigationBar(
            height: 60,
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: Colors.orange,
            color: Colors.white,
            animationDuration: const Duration(milliseconds: 300),
            index: _selectedIndex,
            items: <Widget>[
              Image(
                image: const AssetImage("lib/assets/images/compas_icon.png"),
                color: _selectedIndex == 0 ? Colors.white : Colors.grey,
              ),
              Image(
                image: const AssetImage("lib/assets/images/tabs_icon.png"),
                color: _selectedIndex == 1 ? Colors.white : Colors.grey,
              ),
              Icon(
                Icons.add,
                size: 28,
                color: _selectedIndex == 2 ? Colors.white : Colors.grey,
              ),
              Image(
                image: const AssetImage("lib/assets/images/pen_icon.png"),
                color: _selectedIndex == 3 ? Colors.white : Colors.grey,
              ),
              Image(
                image: const AssetImage("lib/assets/images/person_icon.png"),
                color: _selectedIndex == 4 ? Colors.white : Colors.grey,
              ),
            ],
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 68.0),
                    child: Text(
                      "Illustrations",
                      style: TextStyle(
                        fontFamily: "Tech",
                        fontSize: 34,
                        fontWeight: FontWeight.w300,
                        color: HexColor(primaryColor),
                      ),
                    ),
                  ),
                  Text(
                    "CURATED GALLERIES",
                    style: TextStyle(
                      fontFamily: "Tech",
                      fontSize: 14,
                      fontWeight: FontWeight.w100,
                      color: HexColor(secondaryColor),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: listImages.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => _navigateImageDetailScreen(
                              "lib/assets/images/cover.png"),
                          child: SizedBox(
                            width: 105,
                            child: Column(
                              children: [
                                Image.asset(
                                  listImages[index],
                                  fit: BoxFit.cover,
                                  height: 80,
                                ),
                                Text(
                                  imageNames[index],
                                  style: TextStyle(
                                    fontFamily: "Tech",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w200,
                                    color: HexColor(primaryColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: InkWell(
                      onTap: () => _navigateImageDetailScreen(
                          "lib/assets/images/cover.png"),
                      child: const Image(
                        image: AssetImage("lib/assets/images/first_image.png"),
                        width: 500,
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () => _navigateImageDetailScreen(
                                "lib/assets/images/cover.png"),
                            child: const Image(
                              image: AssetImage(
                                  "lib/assets/images/second_image.png"),
                            ),
                          ),
                          InkWell(
                            onTap: () => _navigateImageDetailScreen(
                                "lib/assets/images/cover.png"),
                            child: const Image(
                              image: AssetImage(
                                  "lib/assets/images/fourth_image.png"),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () => _navigateImageDetailScreen(
                            "lib/assets/images/cover.png"),
                        child: const Image(
                          image:
                              AssetImage("lib/assets/images/third_image.png"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 28,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.orange,
                size: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
