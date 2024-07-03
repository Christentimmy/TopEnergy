import 'package:flutter/material.dart';
import 'package:topenergy/Resources/color.dart';


class SwapTo extends StatelessWidget {
  const SwapTo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Text(
                "To",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Spacer(),
              Text(
                "Available \$2000",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),

          Text(
            "₦500-₦20,000",
            style: TextStyle(
              color: Color.fromARGB(255, 190, 190, 190),
            ),
          ),
        ],
      ),
    );
  }
}

class SwapFrom extends StatelessWidget {
  const SwapFrom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                "From",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Spacer(),
              Text(
                "Commission ₦2000",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          TextFormField(
            style: const TextStyle(
              color: Colors.white,
            ),
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: "₦1000 - ₦2000",
              hintStyle: TextStyle(
                color: Color.fromARGB(255, 190, 190, 190),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "MAX",
                style: TextStyle(
                  color: AppsColor.primaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
