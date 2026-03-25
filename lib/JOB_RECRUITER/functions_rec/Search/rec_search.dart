import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_jobs/JOB_RECRUITER/functions_rec/Search/rec_search_display.dart';



class RecSearch extends StatefulWidget {
  const RecSearch({super.key});

  @override
  State<RecSearch> createState() => _SearchScreenState1();
}

class _SearchScreenState1 extends State<RecSearch> {
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
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Search jobs',
            hintStyle: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1,
            ),
            filled: true,
            fillColor: Colors.grey.shade100,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.close, color: Colors.grey),
              onPressed: () {
                _searchController.clear();
              },
            ),
          ),
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recent Searches",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.black,
                height: 1,
              ),
            ),
            const SizedBox(height: 16),
            _buildSearchChips(_recentSearches),
            const Divider(height: 32, thickness: 1, color: Colors.grey),
            Text(
              "Trending Searches",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.black,
                height: 1,
              ),
            ),
            const SizedBox(height: 16),
            _buildSearchChips(_trendingSearches),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchChips(List<String> searches) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: searches.map((search) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RecSavedProfileScreen(),
              ),
            );
          },
          child: Chip(
            backgroundColor: Colors.purple.shade50,
            label: Text(
              search,
              style: GoogleFonts.poppins(
                color: purpleColor,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                height: 1,
              ),
            ),
            avatar: Icon(Icons.north_east, color: purpleColor, size: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.purple.shade100),
            ),
          ),
        );
      }).toList(),
    );
  }
}
