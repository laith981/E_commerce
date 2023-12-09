import 'package:e_commerce_app_ui/utils/color/app_color.dart';
import 'package:e_commerce_app_ui/view_models/cubit/search_page_cubit.dart';
import 'package:e_commerce_app_ui/views/widgets/last_sarsch_widget.dart';
import 'package:e_commerce_app_ui/views/widgets/popular_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
         final cubit =SearchPageCubit();
         cubit.getSearchPageData();
         return cubit;
          },
      child: BlocBuilder<SearchPageCubit, SearchPageState>(
        builder: (context, state) {
          if (state is SearchPageLoading) {
            return const CircularProgressIndicator.adaptive();
          } else if (state is SearchPageError) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is SearchPageLoaded) {
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                title: TextFormField(
                    decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
                  hintText: "Enter ",
                  hintStyle: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: AppColors().grey),
                  prefixIcon: const Icon(Icons.search),
                )),
              ),
              body: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Last Sarsch",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Clear All",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(color: AppColors().textButtonColor),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: state.lastSarsch.map((item) {
                        return LastSarschWidget(text: item.name);
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Popular Search",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: state.popularSearch
                          .map((item) => Column(
                                children: [
                                  PopularSearchWidget(
                                      imageUrl: item.imageUrl,
                                      name: item.name,
                                      searchTimes: item.searchTimes,
                                      tipe: item.tipe),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ))
                          .toList(),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: Text(
                "Error",
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 50),
              ),
            );
          }
        },
      ),
    );
  }
}
