import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';
import 'detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MovieProvider>(context, listen: false).fetchMovie();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List'),
      ),
      body: Consumer<MovieProvider>(
        builder: (context, movieProvider, child) {
          if (movieProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (movieProvider.movies.isEmpty) {
            return const Center(child: Text('No movies found'));
          }
          return ListView.builder(
            itemCount: movieProvider.movies.length,
            itemBuilder: (context, index) {
              final movie = movieProvider.movies[index];
              return ListTile(
                leading: movie.imgUrl != null
                    ? Image.network(movie.imgUrl!, width: 50, fit: BoxFit.cover)
                    : const Icon(Icons.movie),
                title: Text(movie.title ?? '-'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rating: ${movie.rating ?? '-'}'),
                    Text('Genre: ${movie.genre?.join(', ') ?? '-'}'),
                    Text('Duration: ${movie.duration ?? '-'}'),
                  ],
                ),
                isThreeLine: true,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        movie: movie,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}