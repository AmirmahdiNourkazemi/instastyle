import '../../domain/entities/appro_entity.dart';

class ApproModel extends ApproEntity{

ApproModel({
  required String approToken,

}) : super(approToken: approToken);

   factory ApproModel.fromJson(Map<String, dynamic> json) => ApproModel(
    approToken: json['token'],
    
  );
}


