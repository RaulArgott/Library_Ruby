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

    $('#book_author_id').selectize({
        create: function(input, callback) {
            selectizeCallback = callback;
            $('.author').modal();
            $('#new_author').trigger('reset');
            $('#author_name').val(input);
        },
        selectOnTab: true
    });

    $('#new_publisher').on('submit', function(e) {
        e.preventDefault();
        $.ajax({
            method: "POST",
            url: $(this).attr('action'),
            data: $(this).serialize(),
            success: function(response) {
                selectizeCallback({
                    value: response.id,
                    text: response.name + ", " + response.city
                });
                selectizeCallback = null;
                $('.publisher').modal('toggle');
            }
        });
    });

    $('#book_publisher_id').selectize({
        create: function(input, callback) {
            selectizeCallback = callback;
            $('.publisher').modal();
            $('#new_publisher').trigger('reset');
            $('#publisher_name').val(input);
        },
        selectOnTab: true
    });


    $('select').selectize({
        selectOnTab: true,
        sortField: 'text'
    });
});