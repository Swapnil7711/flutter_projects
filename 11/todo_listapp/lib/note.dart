class Note {
  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;

//constructor without id for storing data
  Note(this._title, this._date, this._priority, [this._description]);

// Named constructor with id for retrieving data with the help of id
  Note.withID(this._id, this._title, this._date, this._priority,
      [this._description]);

  // custom setter

  int get id => _id;

  String get title => _title;

  String get description => _description;

  String get date => _date;

  int get priority => _priority;

  // custom setter method to set the values

  set title(String newTitle) {
    if (newTitle.length <= 255) {
      this._title = newTitle;
    }
  }

  set description(String newDescription) {
    if (newDescription.length <= 255) {
      this._description = newDescription;
    }
  }

  set date(String newDate) {
    this._date = newDate;
  }

  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 2) {
      this._priority = newPriority;
    }
  }

  // convert note objet to map object

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = _id; // cjange to this._id to verify if its works
    }

    map['title'] = _title;
    map['description'] = _description;
    map['date'] = _date;
    map['priority'] = _priority;

    return map;
  }

  // convert from map to note object

  Note.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._description = map['description'];
    this._title = map['title'];
    this._priority = map['priority'];
    this._date = map['date'];
  }
}
