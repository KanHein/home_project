class Metal
{
  String? name;
  double? silver, gold, platinum;
  Metal({this.name, this.silver, this.gold, this.platinum});
  Metal.fromJson(Map<String, dynamic> jsonData)
  {
    silver = jsonData['silver'];
    gold = jsonData['gold'];
    platinum = jsonData['platinum'];
  }
}