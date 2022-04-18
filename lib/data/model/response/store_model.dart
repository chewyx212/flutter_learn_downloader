// To parse this JSON data, do
//
//     final storeModel = storeModelFromJson(jsonString);


class StoreModel {
    StoreModel({
        this.id,
        this.address,
        this.logo,
        this.banner,
        this.phone,
        this.email,
        this.floor,
        this.facebook,
        this.instagram,
        this.storeOperatingTime,
        this.name,
        this.desc,
    });

    int? id;
    String? address;
    String? logo;
    List<String>? banner;
    String? phone;
    String? email;
    String? floor;
    String? facebook;
    String? instagram;
    StoreOperatingTime? storeOperatingTime;
    String? name;
    String? desc;

    factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        id: json["id"],
        address: json["address"],
        logo: json["logo"],
        banner: List<String>.from(json["banner"].map((x) => x)),
        phone: json["phone"],
        email: json["email"],
        floor: json["floor"],
        facebook: json["facebook"],
        instagram: json["instagram"],
        storeOperatingTime: StoreOperatingTime.fromJson(json["store_operating_time"]),
        name: json["name"],
        desc: json["desc"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "logo": logo,
        "banner": List<dynamic>.from(banner!.map((x) => x)),
        "phone": phone,
        "email": email,
        "floor": floor,
        "facebook": facebook,
        "instagram": instagram,
        "store_operating_time": storeOperatingTime?.toJson(),
        "name": name,
        "desc": desc,
    };
}

class StoreOperatingTime {
    StoreOperatingTime({
        this.mon,
        this.tues,
        this.wed,
        this.thu,
        this.fri,
        this.sat,
        this.sun,
        this.storeId,
    });

    Fri? mon;
    Fri? tues;
    Fri? wed;
    Fri? thu;
    Fri? fri;
    Fri? sat;
    Fri? sun;
    int? storeId;

    factory StoreOperatingTime.fromJson(Map<String, dynamic> json) => StoreOperatingTime(
        mon: Fri.fromJson(json["mon"]),
        tues: Fri.fromJson(json["tues"]),
        wed: Fri.fromJson(json["wed"]),
        thu: Fri.fromJson(json["thu"]),
        fri: Fri.fromJson(json["fri"]),
        sat: Fri.fromJson(json["sat"]),
        sun: Fri.fromJson(json["sun"]),
        storeId: json["store_id"],
    );

    Map<String, dynamic> toJson() => {
        "mon": mon?.toJson(),
        "tues": tues?.toJson(),
        "wed": wed?.toJson(),
        "thu": thu?.toJson(),
        "fri": fri?.toJson(),
        "sat": sat?.toJson(),
        "sun": sun?.toJson(),
        "store_id": storeId,
    };
}

class Fri {
    Fri({
        this.startTime,
        this.endTime,
        this.restStartTime,
        this.restEndTime,
        this.status,
    });

    String? startTime;
    String? endTime;
    dynamic restStartTime;
    dynamic restEndTime;
    String? status;

    factory Fri.fromJson(Map<String, dynamic> json) => Fri(
        startTime: json["start_time"],
        endTime: json["end_time"],
        restStartTime: json["rest_start_time"],
        restEndTime: json["rest_end_time"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "start_time": startTime,
        "end_time": endTime,
        "rest_start_time": restStartTime,
        "rest_end_time": restEndTime,
        "status": status,
    };
}
