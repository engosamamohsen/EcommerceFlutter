class ImageRound extends StatelessWidget {
  const ImageRound({super.key, required this.image });
  final String image;
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Text('Rounded Image Example'),
      ),
      body: Center(
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), // Border radius of 10
            image: DecorationImage(
              image: NetworkImage('https://via.placeholder.com/150'), // Replace with your image URL
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}