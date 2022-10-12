import 'package:food_delivery/model/response_model.dart';
import 'package:food_delivery/model/user_info_model.dart';
import 'package:get/get.dart'; 
import 'package:food_delivery/data/repository/use_info_repo.dart'; 
class UserController extends GetxController implements GetxService { 
 final UserRepo userRepo;
  UserController({
    required this.userRepo,
  });
  UserModel userModel = UserModel(id:0, name: 'name', email: 'email', phone: 'phone', orderCount: 0);
  late ResponseModel responseModel;
  bool isLoading = false;
  Future<ResponseModel> getUserInfo()async{
     isLoading =true; 
    Response response = await userRepo.getUserInfo();
    if(response.statusCode==200){
      userModel = UserModel.fromMap(response.body); 
      responseModel = ResponseModel(isSuccess: true, message: 'Well Done'); 
    }else{
      responseModel = ResponseModel(isSuccess: false, message: "Sth Went Wrong");
    } 
    isLoading = false;
    update();
    return responseModel;
   }
  
}
