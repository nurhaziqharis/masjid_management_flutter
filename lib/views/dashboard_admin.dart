import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  // Define your pages
  final pages = [
    const Center(child: Text("Dashboard Page", style: TextStyle(fontSize: 24))),
    const Center(child: Text("Tasks Page", style: TextStyle(fontSize: 24))),
    const Center(child: Text("Calendar Page", style: TextStyle(fontSize: 24))),
    const Center(child: Text("Analytics Page", style: TextStyle(fontSize: 24))),
    const Center(child: Text("Team Page", style: TextStyle(fontSize: 24))),
    const Center(child: Text("Settings Page", style: TextStyle(fontSize: 24))),
    const Center(child: Text("Help Page", style: TextStyle(fontSize: 24))),
    const Center(child: Text("Logout Page", style: TextStyle(fontSize: 24))),
  ];

  // Define menu items with groups
  final List<Map<String, dynamic>> menuItems = [
    // MENU group
    {
      'group': 'MENU',
      'items': [
        {
          'icon': Icons.dashboard,
          'label': 'Dashboard',
          'isActive': true,
          'badge': null,
        },
        {
          'icon': Icons.task_alt,
          'label': 'Tasks',
          'isActive': false,
          'badge': '23',
        },
        {
          'icon': Icons.calendar_today,
          'label': 'Calendar',
          'isActive': false,
          'badge': null,
        },
        {
          'icon': Icons.analytics,
          'label': 'Analytics',
          'isActive': false,
          'badge': null,
        },
        {
          'icon': Icons.people,
          'label': 'Team',
          'isActive': false,
          'badge': null,
        },
      ]
    },
    // GENERAL group
    {
      'group': 'GENERAL',
      'items': [
        {
          'icon': Icons.settings,
          'label': 'Settings',
          'isActive': false,
          'badge': null,
        },
        {
          'icon': Icons.help_outline,
          'label': 'Help',
          'isActive': false,
          'badge': null,
        },
        {
          'icon': Icons.logout,
          'label': 'Logout',
          'isActive': false,
          'badge': null,
        },
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFAFB),
      body: Row(
        children: [
          // Custom Sidebar
          Container(
            width: 280,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with Logo and Title
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFF10B981),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.mosque,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Masjid Manager',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                // Search Box
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9FAFB),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFE5E7EB)),
                    ),
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: 'Search here...',
                        hintStyle: TextStyle(
                          color: Color(0xFF9CA3AF),
                          fontSize: 14,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xFF9CA3AF),
                          size: 20,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // Navigation Menu
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    itemCount: menuItems.length,
                    itemBuilder: (context, groupIndex) {
                      final group = menuItems[groupIndex];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Group Title
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Text(
                              group['group'],
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF9CA3AF),
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),

                          // Group Items
                          ...List.generate(
                            group['items'].length,
                                (itemIndex) {
                              final item = group['items'][itemIndex];
                              final globalIndex = _getGlobalIndex(groupIndex, itemIndex);
                              final isSelected = selectedIndex == globalIndex;

                              return Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = globalIndex;
                                    });
                                  },
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? const Color(0xFF10B981).withOpacity(0.1)
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          item['icon'],
                                          size: 20,
                                          color: isSelected
                                              ? const Color(0xFF10B981)
                                              : const Color(0xFF6B7280),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Text(
                                            item['label'],
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: isSelected
                                                  ? FontWeight.w600
                                                  : FontWeight.w500,
                                              color: isSelected
                                                  ? const Color(0xFF10B981)
                                                  : const Color(0xFF374151),
                                            ),
                                          ),
                                        ),
                                        if (item['badge'] != null)
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF10B981),
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Text(
                                              item['badge'],
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),

                          // Add spacing between groups
                          if (groupIndex < menuItems.length - 1)
                            const SizedBox(height: 32),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // Main Content Area
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(24),
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: pages[selectedIndex],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to calculate global index for navigation
  int _getGlobalIndex(int groupIndex, int itemIndex) {
    int globalIndex = 0;
    for (int i = 0; i < groupIndex; i++) {
      globalIndex += (menuItems[i]['items'] as List).length;
    }
    return globalIndex + itemIndex;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}