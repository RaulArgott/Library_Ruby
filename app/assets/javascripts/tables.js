$(document).on('turbolinks:load', function() {
    $(".table").DataTable();
});
$(document).on('turbolinks:before-cache', function() {
    $('.table').DataTable().clear().destroy();
});