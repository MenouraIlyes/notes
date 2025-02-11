import 'package:flutter/material.dart';

class CustomNoteCard extends StatefulWidget {
  final String title;
  final String content;
  final String timestamp;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;

  const CustomNoteCard({
    super.key,
    required this.title,
    required this.content,
    required this.timestamp,
    this.isFavorite = false,
    required this.onFavoritePressed,
  });

  @override
  State<CustomNoteCard> createState() => _CustomNoteCardState();
}

class _CustomNoteCardState extends State<CustomNoteCard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10.0,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Favorite Button
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    widget.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: widget.isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: widget.onFavoritePressed,
                ),
              ],
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              widget.content,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          // Timestamp
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              widget.timestamp,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
