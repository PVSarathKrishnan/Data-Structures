import 'dart:collection';

class Graph {

  HashMap<int, List<int>> graph = HashMap();

  void insert(int vertex, int edge, bool isBidirect) {
    if (!graph.containsKey(vertex)) {
      graph[vertex] = [];
    }
    if (!graph.containsKey(edge)) {
      graph[edge] = [];
    }
    graph[vertex]!.add(edge);
    if (isBidirect) {
      graph[edge]!.add(vertex);
    }
  }

  void display() {
    graph.forEach((key, value) {
      print("$key : $value");
    });
  }

  void remove(int data) {
    if (graph.containsKey(data)) {
      graph.remove(data);
      graph.forEach((key, value) {
        value.remove(data);
      });
    }
  }

  void bfsTraversal(int startVertex) {
    Queue<int> queue = Queue();
    Set<int> visited = Set();

    queue.add(startVertex);
    visited.add(startVertex);

    while (queue.isNotEmpty) {
      int currentVertex = queue.removeFirst();
      print(currentVertex);

      List<int>? lists = graph[currentVertex];
      if (lists != null) {
        for (int neighbor in lists) {
          if (!visited.contains(neighbor)) {
            queue.add(neighbor);
            visited.add(neighbor);
          }
        }
      }
    }

    graph.keys.forEach((vertex) {
      if (!visited.contains(vertex)) {
        print("Disconnected Vertex: $vertex");
      }
    });
  }

  void dfsTraversal(int startVertex, Set<int> visited) {
    print(startVertex);
    visited.add(startVertex);

    List<int>? neighbors = graph[startVertex];
    if (neighbors != null) {
      for (int neighbor in neighbors) {
        if (!visited.contains(neighbor)) {
          dfsTraversal(neighbor, visited);
        }
      }
    }
  }

  void dfs() {
    Set<int> visited = Set();

    graph.keys.forEach((vertex) {
      if (!visited.contains(vertex)) {
        dfsTraversal(vertex, visited);
      }
    });

    // Display disconnected vertices
    graph.keys.forEach((vertex) {
      if (!visited.contains(vertex)) {
        print("Disconnected Vertex: $vertex");
      }
    });
  }
}

void main(List<String> args) {
  Graph g = Graph();
  g.insert(10, 2, true);
  g.insert(2, 4, true);
  g.insert(4, 8, true);
  g.insert(18, 8, false);
  g.insert(23, 4, false);

  g.display();

  print("");
  g.dfs();
}