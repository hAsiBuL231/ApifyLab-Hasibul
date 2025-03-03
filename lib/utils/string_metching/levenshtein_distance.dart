int levenshtein(String s1, String s2) {
  List<List<int>> matrix = List.generate(
    s1.length + 1,
    (_) => List<int>.filled(s2.length + 1, 0),
  );

  for (int i = 0; i <= s1.length; i++) matrix[i][0] = i;
  for (int j = 0; j <= s2.length; j++) matrix[0][j] = j;

  for (int i = 1; i <= s1.length; i++) {
    for (int j = 1; j <= s2.length; j++) {
      int cost = (s1[i - 1] == s2[j - 1]) ? 0 : 1;
      matrix[i][j] = [
        matrix[i - 1][j] + 1,
        matrix[i][j - 1] + 1,
        matrix[i - 1][j - 1] + cost
      ].reduce((a, b) => a < b ? a : b);
    }
  }
  return matrix[s1.length][s2.length];
}

// Normalize string: convert to lowercase and remove common words like "hospital", "medical", etc.
String normalizeString(String str) {
  List<String> stopWords = ['hospital', 'medical', 'center', 'the'];
  return str
      .toLowerCase()
      .split(' ')
      .where((word) => !stopWords.contains(word))
      .join(' ');
}

// Calculate similarity between two strings using Levenshtein distance
double calculateWordSimilarity(String word1, String word2) {
  int distance = levenshtein(word1, word2);
  int maxLength = word1.length > word2.length ? word1.length : word2.length;
  return (1 - (distance / maxLength)) * 100;
}

// Main method to check if two hospital names match
bool isStringSimilarWithLevenshteinDistanceAlgorithm(
    String hospitalName1, String hospitalName2) {
  String normalizedHospitalName1 = normalizeString(hospitalName1);
  String normalizedHospitalName2 = normalizeString(hospitalName2);

  List<String> words1 = normalizedHospitalName1.split(RegExp(r'\s+'));
  List<String> words2 = normalizedHospitalName2.split(RegExp(r'\s+'));

  int matchCount = 0;
  for (var word1 in words1) {
    for (var word2 in words2) {
      double similarity = calculateWordSimilarity(word1, word2);
      if (similarity >= 50.0) {
        // Consider a match if similarity is at least 80%
        matchCount++;
        break; // Move to the next word in words1
      }
    }
  }

  // Check if the match rate is greater than or equal to 80%
  double matchRate = (matchCount / words1.length) * 100;
  return matchRate >= 50;
}
