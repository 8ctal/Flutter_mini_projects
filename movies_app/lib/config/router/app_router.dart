import 'package:go_router/go_router.dart';
import 'package:movies_app/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
        path: '/home/:page',
        name: HomeScreen.name,
        builder: (context, state) {
          final pageIndex = int.parse(state.pathParameters['page'] ?? '0');

          return HomeScreen(pageIndex: pageIndex);
        },
        routes: [
          GoRoute(
            path: 'movie/:id',
            name: MovieScreen.name,
            builder: (context, state) {
              final movieId = state.pathParameters['id'] ?? 'no-id';

              return MovieScreen(movieId: movieId);
            },
          ),
        ]),
    GoRoute(
      path: '/',
      redirect: (_, __) => '/home/0',
    ),
  ],
);

//* This is the way to use the ShellRoute without preserving the state
    // ShellRoute(
    //     builder: (context, state, child) {
    //       return HomeScreen(childView: child);
    //     },
    //     routes: [
    //       GoRoute(
    //           path: '/',
    //           builder: (context, state) {
    //             return const HomeView();
    //           },
    //           routes: [
    //             GoRoute(
    //               path: 'movie/:id',
    //               name: MovieScreen.name,
    //               builder: (context, state) {
    //                 final movieId = state.pathParameters['id'] ?? 'no-id';

    //                 return MovieScreen(movieId: movieId);
    //               },
    //             ),
    //           ]),
    //       GoRoute(
    //         path: '/favorites',
    //         builder: (context, state) {
    //           return const FavoritesView();
    //         },
    //       ),
    //     ]),
 //* Base case
//     GoRoute(
//         path: '/',
//         name: HomeScreen.name,
//         builder: (context, state) => const HomeScreen(
//               childView: HomeView(),
//             ),
//         routes: [
//           GoRoute(
//             path: 'movie/:id',
//             name: MovieScreen.name,
//             builder: (context, state) {
//               final movieId = state.pathParameters['id'] ?? 'no-id';

//               return MovieScreen(movieId: movieId);
//             },
//           ),
//         ]),
//   ],
// );
