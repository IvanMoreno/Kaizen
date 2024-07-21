class BadThing{
  final String issue;
  final String proposedSolution;

  BadThing({required this.issue, required this.proposedSolution});
  
  @override
  bool operator ==(Object other) {
    return other is BadThing && other.issue == issue && other.proposedSolution == proposedSolution;
  }
  
  @override
  String toString() {
    return "$issue with solution $proposedSolution";    
  }
}