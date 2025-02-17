-- Create database
CREATE DATABASE IF NOT EXISTS recipe_finder;
USE recipe_finder;

-- Create recipes table
CREATE TABLE IF NOT EXISTS recipes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    prep_time INT,
    cooking_time INT,
    image_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create ingredients table
CREATE TABLE IF NOT EXISTS ingredients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    UNIQUE(name)
);

-- Create recipe_ingredients table for many-to-many relationship
CREATE TABLE IF NOT EXISTS recipe_ingredients (
    recipe_id INT,
    ingredient_id INT,
    quantity VARCHAR(50),
    FOREIGN KEY (recipe_id) REFERENCES recipes(id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(id),
    PRIMARY KEY (recipe_id, ingredient_id)
);

-- Insert vegetarian recipes
INSERT INTO recipes (title, description, prep_time, cooking_time, image_url) VALUES
('Vegetable Biryani', 'Aromatic Indian rice dish with mixed vegetables and authentic spices', 30, 45, 'veg-biryani.jpg'),
('Mushroom Risotto', 'Creamy Italian rice dish with mushrooms and parmesan cheese', 20, 30, 'mushroom-risotto.jpg'),
('Spinach and Corn Pasta', 'Healthy pasta dish with fresh spinach and sweet corn in creamy sauce', 15, 20, 'spinach-pasta.jpg'),
('Vegetable Curry', 'Rich and spicy mixed vegetable curry with coconut milk', 25, 35, 'veg-curry.jpg'),
('Mediterranean Salad', 'Fresh salad with cucumber, tomatoes, olives, and feta cheese', 15, 0, 'med-salad.jpg');

-- Insert vegetarian ingredients
INSERT INTO ingredients (name) VALUES
('basmati rice'), ('mixed vegetables'), ('biryani masala'), ('saffron'),
('arborio rice'), ('mushrooms'), ('parmesan cheese'), ('vegetable stock'),
('pasta'), ('spinach'), ('corn'), ('cream'),
('coconut milk'), ('curry powder'), ('tomatoes'), ('onions'),
('cucumber'), ('olives'), ('feta cheese'), ('bell peppers'),
('garlic'), ('ginger'), ('turmeric'), ('coriander leaves'),
('olive oil'), ('black pepper'), ('salt'), ('lemon juice');

-- Insert recipe-ingredient relationships
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity) VALUES
-- Vegetable Biryani
(1, 1, '2 cups'), -- basmati rice
(1, 2, '2 cups'), -- mixed vegetables
(1, 3, '2 tbsp'), -- biryani masala
(1, 4, '1/4 tsp'), -- saffron
(1, 21, '4 cloves'), -- garlic
(1, 22, '1 inch'), -- ginger

-- Mushroom Risotto
(2, 5, '1.5 cups'), -- arborio rice
(2, 6, '300g'), -- mushrooms
(2, 7, '1/2 cup'), -- parmesan cheese
(2, 8, '4 cups'), -- vegetable stock
(2, 21, '2 cloves'), -- garlic

-- Spinach and Corn Pasta
(3, 9, '250g'), -- pasta
(3, 10, '2 cups'), -- spinach
(3, 11, '1 cup'), -- corn
(3, 12, '1 cup'), -- cream
(3, 26, '1 tsp'), -- black pepper

-- Vegetable Curry
(4, 2, '3 cups'), -- mixed vegetables
(4, 13, '400ml'), -- coconut milk
(4, 14, '2 tbsp'), -- curry powder
(4, 15, '2 medium'), -- tomatoes
(4, 16, '1 large'), -- onions

-- Mediterranean Salad
(5, 17, '1 large'), -- cucumber
(5, 15, '2 medium'), -- tomatoes
(5, 18, '1/2 cup'), -- olives
(5, 19, '100g'), -- feta cheese
(5, 25, '2 tbsp'), -- olive oil
(5, 28, '2 tbsp'); -- lemon juice
