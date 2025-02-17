<?php
// Set the content type header to image/jpeg
header('Content-Type: image/jpeg');

// Create a 400x300 image
$width = 400;
$height = 300;
$image = imagecreatetruecolor($width, $height);

// Define colors
$bg_color = imagecolorallocate($image, 240, 240, 240);  // Light gray background
$text_color = imagecolorallocate($image, 100, 100, 100); // Dark gray text
$border_color = imagecolorallocate($image, 200, 200, 200); // Border color

// Fill the background
imagefill($image, 0, 0, $bg_color);

// Add a border
imagerectangle($image, 0, 0, $width-1, $height-1, $border_color);

// Add text
$text = "Recipe Image";
$font_size = 5; // Built-in font size (1-5)

// Get text dimensions
$text_width = imagefontwidth($font_size) * strlen($text);
$text_height = imagefontheight($font_size);

// Calculate text position for center alignment
$text_x = ($width - $text_width) / 2;
$text_y = ($height - $text_height) / 2;

// Add the text to the image
imagestring($image, $font_size, $text_x, $text_y, $text, $text_color);

// Create a pattern of cooking icons (simple shapes)
for ($i = 0; $i < 5; $i++) {
    for ($j = 0; $j < 4; $j++) {
        // Draw small circles representing cooking items
        imageellipse($image, 
            50 + ($i * 80), 
            50 + ($j * 70), 
            20, 20, 
            $text_color
        );
    }
}

// Output the image
imagejpeg($image, dirname(__FILE__) . '/images/default-recipe.jpg', 90);

// Free up memory
imagedestroy($image);

// If accessed directly, redirect to index
if (basename($_SERVER['PHP_SELF']) == basename(__FILE__)) {
    header('Location: index.php');
    exit();
}
?>
