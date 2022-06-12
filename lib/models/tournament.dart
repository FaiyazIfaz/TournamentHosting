class Tournament {
  dynamic
      _id; // Use dynamic type because json-server id is int and firestore id is string
  String _name;
  String _skillLevel;
  dynamic _prizePool;
  String _description;

  // ignore: unnecessary_getters_setters
  get id => _id;
  // ignore: unnecessary_getters_setters
  set id(value) => _id = value;

  get name => _name;
  set name(value) => _name = value;

  get skillLevel => _skillLevel;
  set skillLevel(value) => _skillLevel = value;

  get prizePool => _prizePool;
  set prizePool(value) => _prizePool = value;

  get description => _description;
  set description(value) => _description = value;

  Tournament(
      {dynamic id,
      String name = '',
      String skillLevel = '',
      dynamic prizePool = 0,
      String description = ''})
      : _id = id,
        _name = name,
        _skillLevel = skillLevel,
        _prizePool = prizePool,
        _description = description;
  Tournament.copy(Tournament from)
      : this(
            id: from.id,
            name: from.name,
            skillLevel: from.skillLevel,
            prizePool: from.prizePool,
            description: from.description);

  Tournament.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          name: json['name'],
          skillLevel: json['skillLevel'],
          prizePool: json['prizePool'],
          description: json['description'],
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'skillLevel': skillLevel,
        'prizePool': prizePool,
        'description': description,
      };
}
//to show we work on code
