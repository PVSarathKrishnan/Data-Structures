
import 'dart:collection';

class Graph{

  HashMap<int,List<int>> graph = HashMap();

  void insert(int vertex,int edge,bool bi){
    if(!graph.containsKey(vertex)){
      graph[vertex]=[];
    }
    if(!graph.containsKey(edge)){
      graph[edge] = [];
    }
    graph[vertex]?.add(edge);
    if(bi){
      graph[edge]?.add(vertex);
    }
  }

  void display(){
    graph.forEach((key, value) {
      print("$key : $value");
    });
  }

  void remove(int data){
    if(graph.containsKey(data)){
      graph.remove(data);
      graph.forEach((key, value) {
        value.remove(data);
      });
    }
  }

  void bfs(int startvertex){
    Queue<int> queue = Queue();
    Set<int>visited = Set();

    queue.add(startvertex);
    visited.add(startvertex);

    while(queue.isNotEmpty){
      int currentVertex = queue.removeFirst();
      print(currentVertex);

      
    }
  }

}

void main(){
  Graph g = Graph();

  g.insert(5, 10, true);
  g.insert(6, 10, false);
  g.insert(5, 10, false);

  g.remove(6);

  g.display();
}