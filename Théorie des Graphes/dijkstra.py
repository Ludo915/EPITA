import sys

def create_weighted_adjacency_matrix(weighted_edges, num_vertices):
    # Initialiser une matrice num_vertices x num_vertices avec des zéros
    adjacency_matrix = [[0 for _ in range(num_vertices)] for _ in range(num_vertices)]
    
    # Remplir la matrice avec les arêtes pondérées
    for edge in weighted_edges:
        u, v, weight = edge
        adjacency_matrix[u][v] = weight
        adjacency_matrix[v][u] = weight  # Supposons que le graphe est non orienté
    
    print(adjacency_matrix)
    return adjacency_matrix

def dijkstra(graph, start):
    # Nombre de sommets dans le graphe
    num_vertices = len(graph)
    print("num_vertices:", num_vertices)
    # Tableau des distances initialisé à l'infini
    distances = [sys.maxsize] * num_vertices
    distances[start] = 0
    print("distances:", distances)
    
    # Tableau pour vérifier les sommets visités
    visited = [False] * num_vertices
    print("Visited:", visited)
    for _ in range(num_vertices):
        print("Sommet:", _)
        # Trouver le sommet avec la distance minimale parmi les non visités
        min_distance = sys.maxsize
        print("min_distance", min_distance)
        min_index = -1
        print("min_index", min_index)
        for v in range(num_vertices):
            print(v)
            if not visited[v] and distances[v] < min_distance:
                min_distance = distances[v]
                min_index = v
                print("min_distance", min_distance)
                print("min_index", min_index)
        # Marquer le sommet comme visité
        visited[min_index] = True
        
        # Mettre à jour les distances des sommets adjacents
        for v in range(num_vertices):
            if graph[min_index][v] > 0 and not visited[v] and \
               distances[v] > distances[min_index] + graph[min_index][v]:
                distances[v] = distances[min_index] + graph[min_index][v]
        
        print("distances[v]:", distances[v])
    
    print("distances:", distances)
    return distances

# Exemple de graphe représenté par une matrice d'adjacence

weighted_edges = [
    (0, 1, 2), (0, 3, 1), 
    (1, 2, 3), (1, 3, 2),
    (2, 4, 7), (2, 5, 4),
    (3, 5, 5), (4, 5, 1),
    (4, 6, 6), (5, 6, 8)
]
graph = create_weighted_adjacency_matrix(weighted_edges=weighted_edges, num_vertices= 7)

# Calculer les plus courtes distances depuis le sommet 0
distances = dijkstra(graph, 0)

# Afficher les distances
print("Les distances les plus courtes depuis le sommet 0 sont :")
for i in range(len(distances)):
    print(f"Distance au sommet {i} : {distances[i]}")
