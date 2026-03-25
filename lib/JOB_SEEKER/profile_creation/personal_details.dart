import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class PersonalDetails extends StatelessWidget {
  const PersonalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    final primaryColor = const Color(0xFF7C329B);

    final double appBarTitleFontSize = isTablet ? 22 : 18;
    final double labelFontSize = isTablet ? 16 : 14;
    final double inputFontSize = isTablet ? 16 : 14;
    final double paddingHorizontal = isTablet ? 80.0 : 16.0;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Personal details',
          style: GoogleFonts.poppins(
            fontSize: appBarTitleFontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: paddingHorizontal,
              vertical: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInputField(
                  label: 'Name',
                  hintText: 'abcsamples',
                  isTablet: isTablet,
                  labelFontSize: labelFontSize,
                  inputFontSize: inputFontSize,
                ),
                const SizedBox(height: 16),
                _buildInputField(
                  label: 'Mobile number',
                  hintText: '+91 9876543210',
                  isTablet: isTablet,
                  labelFontSize: labelFontSize,
                  inputFontSize: inputFontSize,
                ),
                const SizedBox(height: 16),
                _buildInputField(
                  label: 'Mail id',
                  hintText: 'samples24@gmail.com',
                  isTablet: isTablet,
                  labelFontSize: labelFontSize,
                  inputFontSize: inputFontSize,
                ),
                const SizedBox(height: 16),
                _buildGenderSelector(
                  label: 'Gender',
                  isTablet: isTablet,
                  labelFontSize: labelFontSize,
                  primaryColor: Color(0xFF7C329B),
                ),
                const SizedBox(height: 16),
                _buildDateField(
                  label: 'Date of birth',
                  hintText: '22/12/2002',
                  isTablet: isTablet,
                  labelFontSize: labelFontSize,
                  inputFontSize: inputFontSize,
                  primaryColor: primaryColor,
                ),
                const SizedBox(height: 16),
                _buildYesNoSelector(
                  label: 'Physically Challenged',
                  isTablet: isTablet,
                  labelFontSize: labelFontSize,
                  primaryColor: primaryColor,
                ),
                const SizedBox(height: 16),
                _buildDropdownField(
                  label: 'Condition Type',
                  hintText: 'Select here',
                  isTablet: isTablet,
                  labelFontSize: labelFontSize,
                  inputFontSize: inputFontSize,
                ),
                const SizedBox(height: 16),
                _buildDropdownField(
                  label: 'Affected Area',
                  hintText: 'Select here',
                  isTablet: isTablet,
                  labelFontSize: labelFontSize,
                  inputFontSize: inputFontSize,
                ),
                const SizedBox(height: 16),
                _buildInputField(
                  label: 'Address\n(visible only to you)',
                  hintText: 'No.22 B, 9th Street, Sri Krishna Nagar, Irugur',
                  isTablet: isTablet,
                  labelFontSize: labelFontSize,
                  inputFontSize: inputFontSize,
                  maxLines: 4,
                ),
                const SizedBox(height: 16),
                _buildInputField(
                  label: 'City & state',
                  hintText: 'Coimbatore, Tamil Nadu',
                  isTablet: isTablet,
                  labelFontSize: labelFontSize,
                  inputFontSize: inputFontSize,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: isTablet ? 200 : null,
                  child: _buildInputField(
                    label: 'Pincode',
                    hintText: '641103',
                    isTablet: isTablet,
                    labelFontSize: labelFontSize,
                    inputFontSize: inputFontSize,
                  ),
                ),
                SizedBox(height: isTablet ? 120 : 100),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: paddingHorizontal,
                vertical: 16,
              ),
              color: Colors.white,
              child: _buildSaveButton(primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton(Color primaryColor) {
    return ElevatedButton(
      onPressed: () {
        // Handle save
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        'Save',
        style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String hintText,
    required bool isTablet,
    required double labelFontSize,
    required double inputFontSize,
    int maxLines = 1,
    Widget? prefixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: labelFontSize,
            fontWeight: FontWeight.w600,
            color: Color(0xFF7C329B),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
              fontSize: inputFontSize,
              color: Colors.black54,
            ),
            prefixIcon: prefixIcon,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF6A1B9A), width: 2),
            ),
          ),
          style: GoogleFonts.poppins(
            fontSize: inputFontSize,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildGenderSelector({
    required String label,
    required bool isTablet,
    required double labelFontSize,
    required Color primaryColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: labelFontSize,
            fontWeight: FontWeight.w600,
            color: Color(0xFF7C329B),
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            _buildGenderButton('Male', primaryColor),
            _buildGenderButton('Female', primaryColor),
            _buildGenderButton('Transgender', primaryColor),
          ],
        ),
      ],
    );
  }

  Widget _buildGenderButton(String text, Color primaryColor) {
    bool isSelected =
        (text == 'Male'); // Assuming 'Male' is selected by default
    return ChoiceChip(
      label: Text(
        text,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
      selected: isSelected,
      selectedColor: primaryColor,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: isSelected ? primaryColor : Colors.grey.shade300,
        ),
      ),
      onSelected: (selected) {
        // Handle selection
      },
    );
  }

  Widget _buildYesNoSelector({
    required String label,
    required bool isTablet,
    required double labelFontSize,
    required Color primaryColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: labelFontSize,
            fontWeight: FontWeight.w600,
            color: Color(0xFF7C329B),
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            _buildYesNoButton('Yes', primaryColor),
            _buildYesNoButton('No', primaryColor),
          ],
        ),
      ],
    );
  }

  Widget _buildYesNoButton(String text, Color primaryColor) {
    bool isSelected = (text == 'Yes'); // Assuming 'Yes' is selected by default
    return ChoiceChip(
      label: Text(
        text,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
      selected: isSelected,
      selectedColor: primaryColor,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: isSelected ? primaryColor : Colors.grey.shade300,
        ),
      ),
      onSelected: (selected) {
        // Handle selection
      },
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String hintText,
    required bool isTablet,
    required double labelFontSize,
    required double inputFontSize,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: labelFontSize,
            fontWeight: FontWeight.w600,
            color: Color(0xFF7C329B),
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF6A1B9A), width: 2),
            ),
          ),
          hint: Text(
            hintText,
            style: GoogleFonts.poppins(
              fontSize: inputFontSize,
              color: Colors.black54,
            ),
          ),
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
          items: const [
            DropdownMenuItem(value: 'Option 1', child: Text('Option 1')),
            DropdownMenuItem(value: 'Option 2', child: Text('Option 2')),
          ],
          onChanged: (String? value) {
            // Handle dropdown change
          },
          style: GoogleFonts.poppins(
            fontSize: inputFontSize,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildDateField({
    required String label,
    required String hintText,
    required bool isTablet,
    required double labelFontSize,
    required double inputFontSize,
    required Color primaryColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: labelFontSize,
            fontWeight: FontWeight.w600,
            color: Color(0xFF7C329B),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          readOnly: true,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
              fontSize: inputFontSize,
              color: Colors.black54,
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.calendar_today_outlined, color: primaryColor),
              onPressed: () {
                // Handle date picker
              },
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF6A1B9A), width: 2),
            ),
          ),
          style: GoogleFonts.poppins(
            fontSize: inputFontSize,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
