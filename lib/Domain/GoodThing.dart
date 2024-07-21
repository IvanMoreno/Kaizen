class GoodThing{
  final String cause;
  
  GoodThing(this.cause);
  
  @override
  bool operator ==(Object other) {
    return other is GoodThing && other.cause == cause;
  }
  
  @override
  String toString() => cause;
}