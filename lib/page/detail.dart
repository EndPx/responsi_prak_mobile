import 'package:flutter/material.dart';
import '../models/movie.dart';

class DetailPage extends StatelessWidget {
  final Movie movie;
  const DetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title ?? 'Detail Movie'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: movie.imgUrl != null
                  ? Image.network(
                      movie.imgUrl!,
                      width: 200,
                      height: 300,
                      fit: BoxFit.cover,
                    )
                  : const Icon(Icons.movie, size: 100),
            ),
            const SizedBox(height: 16),
            Text(
              movie.title ?? '-',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 20),
                const SizedBox(width: 4),
                Text('Rating: ${movie.rating ?? '-'}'),
              ],
            ),
            
            const SizedBox(height: 8),
            Text('Genre: ${movie.genre?.join(', ') ?? '-'}'),
            const SizedBox(height: 8),
            Text('Duration: ${movie.duration ?? '-'}'),
            const SizedBox(height: 8),
            Text('Create Date: ${movie.createDate ?? '-'}'),
            const SizedBox(height: 8),
            Text('Release Date: ${movie.releaseDate ?? '-'}'),
            const SizedBox(height: 8),
            Text('Language: ${movie.language ?? '-'}'),
            const SizedBox(height: 8),
            Text('Director: ${movie.director ?? '-'}'),
            const SizedBox(height: 8),
            Text('Cast: ${movie.cast?.join(', ') ?? '-'}'),
            const SizedBox(height: 16),
            const Text(
              'Description:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(movie.description ?? '-'),
          ],
        ),
      ),
    );
  }
}