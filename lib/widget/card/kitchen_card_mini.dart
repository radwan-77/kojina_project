import 'package:flutter/material.dart';
import 'package:kojina_project/helper/function_helper.dart';

class kitchencardmini extends StatelessWidget {
  final String mainimage;
  final String miniimage;
  const kitchencardmini({
    super.key,
    required this.mainimage,
    required this.miniimage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Container(
              width: getsize(context).width,
              height: getsize(context).height * 0.23,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      fit: BoxFit.cover,
                      mainimage,
                      width: getsize(context).width,
                      height: getsize(context).height * 0.2,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 30,
              // how to use Overflow
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  fit: BoxFit.cover,
                  miniimage,
                  width: 100,
                  height: 100,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
