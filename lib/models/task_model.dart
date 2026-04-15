//provider is a service. Can be renamed as Services


class Task{
final String? id;
final String? title;
final bool completed;
// the cascading operatior " ... " will be used to fill in with THIS^

Task({this.id, this.title, this.completed = false});

}

// const stays change during run time and compile time
// var opts out of type safety
// late is when you want to declare or initialize late
// let is bloc scope