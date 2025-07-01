// --------------------------------------------------
// ---- Classes and records used in the example -----
// --------------------------------------------------
typedef Item = ({int id, String name, double price});

typedef Customer = ({int id, String firstName, String lastName});

class Order {
  const Order({required this.id, required this.customer, required this.items});

  final int id;
  final Customer customer;
  final List<Item> items;

  @override
  String toString() => 'Order(id: $id, customer: $customer, items: $items)';
}
