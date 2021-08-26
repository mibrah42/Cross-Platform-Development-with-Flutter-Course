class Crypto {
  final String id;
  final String name;
  final String symbol;
  final double changePercent24hr;
  final double priceUsd;
  final double marketCapUsd;
  final int rank;

  Crypto({
    required this.id,
    required this.name,
    required this.symbol,
    required this.changePercent24hr,
    required this.priceUsd,
    required this.marketCapUsd,
    required this.rank,
  });

  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      changePercent24hr: double.parse(json['changePercent24Hr']),
      priceUsd: double.parse(json['priceUsd']),
      marketCapUsd: double.parse(json['marketCapUsd']),
      rank: int.parse(json['rank']),
    );
  }
}
