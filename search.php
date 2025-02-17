<?php
require_once 'config/db_connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $ingredients = isset($_POST['ingredients']) ? $_POST['ingredients'] : [];
    $prep_time = isset($_POST['prep_time']) ? (int)$_POST['prep_time'] : 0;

    // Build the query based on selected ingredients and prep time
    $query = "SELECT DISTINCT r.* FROM recipes r
             INNER JOIN recipe_ingredients ri ON r.id = ri.recipe_id
             WHERE 1=1";

    if (!empty($ingredients)) {
        $placeholders = str_repeat('?,', count($ingredients) - 1) . '?';
        $query .= " AND ri.ingredient_id IN ($placeholders)";
    }

    if ($prep_time > 0) {
        $query .= " AND r.prep_time <= ?";
    }

    $query .= " GROUP BY r.id";
    
    try {
        $stmt = $pdo->prepare($query);
        $params = $ingredients;
        if ($prep_time > 0) {
            $params[] = $prep_time;
        }
        $stmt->execute($params);
        
        if ($stmt->rowCount() > 0) {
            while ($recipe = $stmt->fetch()) {
                ?>
                <div class="col-md-4 mb-4">
                    <div class="card h-100 shadow-sm">
                        <img src="images/<?php echo htmlspecialchars($recipe['image_url']); ?>" 
                             class="card-img-top" alt="<?php echo htmlspecialchars($recipe['title']); ?>"
                             onerror="this.src='images/default-recipe.jpg'">
                        <div class="card-body">
                            <h5 class="card-title"><?php echo htmlspecialchars($recipe['title']); ?></h5>
                            <p class="card-text"><?php echo htmlspecialchars($recipe['description']); ?></p>
                            <p class="card-text">
                                <small class="text-muted">
                                    Prep time: <?php echo $recipe['prep_time']; ?> mins | 
                                    Cooking time: <?php echo $recipe['cooking_time']; ?> mins
                                </small>
                            </p>
                        </div>
                    </div>
                </div>
                <?php
            }
        } else {
            echo '<div class="col-12 text-center"><p class="alert alert-info">No recipes found with the selected ingredients and criteria.</p></div>';
        }
    } catch (PDOException $e) {
        echo '<div class="col-12 text-center"><p class="alert alert-danger">An error occurred while searching for recipes.</p></div>';
    }
}
?>
