import 'package:it_matrimony/features/profile/domain/entity/mobile_entity.dart';

// ignore: must_be_immutable
class MobileModel extends MobileEntity{


    MobileModel({
        required super.id,
        required super.name,
        required super.data,
    });

    factory MobileModel.fromJson(Map<String, dynamic> json) => MobileModel(
        id: json["id"],
        name: json["name"],
        data: json["data"] == null ? null : DataModel.fromJson(json["data"]),
    );
}

// ignore: must_be_immutable
class DataModel extends DataEntity{

    DataModel({
        super.dataColor,
        super.dataCapacity,
        super.capacityGb,
        super.dataPrice,
        super.dataGeneration,
        super.year,
        super.cpuModel,
        super.hardDiskSize,
        super.strapColour,
        super.caseSize,
        super.color,
        super.description,
        super.capacity,
        super.screenSize,
        super.generation,
        super.price,
    });

    factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        dataColor: json["color"],
        dataCapacity: json["capacity"],
        capacityGb: json["capacity GB"],
        dataPrice: json["price"]?.toDouble(),
        dataGeneration: json["generation"],
        year: json["year"],
        cpuModel: json["CPU model"],
        hardDiskSize: json["Hard disk size"],
        strapColour: json["Strap Colour"],
        caseSize: json["Case Size"],
        color: json["Color"],
        description: json["Description"],
        capacity: json["Capacity"],
        screenSize: json["Screen size"]?.toDouble(),
        generation: json["Generation"],
        price: json["Price"],
    );
}
