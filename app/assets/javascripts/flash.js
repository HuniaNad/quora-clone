$(document).on('turbolinks:load', function() {
    $('[data-toggle="tooltip"]').tooltip()
    $('[data-toggle="dropdown"]').tooltip()

    const flashMessage = document.querySelector('.flash-message');
    if (flashMessage) {
        setTimeout(function() {
            flashMessage.classList.add('hide');
            setTimeout(function() {
                flashMessage.style.display = 'none';
            }, 5000); 
        }, 2000);
    }
});