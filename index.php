<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recipe Finder - Find Recipes by Ingredients</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="#">Recipe Finder</a>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h2 class="card-title text-center mb-4">Find Recipes by Ingredients</h2>
                        <form id="recipe-search-form" method="POST" action="search.php">
                            <div class="mb-3">
                                <label for="ingredients" class="form-label">Select Ingredients:</label>
                                <select class="form-control" id="ingredients" name="ingredients[]" multiple>
                                    <?php
                                    require_once 'config/db_connect.php';
                                    $stmt = $pdo->query("SELECT * FROM ingredients ORDER BY name");
                                    while ($row = $stmt->fetch()) {
                                        echo "<option value='" . $row['id'] . "'>" . htmlspecialchars($row['name']) . "</option>";
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="prep_time" class="form-label">Maximum Preparation Time (minutes):</label>
                                <input type="number" class="form-control" id="prep_time" name="prep_time" min="0">
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Find Recipes</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-5" id="recipe-results">
            <?php
            $stmt = $pdo->query("SELECT * FROM recipes LIMIT 3");
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
            ?>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
