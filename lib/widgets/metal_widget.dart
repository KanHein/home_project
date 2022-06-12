import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../models/metal.dart';

Widget metalCarousel(BuildContext context, List<Metal> metals){
  return CarouselSlider(
    options: CarouselOptions(
      height: 110,
      // aspectRatio: 16/9,
      viewportFraction: 1,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 3),
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
    ),
    items: metals.map((metal) {
      return SizedBox(
        width: double.infinity,
        child: Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(metal.name!,
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 8.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Silver"),
                        const SizedBox(height: 8.0,),
                        Text(metal.silver!.toString()),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Gold"),
                        const SizedBox(height: 8.0,),
                        Text(metal.gold!.toString()),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Platinum"),
                        const SizedBox(height: 8.0,),
                        Text(metal.platinum!.toString()),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }).toList(),
  );
}