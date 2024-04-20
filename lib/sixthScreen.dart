import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SixthScreen extends StatelessWidget {
  final String text;

  SixthScreen({super.key, required this.text});

  String formatText(String text) {
    List<String> harmfulIngredients = [
      'excellence',
      'Diethanolamine',
      'Fragrance',
      'Latex',
      'Parabens'
    ]; // Define harmful ingredients
    List<String> words = text.split(' ').map((word) => word.trim()).toList();
    List<String> lines = [];
    String line = '';

    for (String word in words) {
      if ((line + ' ' + word).length > 20) {
        lines.add(line.trim());
        line = '';
      }
      line += (line.isNotEmpty ? ', ' : '') + word;
    }
    lines.add(line.trim()); // Add the last line

    // Check for harmful ingredients
    List<String> detectedIngredients = [];
    for (String ingredient in harmfulIngredients) {
      if (text.contains(ingredient)) {
        detectedIngredients.add(ingredient);
      }
    }

    if (detectedIngredients.isNotEmpty) {
      lines.add(
          'Harmful ingredients detected: ${detectedIngredients.join(", ")}');
    } else {
      //Navigator.push(context as BuildContext,
      //    MaterialPageRoute(builder: ((context) => SixthScreen())));
      lines.add('Not harmful!');
    }

    return lines.join('\n');
  }

  @override
  Widget build(BuildContext context) {
    String formattedText = formatText(text);
    bool hasHarmfulIngredients =
        formattedText.contains('Harmful ingredients detected');
    if (!hasHarmfulIngredients) {
      // Future.delayed(Duration.zero, () {
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => SixthScreen()));
      // });
    }
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Product Details',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          // Align(
          //     alignment: Alignment.topLeft,
          //     child: Padding(
          //       padding: const EdgeInsets.only(left: 20),
          //       child: Row(
          //         children: [
          //           Image.asset("assets/images/Group 17787.png"),
          //           SizedBox(
          //             width: 15,
          //           ),
          //           Container(
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text(
          //                   'Declare',
          //                   style: TextStyle(
          //                       fontSize: 16,
          //                       fontWeight: FontWeight.w600,
          //                       color: Colors.black),
          //                 ),
          //                 Text(
          //                   'Skin Cream',
          //                   style: TextStyle(
          //                       fontSize: 14,
          //                       fontWeight: FontWeight.w500,
          //                       color: Colors.black),
          //                 ),
          //                 SizedBox(
          //                   height: 5,
          //                   width: 10,
          //                 ),
          //                 Text(
          //                   'This water-free solution contains\n a 5% concentration of retinoid',
          //                   style: TextStyle(
          //                       fontSize: 10,
          //                       fontWeight: FontWeight.w500,
          //                       color: Colors.black),
          //                 ),
          //                 SizedBox(
          //                   height: 5,
          //                 ),
          //                 Text('₹699',
          //                     style: TextStyle(
          //                         fontSize: 15,
          //                         fontWeight: FontWeight.w700,
          //                         color: Colors.black),
          //                     textAlign: TextAlign.left),
          //               ],
          //             ),
          //           ),
          //         ],
          //       ),
          //     )),
          SizedBox(
            height: 20,
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'The ingredients used in this are xxxx,xxxx,xxxx.These may cause you:',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.green),
                ),
              )),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 15,
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Check out better supplements for a healthy skin:',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 16 / 9,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                autoPlay: false,
              ),
              items: [
                Card(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .center, // Center content horizontally
                      children: [
                        Container(
                          height:
                              200, // Adjust the height of the image container
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            image: DecorationImage(
                              image: AssetImage("assets/images/BeYou.jpg"),
                              fit: BoxFit
                                  .cover, // Use cover to maintain aspect ratio
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(
                              10.0), // Increase padding for better spacing
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Combo Pack',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                  height: 5), // Add space between text sections
                              Text(
                                'This water-free solution contains a 5% concentration of retinoid',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                  height: 5), // Add space between text sections
                              Row(
                                children: [
                                  Text(
                                    '₹999',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 30),
                                  // Add space between text and button
                                  GestureDetector(
                                    onTap: () {
                                      launchURL(
                                          'https://www.schimiggy.com/beyou-review-good-clean-skincare/'); // Replace with your desired URL
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(12.0),
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Text(
                                        'Visit',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                  )
                                  // ElevatedButton(
                                  //   onPressed: () {
                                  //     // Add onPressed action here
                                  //     print("hhhhhhhhhhhhhhhhhhhhhhhh");
                                  //     const url =
                                  //         'https://www.schimiggy.com/beyou-review-good-clean-skincare/';
                                  //     launchUrl(url as Uri);
                                  //   },
                                  //   child: Text(
                                  //     'View Link',
                                  //     style: TextStyle(
                                  //       color: Colors.white,
                                  //     ),
                                  //   ),
                                  //   style: ButtonStyle(
                                  //       backgroundColor:
                                  //           MaterialStatePropertyAll(
                                  //               Colors.black)),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .center, // Center content horizontally
                      children: [
                        Container(
                          height:
                              200, // Adjust the height of the image container
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            image: DecorationImage(
                              image: AssetImage("assets/images/image 7.png"),
                              fit: BoxFit
                                  .cover, // Use cover to maintain aspect ratio
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(
                              10.0), // Increase padding for better spacing
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Granactive Retinoid 5%',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                  height: 5), // Add space between text sections
                              Text(
                                'This water-free solution contains a 5% concentration of retinoid',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                  height: 5), // Add space between text sections
                              Row(
                                children: [
                                  Text(
                                    '₹699',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          30), // Add space between text and button
                                  ElevatedButton(
                                    onPressed: () {
                                      // Add onPressed action here
                                    },
                                    child: Text(
                                      'View Link',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.black)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .center, // Center content horizontally
                      children: [
                        Container(
                          height:
                              200, // Adjust the height of the image container
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            image: DecorationImage(
                              image: AssetImage("assets/images/image 7.png"),
                              fit: BoxFit
                                  .cover, // Use cover to maintain aspect ratio
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(
                              10.0), // Increase padding for better spacing
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Granactive Retinoid 5%',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                  height: 5), // Add space between text sections
                              Text(
                                'This water-free solution contains a 5% concentration of retinoid',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                  height: 5), // Add space between text sections
                              Row(
                                children: [
                                  Text(
                                    '₹699',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          30), // Add space between text and button
                                  ElevatedButton(
                                    onPressed: () {
                                      // Add onPressed action here
                                    },
                                    child: Text(
                                      'View Link',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.black)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
        ])));
  }

  void launchURL(String s) {}
}
