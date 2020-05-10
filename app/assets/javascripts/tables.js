$(document).on('turbolinks:load', function() {
    $(".table").DataTable();
    $(".loansCarousel").carousel();
});
$(document).on('turbolinks:before-cache', function() {
    $('.table').DataTable().clear().destroy();
});