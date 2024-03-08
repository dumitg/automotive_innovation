import 'package:flutter/material.dart';

class CarPart extends StatelessWidget {
  final bool state;
  final String name;
  final VoidCallback onTap;

  const CarPart({
    super.key,
    required this.state,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Improved color scheme for readability and aesthetics
    Color backgroundColor = state ? Colors.lightGreen : Colors.grey.shade800;
    Color boxShadowColor = state
        ? Colors.lightGreen.withOpacity(0.5)
        : Colors.black.withOpacity(0.1);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8), // Add some margin around each card
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        height: 150,
        width: 170,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: boxShadowColor,
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              // Using Expanded to ensure text does not overflow
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    state ? "Deschis" : "Inchis",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white.withOpacity(0.7),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            // Customizing the switch button
            Transform.scale(
              scale: 1.0, // Adjust scale factor based on your design preference
              child: Switch(
                activeColor: Colors.white,
                activeTrackColor: Colors.blue.shade700,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.grey.shade700,
                value: state,
                onChanged: (bool value) => onTap(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
