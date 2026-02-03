class ExpenseOCRParser {
  static Map<String, String> parse(String rawText) {
    final lines = rawText
        .split('\n')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();

    String title = '';
    String amount = '';
    String date = '';
    String category = 'Other';
    String notes = '';

    /// ---------- AMOUNT ----------
    final amountRegex = RegExp(r'(₹|\$)?\s?\d{1,6}(\.\d{1,2})');

    for (final line in lines) {
      if (amount.isEmpty && amountRegex.hasMatch(line)) {
        amount =
            amountRegex
                .firstMatch(line)
                ?.group(0)
                ?.replaceAll(RegExp(r'[₹\$ ]'), '') ??
            '';
      }
    }

    /// ---------- DATE ----------
    final dateRegexList = [
      RegExp(r'\d{2}[-/]\d{2}[-/]\d{2,4}'), // 12-01-2024
      RegExp(r'\d{4}[-/]\d{2}[-/]\d{2}'), // 2024-01-12
    ];

    for (final line in lines) {
      for (final regex in dateRegexList) {
        if (date.isEmpty && regex.hasMatch(line)) {
          date = regex.firstMatch(line)!.group(0)!;
          break;
        }
      }
    }

    /// ---------- TITLE ----------
    for (final line in lines) {
      if (line.length > 4 &&
          !line.contains(amount) &&
          !line.contains(date) &&
          !RegExp(r'\d').hasMatch(line)) {
        title = line;
        break;
      }
    }

    /// ---------- CATEGORY ----------
    category = _detectCategory(title);

    /// ---------- NOTES ----------
    notes = lines
        .where((l) => l != title && !l.contains(amount) && !l.contains(date))
        .join(', ');

    return {
      'title': title,
      'amount': amount,
      'date': date,
      'category': category,
      'notes': notes,
    };
  }

  /// Category detection (heuristic)
  static String _detectCategory(String title) {
    final text = title.toLowerCase();

    if (text.contains('uber') ||
        text.contains('ola') ||
        text.contains('fuel') ||
        text.contains('petrol') ||
        text.contains('taxi')) {
      return 'Travel';
    }

    if (text.contains('restaurant') ||
        text.contains('hotel') ||
        text.contains('cafe') ||
        text.contains('food') ||
        text.contains('swiggy') ||
        text.contains('zomato')) {
      return 'Food';
    }

    if (text.contains('stationery') ||
        text.contains('office') ||
        text.contains('printer') ||
        text.contains('paper')) {
      return 'Office';
    }

    return 'Other';
  }
}
