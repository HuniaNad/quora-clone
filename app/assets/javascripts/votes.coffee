$(document).on 'click', '.vote-button', ->
    voteType = $(this).data('vote')
    questionId = $(this).data('q-id')
    upvoteBtn = document.querySelector('[data-q-id="' + questionId + '"][data-vote="upvote"]')
    downvoteBtn = document.querySelector('[data-q-id="' + questionId + '"][data-vote="downvote"]')
    console.log(voteType == 'upvote' and downvoteBtn.hasAttribute('enabled'))
    
    if voteType == 'upvote' and downvoteBtn.hasAttribute('enabled')
      # Code for handling upvote with downvote already enabled
      console.log(1)
      console.log(downvoteBtn)
      console.log(upvoteBtn)
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
      console.log(2)
      console.log(this)
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
      console.log(this)
      
      console.log(upvoteBtn)
      console.log(downvoteBtn)
      this.toggleAttribute('enabled')
      $.ajax
        type: 'POST'
        url: "/votes/#{questionId}/#{voteType}"
        dataType: 'json'
        success: (response) ->
            if voteType == 'upvote'
                $('.likes-count-' + questionId).text(response.upvotes_count)

    