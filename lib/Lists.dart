

class Task{
  late String TaskName ;
  late bool isDone ;

  Task({required this.TaskName , required this.isDone}) ;

  bool DoneCheck(){
    return isDone=!isDone ;

  }

}