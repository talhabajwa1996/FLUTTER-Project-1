import 'package:rxdart/rxdart.dart';
import '../mixins/validation_mixin.dart';

class Bloc extends Object with Validators{

  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  get changeEmail => _email.sink.add;
  get changePassword => _password.sink.add;

  get email => _email.stream.transform(validateEmail);
  get password => _password.stream.transform(validatePassword);

  get emailAndpassword => CombineLatestStream.combine2(email, password, (e, p) => true);

  submit(){
    final submitEmail = _email.value;
    final submitPassword = _password.value;

    print('The Email is $submitEmail');
    print("The password is $submitPassword");
  }

  dispose(){
    _email.close();
    _password.close();
  }
}