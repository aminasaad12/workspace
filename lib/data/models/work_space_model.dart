
//http://okoolextra.com/cowork.json

class Workspace {
  int? id;
  String? name;
  String? address;
  String? phone;
  int? indvRooms;
  List<Timing>? timing;
  int? sharedRooms;
  bool? wifi;
  bool? cafe;
  bool? meetingsRoom;
  int? meetingsRooms;
  bool? trainingRoom;
  int? trainingRooms;
  bool? library;
  bool? events;
  bool? studio;
  List<Images>? images;
  double? evaluation;



  Workspace.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    indvRooms = json['indv_rooms'];
    if (json['timing'] != null) {
      timing = <Timing>[];
      json['timing'].forEach((v) {
        timing!.add(new Timing.fromJson(v));
      });
    }
    sharedRooms = json['shared_rooms'];
    wifi = json['wifi'];
    cafe = json['cafe'];
    meetingsRoom = json['meetings_room'];
    meetingsRooms = json['meetings_rooms'];
    trainingRoom = json['training_room'];
    trainingRooms = json['training_rooms'];
    library = json['library'];
    events = json['events'];
    studio = json['studio'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    evaluation = json['evaluation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['indv_rooms'] = this.indvRooms;
    if (this.timing != null) {
      data['timing'] = this.timing!.map((v) => v.toJson()).toList();
    }
    data['shared_rooms'] = this.sharedRooms;
    data['wifi'] = this.wifi;
    data['cafe'] = this.cafe;
    data['meetings_room'] = this.meetingsRoom;
    data['meetings_rooms'] = this.meetingsRooms;
    data['training_room'] = this.trainingRoom;
    data['training_rooms'] = this.trainingRooms;
    data['library'] = this.library;
    data['events'] = this.events;
    data['studio'] = this.studio;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['evaluation'] = this.evaluation;
    return data;
  }
}

class Timing {
  bool? vacation;
  String? day;
  String? start;
  String? end;

  Timing({this.vacation, this.day, this.start, this.end});

  Timing.fromJson(Map<String, dynamic> json) {
    vacation = json['vacation'];
    day = json['day'];
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vacation'] = this.vacation;
    data['day'] = this.day;
    data['start'] = this.start;
    data['end'] = this.end;
    return data;
  }
}

class Images {
  String? imageUrl;
  String? caption;

  Images({this.imageUrl, this.caption});

  Images.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
    caption = json['caption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_url'] = this.imageUrl;
    data['caption'] = this.caption;
    return data;
  }
}

