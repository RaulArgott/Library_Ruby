var dataTable = null;

$(document).on('turbolinks:load', function() {
    dataTable = $('#example').DataTable();
    $('.dataTables_length').addClass('bs-select');
});

document.addEventListener("turbolinks:before-cache", function() {
    if (dataTable !== null) {
        dataTable.destroy()
        dataTable = null
    }
})