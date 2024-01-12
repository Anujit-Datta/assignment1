import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> products = [
    {
      'name': 'Pullover',
      'size': 'L',
      'color': 'Black',
      'price': 51,
      'image': 'asset/pullover.png',
    },
    {
      'name': 'T-Shirt',
      'size': 'L',
      'color': 'Grey',
      'price': 30,
      'image': 'asset/tshirt.png',
    },
    {
      'name': 'Sport Dress',
      'size': 'M',
      'color': 'Black',
      'price': 43,
      'image': 'asset/sportdress.png'
    }
  ];
  List<int> quantity = [1, 1, 1];
  int total = 0;

  @override
  Widget build(BuildContext context) {
    total = products[0]['price'] * quantity[0] +
        products[1]['price'] * quantity[1] +
        products[2]['price'] * quantity[2];
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "My Bag",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 10, top: 25, right: 20),
                    child: Container(
                      width: 343,
                      height: 104,
                      decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x14000000),
                              blurRadius: 25,
                              offset: Offset(0, 1),
                              spreadRadius: 0,
                            ),
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            products[index]['image'],
                            fit: BoxFit.contain,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  products[index]['name'],
                                  style: const TextStyle(
                                    color: Color(0xFF222222),
                                    fontSize: 18,
                                    fontFamily: 'Metropolis',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      const TextSpan(
                                        text: 'Color:',
                                        style: TextStyle(
                                            color: Color(0xFF9B9B9B),
                                            fontSize: 11),
                                      ),
                                      TextSpan(
                                        text: products[index]['color'],
                                        style: const TextStyle(
                                            color: Color(0xFF222222),
                                            fontSize: 12),
                                      ),
                                      const TextSpan(
                                        text: '    Size:',
                                        style: TextStyle(
                                            color: Color(0xFF9B9B9B),
                                            fontSize: 11),
                                      ),
                                      TextSpan(
                                        text: products[index]['size'],
                                        style: const TextStyle(
                                            color: Color(0xFF222222),
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 36,
                                        width: 36,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white60,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x19000000),
                                              blurRadius: 8,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                            child: IconButton(
                                          icon: const Icon(
                                            Icons.remove,
                                            color: Colors.grey,
                                            size: 20,
                                          ),
                                          onPressed: () {
                                            if (quantity[index] > 0) {
                                              quantity[index] -= 1;
                                              setState(() {});
                                            }
                                          },
                                        )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: Text(quantity[index].toString()),
                                      ),
                                      Container(
                                        height: 36,
                                        width: 36,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white60,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x19000000),
                                              blurRadius: 8,
                                              offset: Offset(0, 0),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                            child: IconButton(
                                          icon: const Icon(
                                            Icons.add,
                                            color: Colors.grey,
                                            size: 20,
                                          ),
                                          onPressed: () {
                                            if (quantity[index] < 5) {
                                              setState(() {
                                                quantity[index] += 1;
                                              });
                                            }
                                            if (quantity[index] == 5) {
                                              showDialog(context: context, builder: (context) {
                                                return SizedBox(
                                                  height: MediaQuery.of(context).size.height * 0.28,
                                                  width: MediaQuery.of(context).size.width * 0.75,
                                                  child: AlertDialog(
                                                    shadowColor: Colors.black12,
                                                    surfaceTintColor: Colors.white,
                                                    title: const Center(
                                                      child: Text(
                                                        'Congratulations',
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                    content: Text(
                                                      'You have added\n5\n${products[index]['name']} on your bag!',
                                                      textAlign: TextAlign.center,
                                                      style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.w400
                                                      ),
                                                    ),
                                                    actionsAlignment: MainAxisAlignment.center,
                                                    actions: [
                                                      SizedBox(
                                                        height: 40,
                                                        width: MediaQuery.of(context).size.width * 0.60,
                                                        child: MaterialButton(
                                                          onPressed: () {Navigator.pop(context);},
                                                          color: Colors.red,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(40)),
                                                          child: const Padding(
                                                            padding: EdgeInsets.only(
                                                              top: 10,
                                                              bottom: 10,),
                                                            child: Text(
                                                              'OKAY',
                                                              style: TextStyle(color: Colors.white,),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              });
                                            }
                                          },
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 13, right: 5),
                                  child: Icon(
                                    Icons.more_vert,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 30, right: 13, bottom: 15),
                                  child: Text(
                                    "${products[index]['price']}\$",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Total amount',
                        style: TextStyle(
                          color: Color(0xFF9B9B9B),
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                      ),
                      Text(
                        '$total\$',
                        style: const TextStyle(
                            color: Color(0xFF222222),
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          left: MediaQuery.of(context).size.width * 0.3,
                          right: MediaQuery.of(context).size.width * 0.3),
                      child: const Text(
                        'CHECK OUT',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
