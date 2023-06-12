import 'package:flutter/material.dart';
import 'package:to_do_yandex/presentation/screens/main_screen/main_screen.dart';

class ToDoElement extends StatefulWidget {
  ToDoElement({
    super.key,
    required this.index,
    required this.flavor,
    required this.F1,
    required this.F2,
  });
  Flavor flavor;
  int index;
  Function F1;
  Function F2;
  @override
  State<ToDoElement> createState() => _ToDoElementState();
}

class _ToDoElementState extends State<ToDoElement> {
  double progress = 0.0;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onUpdate: (details) {
     
        setState(() {
          progress = details.progress;
          
        }); 
      },
      key: Key(widget.flavor.name),
      background: Container(
        color: Colors.green,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: (MediaQuery.of(context).size.width)*progress-47>10?((MediaQuery.of(context).size.width)*progress-47):10),
            child: Icon(Icons.favorite, size: 10 + progress*50 < 25 ? 10 + progress*50: 25,),
          ),
        ),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: (MediaQuery.of(context).size.width)*progress-47>10?((MediaQuery.of(context).size.width)*progress-47):10),
            child: Icon(Icons.delete),
          ),
        ),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          ///
          widget.F1(widget.index, widget.flavor);
          return false;
        } else {
          bool delete = true;
          final snackbarController =
              ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 1),
              content: Text('Deleted ${widget.flavor.name}'),
              action: SnackBarAction(
                  label: 'Undo', onPressed: () => delete = false),
            ),
          );
          await snackbarController.closed;
          return delete;
        }
      },
      onDismissed: (_) {
        ///
        widget.F2(widget.index);
      },
      child: Container(
        height: 50,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text(widget.flavor.name),
            Spacer(),
            Icon(widget.flavor.isFavorite
                ? Icons.favorite
                : Icons.favorite_border),
          ]),
        ),
      ),
    );
  }
}
