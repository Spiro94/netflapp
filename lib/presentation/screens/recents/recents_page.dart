import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/dependency_injection/dependency_injection.dart';
import '../../../core/utils/constants.dart';
import '../../../data/models/tv_show_model.dart';
import '../details/details_page.dart';
import 'bloc/recents_bloc.dart';
import '../../widgets/loading_widget.dart';

class RecentsPage extends StatefulWidget {
  static const title = 'Recent';
  const RecentsPage({Key? key}) : super(key: key);

  @override
  State<RecentsPage> createState() => _RecentsPageState();
}

class _RecentsPageState extends State<RecentsPage> {
  @override
  void initState() {
    instance<RecentsBloc>().add(LoadRecent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<RecentsBloc, RecentsState>(
      builder: (context, state) {
        if (state is RecentsLoading) {
          return const Center(
            child: LoadingWidget(),
          );
        } else if (state is RecentsLoaded) {
          return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: state.recent.length,
              separatorBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(
                    bottom: 30,
                    top: 30,
                  ),
                  child: Divider(
                    thickness: 2,
                  ),
                );
              },
              itemBuilder: (context, index) {
                TvShowModel recent = state.recent[index];
                return GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.pushNamed(context, DetailsPage.routeName,
                        arguments: recent);
                  },
                  child: SizedBox(
                    height: size.height * 3 / 5,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Image(
                              height: size.height / 2,
                              image:
                                  NetworkImage(imageUrl + (recent.posterPath))),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          recent.name,
                          overflow: TextOverflow.clip,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ],
                    ),
                  ),
                );
              });
        } else if (state is RecentsLoadedFailed) {
          return const Center(
            child: Text('Error obtaining data'),
          );
        } else {
          return const Center(
            child: Text('No recent Tv Shows.'),
          );
        }
      },
    );
  }
}
