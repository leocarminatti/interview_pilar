enum OrderByType {
  high(name: 'Mais caros'),
  low(name: 'Mais baratos');

  const OrderByType({required this.name});

  final String name;
}
