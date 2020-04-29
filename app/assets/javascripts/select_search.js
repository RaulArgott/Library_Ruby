var selectizeVarModal = null
var selectizeVar = null
$(document).on('turbolinks:load', function() {
    var selectizeCallback = null;
    $(".modal").on('hide.bs.modal', function(e) {
        if (selectizeCallback != null) {
            selectizeCallback();
            selectizeCallback = null;
        }
    });

    $('#new_author').on('submit', function(e) {
        e.preventDefault();
        $.ajax({
            method: "POST",
            url: $(this).attr('action'),
            data: $(this).serialize(),
            success: function(response) {
                selectizeCallback({
                    value: response.id,
                    text: response.name + " " + response.last_name
                });
                selectizeCallback = null;
                $('.author').modal('toggle');
            }
        });
    });

    $('#book_author').selectize({
        create: function(input, callback) {
            selectizeCallback = callback;
            $('.author').modal();
            $('#new_author').trigger('reset');
            $('#author_name').val(input);
        }
    });
    $('select').selectize({
        selectOnTab: true,
        sortField: 'text'
    });
});
$(document).on('turbolinks:before-cache', function() { // this approach corrects the select 2 to be duplicated when clicking the back button.
    $('select').selectize('destroy');
});