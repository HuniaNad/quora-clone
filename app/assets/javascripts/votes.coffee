$(document).on 'click', '.vote-button', ->
    upvoteBtn = document.getElementById 'btn-up'
    downvoteBtn = document.getElementById 'btn-down'
    voteType = $(this).data('vote')
    questionId = $(this).data('q-id')
    
    if voteType == 'upvote' and downvoteBtn.hasAttribute('enabled')
      # Code for handling upvote with downvote already enabled
      console.log(1)
      downvoteBtn.removeAttribute('enabled')
      upvoteBtn.setAttribute('enabled', '')
      $.ajax
        type: 'POST'
        url: "/votes/#{questionId}/upvote_inc_downvote_dec"
        dataType: 'json'
        success: (response) ->
            $('.likes-count-' + questionId).text(response.upvotes_count)
 
    else if voteType == 'downvote' and upvoteBtn.hasAttribute('enabled')
      # Code for handling downvote with upvote already enabled
      console.log(1)
      upvoteBtn.removeAttribute('enabled')
      downvoteBtn.setAttribute('enabled', '')
      $.ajax
        type: 'POST'
        url: "/votes/#{questionId}/upvote_dec_downvote_inc"
        dataType: 'json'
        success: (response) ->
            $('.likes-count-' + questionId).text(response.upvotes_count)
    else
      console.log(3)
      this.toggleAttribute('enabled')
      console.log(this)
      $.ajax
        type: 'POST'
        url: "/votes/#{questionId}/#{voteType}"
        dataType: 'json'
        success: (response) ->
            if voteType == 'upvote'
                $('.likes-count-' + questionId).text(response.upvotes_count)

    