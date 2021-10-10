import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflapp/core/dependency_injection/dependency_injection.dart';
import 'bloc/authentication_bloc.dart';
import 'widgets/background_login.dart';
import '../navigation/navigation_page.dart';
import '../../widgets/button_widget.dart';

class IntroLoginPage extends StatefulWidget {
  static const String routeName = 'intro_login';
  const IntroLoginPage({Key? key}) : super(key: key);

  @override
  State<IntroLoginPage> createState() => _IntroLoginPageState();
}

class _IntroLoginPageState extends State<IntroLoginPage> {
  bool _isVisible = true;

  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationAuthenticated) {
          Navigator.pushNamedAndRemoveUntil(
              context, NavigationPage.routeName, (route) => false);
        }
        if (state is AuthenticationAuthenticationFailed) {
          _passwordController.text = '';
          _usernameController.text = '';
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: BackgroundLoginWidget(
            content: Stack(
              fit: StackFit.expand,
              children: [
                Visibility(
                  visible: _isVisible,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonWidget(
                        onPressed: () {},
                        child: const Text('Sign up'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonWidget(
                        onPressed: () {
                          setState(() {
                            _isVisible = false;
                          });

                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              setState(() {
                                                _isVisible = true;
                                              });
                                            },
                                            icon: const Icon(Icons.close)),
                                        TextField(
                                          controller: _usernameController,
                                          decoration: const InputDecoration(
                                              hintText: 'Name'),
                                        ),
                                        TextField(
                                          controller: _passwordController,
                                          obscureText: true,
                                          decoration: const InputDecoration(
                                            hintText: 'Password',
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        ButtonWidget(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              instance<AuthenticationBloc>()
                                                  .add(
                                                LogInButtonPressed(
                                                  _usernameController.text,
                                                  _passwordController.text,
                                                ),
                                              );
                                            },
                                            child: const Text('Log in'),
                                            buttonType: ButtonType.secondary),
                                      ],
                                    ),
                                  ),
                                );
                              }).whenComplete(() => {
                                setState(() {
                                  _isVisible = true;
                                })
                              });
                        },
                        child: const Text('Log in'),
                        buttonType: ButtonType.secondary,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                              color: Theme.of(context).colorScheme.onPrimary,
                            )),
                          ),
                          child: const Text('Forgot password?'),
                        ),
                      ),
                    ],
                  ),
                ),
                if (state is AuthenticationLoading)
                  Container(
                      color: Colors.black87,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Loading',
                          ),
                        ],
                      ))
              ],
            ),
          ),
        );
      },
    );
  }
}
