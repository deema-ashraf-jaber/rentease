import 'package:flutter/material.dart';
import 'widgets/property_card.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primary = Color(0xff234A8F);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffF6F7FB),

        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            "RentEase",
            style: TextStyle(
              color: Color(0xff234A8F),
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Icon(
                Icons.notifications_none,
                color: Colors.black,
              ),
            ),
          ],
        ),


        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "ابحث عن عقارك بغزة...",
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.search),

                    suffixIcon: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.tune,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(
                        child: Text(
                          "الكل",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    const Chip(label: Text("مدينة غزة")),

                    const SizedBox(width: 10),

                    const Chip(label: Text("الرمال")),

                    const SizedBox(width: 10),

                    const Chip(label: Text("النصر")),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text("26 عقار"),

                  Text(
                    "نتائج البحث",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView(
                  children: [

                    const PropertyCard(
                      image:
                      "assets/images/properties/apartment1.jpg",
                      title: "شقة سكنية - حي الرمال",
                      location: "شارع الشهداء - غزة",
                      price: "\$450 / شهر",
                      rooms: "3 غرف",
                      baths: "2 حمام",
                      size: "145م²",
                      rating: "4.8",
                    ),

                    const PropertyCard(
                      image:
                      "assets/images/properties/apartment2.jpg",
                      title: "شقة عائلية - مدينة غزة",
                      location: "منطقة الجامعات",
                      price: "\$1200 / شهر",
                      rooms: "5 غرف",
                      baths: "4 حمام",
                      size: "350م²",
                      rating: "4.9",
                    ),

                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        children: [

                          const Text(
                            "هل تملك عقاراً؟",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 10),

                          const Text(
                            "اعرض عقارك بسهولة للوصول للمستأجرين المحتملين",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),

                          const SizedBox(height: 15),

                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("إضافة عقار"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}