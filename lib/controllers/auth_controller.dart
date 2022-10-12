import 'package:food_delivery/core/utils/app_constants.dart';
import 'package:food_delivery/data/repository/auth_repo.dart';
import 'package:food_delivery/model/response_model.dart';
import 'package:food_delivery/model/signup_body_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService{
final AuthRepo authRepo;
AuthController({required this.authRepo}); 

bool isLoading = false;
  Future<ResponseModel> registration(SignUpBody signUpBody)async{
  isLoading =true;
  update();
  Response response = await authRepo.registration(signUpBody.toMap());
  print('${response.body}');
  print('${response.statusCode}');
   late ResponseModel responseModel;
  if(response.statusCode == 200){
     responseModel = ResponseModel(isSuccess: true, message: AppConstants.TOKEN);
     authRepo.saveUserToken(response.body['token']);
  }else{
       responseModel = ResponseModel(isSuccess: false, message: response.statusCode.toString());

  }
  isLoading =false;
   update();
  return responseModel;

}
 
Future<ResponseModel> login(String email ,String password, String phone)async{ 
  isLoading =true;
  update();
   Response response = await authRepo.login(email, password,phone);
   late ResponseModel responseModel;
   if(response.statusCode == 200){ 
     responseModel = ResponseModel(isSuccess: true, message: 'you are signing in'); 
      authRepo.saveUserToken(response.body['token']);
   }
   else{
     responseModel = ResponseModel(isSuccess: false, message: response.statusCode.toString());
     
   } 
   isLoading =false;
   update();
 return responseModel ; 
}

bool userLoggedIn(){
    return authRepo.userLoggedIn();
  }
  bool clearSharedData(){
    authRepo.clearSharedData();
    return true;
  }
} 