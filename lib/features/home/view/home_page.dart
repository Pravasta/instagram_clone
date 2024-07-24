import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/constant/app_state.dart';
import 'package:instagram_clone/features/home/bloc/home_bloc.dart';
import 'section/appbar_section.dart';
import 'section/content_home_page_section.dart';
import 'section/content_stories_home_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final bloc = context.read<HomeBloc>();
    scrollController.addListener(
      () async {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent) {
          if (bloc.state.pages != null) {
            await Future.delayed(const Duration(seconds: 1), () {
              bloc.add(OnGetAllStoryEvent());
            });
          }
        }
      },
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.status == HomeStatusState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.status == HomeStatusState.error) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state.status == HomeStatusState.success) {
            return SafeArea(
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  const AppBarSection(),
                  ContentStoriesHomeSection(story: state.story),
                  ContentHomePageSection(state: state),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
