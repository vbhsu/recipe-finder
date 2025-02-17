# Recipe Finder Website

A modern web application that allows users to search for recipes based on available ingredients and preparation time.

## Features

- Search recipes by multiple ingredients
- Filter recipes by preparation time
- Responsive and modern UI design
- Real-time search results using AJAX
- Mobile-friendly interface

## Technical Stack

- PHP 7.4+
- MySQL 5.7+
- Bootstrap 5.1.3
- jQuery 3.6.0
- Select2 4.1.0 (for enhanced multi-select functionality)

## Setup Instructions

1. Database Setup:
   - Create a MySQL database named 'recipe_finder'
   - Import the `database.sql` file to create the necessary tables and sample data

2. Configuration:
   - Update database credentials in `config/db_connect.php` if needed
   - Default credentials:
     - Host: localhost
     - Username: root
     - Password: (empty)
     - Database: recipe_finder

3. Server Requirements:
   - PHP 7.4 or higher
   - MySQL 5.7 or higher
   - Apache/Nginx web server
   - PDO PHP extension enabled

4. Installation:
   - Place all files in your web server's document root
   - Ensure the web server has read/write permissions for the images directory

## Usage

1. Open the website in your browser
2. Select ingredients from the dropdown menu
3. Optionally set a maximum preparation time
4. Click "Find Recipes" to see matching recipes
5. Results will display automatically with recipe details and images
