import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MetalShimmer extends StatelessWidget {
  const MetalShimmer({Key? key}) : super(key: key);
  Widget textShimmer(){
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: Container(
        width: 80,
        height: 4,
        color: Colors.grey,
        margin: const EdgeInsets.symmetric(vertical: 6.0),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textShimmer(),
            const SizedBox(height: 8.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textShimmer(),
                    const SizedBox(height: 8.0,),
                    textShimmer(),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textShimmer(),
                    const SizedBox(height: 8.0,),
                    textShimmer(),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textShimmer(),
                    const SizedBox(height: 8.0,),
                    textShimmer(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
