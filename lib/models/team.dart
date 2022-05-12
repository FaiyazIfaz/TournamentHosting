class Team {
  dynamic
      _id; // Use dynamic type because json-server id is int and firestore id is string
  String _name;
  int _capacity;
  String _description;

  // ignore: unnecessary_getters_setters
  get id => _id;
  // ignore: unnecessary_getters_setters
  set id(value) => _id = value;

  get name => _name;
  set name(value) => _name = value;

  get capacity => _capacity;
  set capacity(value) => _capacity = value;

  get description => _description;
  set description(value) => _description = value;

  Team(
      {dynamic id, String name = '', int capacity = 0, String description = ''})
      : _id = id,
        _name = name,
        _capacity = capacity,
        _description = description;
  Team.copy(Team from)
      : this(
            id: from.id,
            name: from.name,
            capacity: from.capacity,
            description: from.description);

  Team.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          name: json['name'],
          capacity: json['capacity'],
          description: json['description'],
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'capacity': capacity,
        'description': description,
      };
}
