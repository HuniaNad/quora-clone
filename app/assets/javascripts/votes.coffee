$(document).on 'click', '.vote-button', ->
    voteType = $(this).data('vote')
    entityId = $(this).data('id')
    entityType = $(this).data('type')
    upvoteBtn = document.querySelector('[data-id="' + entityId + '"][data-vote="upvote"]')
    downvoteBtn = document.querySelector('[data-id="' + entityId + '"][data-vote="downvote"]')
    
    if voteType == 'upvote' and downvoteBtn?.hasAttribute('enabled')
      # Code for handling upvote with downvote already enabled
      downvoteBtn.removeAttribute('enabled')
      upvoteBtn.setAttribute('enabled', '')
      $.ajax
        type: 'POST'
        url: "/#{entityType}/#{entityId}/upvote_inc_downvote_dec"
        dataType: 'json'
        success: (response) ->
            $('.likes-count-' + entityId).text(response.upvotes_count)
        error: (xhr) ->
            $('.error-msg').text("#{xhr.status}: #{xhr.statusText}")
 
    else if voteType == 'downvote' and upvoteBtn?.hasAttribute('enabled')
      # Code for handling downvote with upvote already enabled
      upvoteBtn.removeAttribute('enabled')
      downvoteBtn.setAttribute('enabled', '')
      $.ajax
        type: 'POST'
        url: "/#{entityType}/#{entityId}/upvote_dec_downvote_inc"
        dataType: 'json'
        success: (response) ->
            $('.likes-count-' + entityId).text(response.upvotes_count)
        error: (xhr) ->
            $('.error-msg').text("#{xhr.status}: #{xhr.statusText}")
    else
      this.toggleAttribute('enabled')
      $.ajax
        type: 'POST'
        url: "/#{entityType}/#{entityId}/#{voteType}"
        dataType: 'json'
        success: (response) ->
            if voteType == 'upvote'
                $('.likes-count-' + entityId).text(response.upvotes_count)
        error: (xhr) ->
            $('.error-msg-vote').text("#{xhr.status}: #{xhr.statusText}")

    