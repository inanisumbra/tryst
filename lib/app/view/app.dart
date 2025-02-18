import 'package:authentication_repository/authentication_repository.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tryst/app/app.dart';
import 'package:tryst/home/widgets/liquid_model.dart';
import '../../theme/util.dart';
import '../../theme/theme.dart';
class App extends StatelessWidget
{
    const App({
        required AuthenticationRepository authenticationRepository,
        super.key
    }) : _authenticationRepository = authenticationRepository;
    final AuthenticationRepository _authenticationRepository;
    @override
    Widget build(BuildContext context)
    {
        return ChangeNotifierProvider(create: ( context) => LiquidModel(),
            child: RepositoryProvider.value(
                value: _authenticationRepository,
                child: BlocProvider(
                    lazy: false,
                    create: ( _) => AppBloc(
                        authenticationRepository: _authenticationRepository
                    )..add(const AppUserSubscriptionRequested()),
                    child: const AppView()
                )
            )
        );
    }
}
class AppView extends StatelessWidget
{
    const AppView({super.key});
    @override
    Widget build(BuildContext context)
    {
        TextTheme textTheme = createTextTheme(context, "Roboto Flex", "Lato");
        MaterialTheme theme = MaterialTheme(textTheme);
        return MaterialApp(
            theme: theme.dark(),
            home: FlowBuilder<AppStatus>(
                state: context.select((AppBloc bloc) => bloc.state.status),
                onGeneratePages: onGenerateAppViewPages
            )
        );
    }
}
