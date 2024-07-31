def create_weighted_adjacency_matrix(weighted_edges, num_vertices):
    # Initialiser une matrice num_vertices x num_vertices avec des zéros
    adjacency_matrix = [[0 for _ in range(num_vertices)] for _ in range(num_vertices)]
    
    # Remplir la matrice avec les arêtes pondérées
    for edge in weighted_edges:
        u, v, weight = edge
        adjacency_matrix[u][v] = weight
        adjacency_matrix[v][u] = weight  # Supposons que le graphe est non orienté
    
    return adjacency_matrix

# Liste des arêtes pondérées du graphe
weighted_edges = [(0, 1, 4), (0, 2, 1), (1, 2, 2), (2, 3, 7)]

# Nombre de sommets dans le graphe
num_vertices = 4

# Création de la matrice d'adjacence pondérée
weighted_adjacency_matrix = create_weighted_adjacency_matrix(weighted_edges, num_vertices)

# Affichage de la matrice d'adjacence pondérée
print("Matrice d'adjacence pondérée :")
for row in weighted_adjacency_matrix:
    print(row)
