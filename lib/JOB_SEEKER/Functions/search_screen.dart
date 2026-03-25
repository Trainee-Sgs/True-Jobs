import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final purpleColor = const Color(0xFF6A1B9A);

  // Example data for chips
  final List<String> _recentSearches = ['UI UX', 'UI Designer', 'Flutter'];
  final List<String> _trendingSearches = ['UI UX', 'UI Designer', 'Flutter'];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: TextField(
          controller: _searchController,
          autofocus: true, // Automatically focus the text field
          decoration: InputDecoration(
            hintText: 'Search jobs',
            hintStyle: GoogleFonts.poppins(),
            filled: true,
            fillColor: Colors.grey.shade100,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 2,
              horizontal: 8,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: BorderSide.none,
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.close, color: Colors.grey),
              onPressed: () {
                _searchController.clear();
              },
            ),
          ),
          style: GoogleFonts.poppins(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recent Searches",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            _buildSearchChips(_recentSearches),
            const Divider(height: 30, thickness: 1, color: Colors.grey),
            Text(
              "Trending Searches",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            _buildSearchChips(_trendingSearches),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchChips(List<String> searches) {
    return Wrap(
      spacing: 8.0, // Gap between chips
      runSpacing: 8.0, // Gap between lines of chips
      children: searches.map((search) {
        return Chip(
          backgroundColor: Colors.purple.shade50, // Light purple background
          label: Text(
            search,
            style: GoogleFonts.poppins(
              color: purpleColor,
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          ),
          avatar: Icon(Icons.north_east, color: purpleColor, size: 16), // Trending icon
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.purple.shade100), // Light purple border
          ),
          onDeleted: () {
            // Optional: Implement logic to remove the chip
            setState(() {
              // searches.remove(search); // Example of removing a chip
            });
          },
          deleteIcon: null, // No delete icon for now, you can add if needed.
        );
      }).toList(),
    );
  }
}
