import 'package:flutter/material.dart';
import 'package:masjid_management_flutter/config/theme.dart';


class BrandingSection extends StatelessWidget {
  final double screenHeight;

  const BrandingSection({
    Key? key,
    required this.screenHeight,
  }) : super(key: key);

  Widget _buildFeatureItem(IconData icon, String text) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.9),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight,
      decoration: const BoxDecoration(
        gradient: AppTheme.brandGradient,
      ),
      child: Stack(
        children: [
          // Decorative elements
          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.05),
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.03),
              ),
            ),
          ),

          // Main content
          Padding(
            padding: const EdgeInsets.all(80.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo section
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(
                        Icons.mosque,
                        size: 32,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'Masjid Kg Mampas Besar',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 60),

                // Main heading
                const Text(
                  'Streamline Your\nMasjid Operations',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    height: 1.1,
                    letterSpacing: -1,
                  ),
                ),

                const SizedBox(height: 24),

                // Subtitle
                Text(
                  'Comprehensive management platform for prayer schedules,\nevents, community engagement, and administrative tasks.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white.withOpacity(0.85),
                    height: 1.6,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                const SizedBox(height: 50),

                // Features
                _buildFeatureItem(Icons.schedule, 'Automated Prayer Times'),
                const SizedBox(height: 20),
                _buildFeatureItem(Icons.event_note, 'Event Management'),
                const SizedBox(height: 20),
                _buildFeatureItem(Icons.groups, 'Member Directory'),
                const SizedBox(height: 20),
                _buildFeatureItem(Icons.analytics, 'Analytics & Reports'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
