import 'package:flutter/material.dart';

class ChapterIndexCard extends StatefulWidget {
  final Map<String, dynamic> data;

  ChapterIndexCard({this.data});

  @override
  _ChapterIndexCardState createState() => _ChapterIndexCardState(data);
}

class _ChapterIndexCardState extends State<ChapterIndexCard> {
  final Map<String, dynamic> data;
  bool _descExpanded = false;

  _ChapterIndexCardState(this.data);

  Widget _titleOverlay() {
    return IgnorePointer(
      child: Container(
        color: Colors.white.withAlpha(180),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: Text(
                  data['title'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Icon(
              Icons.check_circle_outline,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );

  }

  Widget _titleSection() {
    return SizedBox(
      height: 200,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
            child: Ink.image(
              image: AssetImage('assets/images/education1.jpg'),
              width: 1000,
              height: 1000,
              fit: BoxFit.cover,
              child: InkWell(
                onTap: () => print('Going to a specific chapter page now!.... or not...'),
                child: null,
              ),
            ),
          ),
          _titleOverlay(),
        ],
      ),
    );
  }

  Widget _descriptionSection() {
    return InkWell(
      onTap: () {
        setState(() {
          _descExpanded = !_descExpanded;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AnimatedContainer(
                padding: EdgeInsets.all(10),
                duration: Duration(seconds: 1),
                child: Text(data['description'],
                    maxLines: _descExpanded ? 100 : 1,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            _descExpanded ? Icon(Icons.expand_less) : Icon(Icons.expand_more),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 30),
      elevation: 5,
      child: Column(
        children: <Widget>[
          _titleSection(),
          _descriptionSection(),
        ],
      ),
    );
  }
}
