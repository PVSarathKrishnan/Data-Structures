import 'dart:collection';
import 'dart:developer';

class Graph{
  HashMap<int,List<int>> graph = HashMap();

  void insert(int vertex,int edge,bool bi){
    if(!graph.containsKey(edge)){
      graph[edge] = [];
    }
    if(!graph.containsKey(vertex)){
      graph[vertex] =[];
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
    }
    graph.forEach((key, value) {
      value.remove(data);
    });
  }

  void bfs(int startVertex){
    Queue<int> queue = Queue();
    Set<int> visited = Set();
    queue.add(startVertex);
    visited.add(startVertex);
    while(queue.isNotEmpty){
      int current = queue.removeFirst();
      print(current);
      
      List<int>? lists = graph[current];
      if(lists != null){
        for(int n in lists){
          if(!visited.contains(n)){
            queue.add(n);
            visited.add(n);
          }
        }
      }
    }
    graph.keys.forEach((vertex) {
      if(visited.contains(vertex)){
        print("disc:$vertex");
      }
    });
    graph.keys.forEach((vertex) {
      if(!visited.contains(vertex)){
        print("disc : $vertex");
      }
    });
  }

 
  void dfsTraversal(int startIndex,Set<int>visited){
    print(startIndex);
    visited.add(startIndex);
    List<int>? neighbours = graph[startIndex];
    if(neighbours != null){
      for(int n in neighbours){
        if(!visited.contains(n)){
          dfsTraversal(n,visited);
        }
      }
    }
  }

   void dfs(){
    Set<int>visited =Set();
    graph.keys.forEach((vertex) {
      if(!visited.contains(vertex)){
        dfsTraversal(vertex, visited);
      }
    });
  }

 
}

void main(){
  Graph g = Graph();
    g.insert(10, 2, true);
  g.insert(2, 4, true);
  g.insert(4, 8, true);
  g.insert(18, 8, false);
  g.insert(23, 4, false);

  // g.display();
// g.bfs(10);
  g.dfs();
}