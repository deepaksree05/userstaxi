// import 'package:flutter/material.dart';
// import 'dart:async';
//
// import '../screens/main_screen.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Navigate to MainScreen after 4 seconds
//     Timer(const Duration(seconds: 4), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const MainScreen()),
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ShaderMask(
//           shaderCallback: (bounds) => const LinearGradient(
//             colors: [Colors.blue, Colors.purple], // Gradient colors
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ).createShader(bounds),
//           child: const Text(
//             'Trippo',
//             style: TextStyle(
//               fontSize: 36, // Larger font size
//               fontWeight: FontWeight.bold, // Bold text
//               color: Colors.white, // Color must be set for ShaderMask to work
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:async';

import '../screens/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4), // Duration for gradient animation
    )..repeat(); // Repeat the animation indefinitely

    // Navigate to MainScreen after 4 seconds
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                  colors: [Colors.blue, Colors.purple], // Gradient colors
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                    (_controller.value - 0.5).clamp(0.0, 1.0),
                    _controller.value.clamp(0.0, 1.0),
                  ], // Animated stops
                ).createShader(bounds);
              },
              child: const Text(
                'Trippo',
                style: TextStyle(
                  fontSize: 36, // Larger font size
                  fontWeight: FontWeight.bold, // Bold text
                  color: Colors.white, // Color for ShaderMask
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}