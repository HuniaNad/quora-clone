$(document).on 'click', '.follow-button', ->
    entityId = $(this).data('id')
    
    if entityId
        this.toggleAttribute('enabled')
        $.ajax
            type: 'POST'
            url: "/topics/#{entityId}/follow"
            dataType: 'json'
            success: (response) -> 
                $('.follow-count-' + entityId).text(response.follow_count)
            error: (xhr) ->
                $('.error-msg-follow').text("#{xhr.status}: #{xhr.statusText}")



    