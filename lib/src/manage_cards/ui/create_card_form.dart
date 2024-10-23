import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:loyalty_card_web_app/src/register/bloc/register_bloc.dart';

class CreateCardForm extends StatelessWidget {
  const CreateCardForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _FirstNameInput(),
          const Padding(padding: EdgeInsets.all(8)),
          _LastNameInput(),
          const Padding(padding: EdgeInsets.all(8)),
          _CompanyNameInput(),
          const Padding(padding: EdgeInsets.all(8)),
          _PhoneNoInput(),
          const Padding(padding: EdgeInsets.all(8)),
          _EmailInput(),
          const Padding(padding: EdgeInsets.all(8)),
          _PasswordInput(),
          const Padding(padding: EdgeInsets.all(8)),
          _ConfirmPasswordInput(),
          const Padding(padding: EdgeInsets.all(8)),
          _RegisterButton(),
        ],
      ),
    );
  }
}

class _FirstNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final displayError = context.select(
    //   (RegisterBloc bloc) => bloc.state.firstName.displayError,
    // );

    return TextField(
      key: const Key('registerForm_firstNameInput_textField'),
      onChanged: (firstName) {
        // context.read<RegisterBloc>().add(FirstNameChanged(firstName));
      },
      decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal)),
          hintText: 'First Name',
          labelText: 'First Name',
          prefixIcon: const Icon(
            Icons.email,
            color: Colors.green,
          ),
          // errorText: displayError != null ? 'invalid Name' : null,
          suffixStyle: const TextStyle(color: Colors.green)),
    );
  }
}

class _LastNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final displayError = context.select(
    //   (RegisterBloc bloc) => bloc.state.lastName.displayError,
    // );

    return TextField(
        key: const Key('registerForm_lastNameInput_textField'),
        onChanged: (lastName) {
          // context.read<RegisterBloc>().add(LastNameChanged(lastName));
        },
      
        decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.teal)),
            hintText: 'LastName',
            labelText: 'LastName',
            prefixIcon: const Icon(
              Icons.key,
              color: Colors.green,
            ),
            // errorText: displayError != null ? 'invalid LastName' : null,
            ));
  }
}

class _CompanyNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final displayError = context.select(
    //   (RegisterBloc bloc) => bloc.state.companyName.displayError,
    // );

    return TextField(
        key: const Key('registerForm_companyNameInput_textField'),
        onChanged: (companyName) {
          // context.read<RegisterBloc>().add(CompanyNameChanged(companyName));
        },
        
        decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.teal)),
            hintText: 'CompanyName',
            labelText: 'CompanyName',
            prefixIcon: const Icon(
              Icons.key,
              color: Colors.green,
            ),
            // errorText: displayError != null ? 'invalid CompanyName' : null,
           ));
  }
}


class _PhoneNoInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final displayError = context.select(
    //   (RegisterBloc bloc) => bloc.state.phoneNo.displayError,
    // );

    return TextField(
        key: const Key('registerForm_phoneNoInput_textField'),
        onChanged: (phoneNo) {
          // context.read<RegisterBloc>().add(PhoneNoChanged(phoneNo));
        },
       
        decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.teal)),
            hintText: 'PhoneNo',
            labelText: 'PhoneNo',
            prefixIcon: const Icon(
              Icons.key,
              color: Colors.green,
            ),
            // errorText: displayError != null ? 'invalid phoneNo' : null,
            ));
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final displayError = context.select(
    //   (RegisterBloc bloc) => bloc.state.email.displayError,
    // );

    return TextField(
      key: const Key('registerForm_emailInput_textField'),
      onChanged: (email) {
        // context.read<RegisterBloc>().add(EmailChanged(email));
      },
      decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal)),
          hintText: 'Email',
          labelText: 'Email',
          prefixIcon: const Icon(
            Icons.email,
            color: Colors.green,
          ),
          // errorText: displayError != null ? 'invalid email' : null,
          suffixStyle: const TextStyle(color: Colors.green)),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final displayError = context.select(
    //   (RegisterBloc bloc) => bloc.state.password.displayError,
    // );

    return TextField(
        key: const Key('registerForm_passwordInput_textField'),
        onChanged: (password) {
          // context.read<RegisterBloc>().add(PasswordChanged(password));
        },
        obscureText: true,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.teal)),
            hintText: 'Password',
            labelText: 'Password',
            prefixIcon: const Icon(
              Icons.key,
              color: Colors.green,
            ),
            // errorText: displayError != null ? 'invalid password' : null,
            suffixIcon: const Icon(
              Icons.visibility,
              color: Colors.green,
            )));
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final displayError = context.select(
    //   (RegisterBloc bloc) => bloc.state.confirmPassword.displayError,
    // );

    return TextField(
        key: const Key('registerForm_confirmpasswordInput_textField'),
        onChanged: (confirmPassword) {
          // context.read<RegisterBloc>().add(ConfirmPasswordChanged(confirmPassword));
        },
        obscureText: true,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.teal)),
            hintText: 'ConfirmPassword',
            labelText: 'ConfirmPassword',
            prefixIcon: const Icon(
              Icons.key,
              color: Colors.green,
            ),
            // errorText: displayError != null ? 'invalid Confirmpassword' : null,
            suffixIcon: const Icon(
              Icons.visibility,
              color: Colors.green,
            )));
  }
}

class _RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final isInProgressOrSuccess = context.select(
    //   (RegisterBloc bloc) => bloc.state.status.isInProgressOrSuccess,
    // );

    // if (isInProgressOrSuccess) return const CircularProgressIndicator();

    // final isValid = context.select((RegisterBloc bloc) => bloc.state.isValid);

    // print(isValid);

    return ElevatedButton(
      key: const Key('registerForm_continue_raisedButton'),
      onPressed: (){
        
      },
      // onPressed: isValid
      //     ? () => context.read<RegisterBloc>().add(const RegisterPressed())
      //     : null,
      child: const Text('Register'),
    );
  }
}