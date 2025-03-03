// Generate bigrams from the input string
List<String> generateBigrams(String input) {
  List<String> bigrams = [];
  for (int i = 0; i < input.length - 1; i++) {
    bigrams.add(input.substring(i, i + 2));
  }
  return bigrams;
}

// Calculate the Dice coefficient between two strings
double isStringSimilarWithDiceCoefficient(String str1, String str2) {
  // Generate bigrams for both strings
  List<String> bigrams1 = generateBigrams(str1);
  List<String> bigrams2 = generateBigrams(str2);

  // Find the intersection of both bigram sets
  int intersection = 0;
  for (var bigram in bigrams1) {
    if (bigrams2.contains(bigram)) {
      intersection++;
      bigrams2.remove(bigram); // To avoid double counting
    }
  }

  // Apply the Dice coefficient formula
  return (2.0 * intersection) / (bigrams1.length + bigrams2.length);
}

// Normalize strings (remove stop words, lowercase, etc.)
String normalizeString(String str) {
  List<String> stopWords = ['hospital', 'medical', 'center', 'the'];
  return str
      .toLowerCase()
      .split(' ')
      .where((word) => !stopWords.contains(word))
      .join(' ');
}

// Check if two hospital names match based on Dice Coefficient (threshold: 0.8)
bool isHospitalNameSimilar(String hospitalName1, String hospitalName2) {
  String normalizedHospitalName1 = normalizeString(hospitalName1);
  String normalizedHospitalName2 = normalizeString(hospitalName2);

  double similarity = isStringSimilarWithDiceCoefficient(
      normalizedHospitalName1, normalizedHospitalName2);

  return similarity >= 0.8; // 80% threshold
}
