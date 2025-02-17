$(document).ready(function() {
    // Initialize Select2 for ingredient selection
    $('#ingredients').select2({
        placeholder: 'Select ingredients you have...',
        allowClear: true,
        theme: 'classic',
        width: '100%'
    });

    // Handle form submission
    $('#recipe-search-form').on('submit', function(e) {
        e.preventDefault();
        
        $.ajax({
            url: 'search.php',
            method: 'POST',
            data: $(this).serialize(),
            success: function(response) {
                $('#recipe-results').html(response);
            },
            error: function() {
                alert('An error occurred while searching for recipes.');
            }
        });
    });
});
