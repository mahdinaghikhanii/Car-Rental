import 'package:car/common/extension.dart';
import 'package:car/common/images.dart';
import 'package:car/data/repo/allcar_repo.dart';
import 'package:car/ui/detail/detail.dart';
import 'package:car/ui/home/bloc/home_bloc.dart';
import 'package:car/ui/home/bloc/home_event.dart';
import 'package:car/ui/home/bloc/home_state.dart';

import 'package:car/ui/widgets/item_detailcar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/dimensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        final homeBloc = HomeBloc(homeRepository);
        homeBloc.add(HomeStarted());
        return homeBloc;
      },
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SizedBox(
          width: 94,
          height: 46,
          child: BlocBuilder<HomeBloc, HomeState>(
              builder: (BuildContext context, state) {
            if (state is HomeLoading) {
              return Container();
            } else if (state is HomeFailed) {
              return Container();
            } else if (state is HomeSucess) {
              return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.smallBoderRadius),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.onPrimary),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(Images.iconFilter),
                      Text(
                        "Filter",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(),
                      )
                    ],
                  ));
            } else {
              throw " bad state";
            }
          }),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (BuildContext context, state) {
            if (state is HomeLoading) {
              return const Center(
                child: CupertinoActivityIndicator(
                  color: Colors.black,
                ),
              );
            } else if (state is HomeSucess) {
              return SafeArea(
                  child: ListView.builder(
                      physics: defaultScrollPhysics,
                      itemCount: 2,
                      itemBuilder: ((context, index) {
                        if (index == 0) {
                          return Container(
                              width: context.width,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.smallBoderRadius)),
                              margin: EdgeInsets.symmetric(
                                  horizontal: Dimensions.mediumPadding),
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.mediumPadding),
                              child: TextFormField(
                                  style: const TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    label: Row(
                                      children: [
                                        Text("Search",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall),
                                        Text("(ex, Opel Astra H)",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .surface
                                                        .withOpacity(0.5))),
                                        const Spacer(),
                                        Image.asset(
                                          Images.iconSearch,
                                          width: 16,
                                          height: 16,
                                        )
                                      ],
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.smallBoderRadius),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface
                                              .withOpacity(0.2)),
                                    ),
                                    border: InputBorder.none,
                                    hintStyle:
                                        Theme.of(context).textTheme.titleSmall,
                                  )));
                        } else if (index == 1) {
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.carEntity.length,
                              itemBuilder: ((context, index) {
                                return ItemDetailCarWidgets(
                                  ontap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: ((context) => DetailScreen(
                                                  carEntity:
                                                      state.carEntity[index],
                                                ))));
                                  },
                                  carEntity: state.carEntity[index],
                                );
                              }));
                        } else {
                          throw "bad state";
                        }
                      })));
            } else if (state is HomeFailed) {
              return Center(
                child: Text(state.exceptions.exceptions),
              );
            } else {
              throw "bad state";
            }
          },
        ),
      ),
    );
  }
}
