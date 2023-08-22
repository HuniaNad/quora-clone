$(document).on 'click', '.vote-button', ->
    voteType = $(this).data('vote')
    questionId = $(this).data('q-id')

    $.ajax
        type: 'POST'
        url: "/questions/#{questionId}/#{voteType}"
        dataType: 'json'
        success: (response) ->
            $('.likes-count-' + questionId).text(response.likes_count)
        