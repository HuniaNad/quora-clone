$(document).on 'click', '#nav-profile-tab', ->
    $.ajax 
        type: 'GET'
        url: "/about"
        error: (xhr) ->
            # $('.error-msg').text("#{xhr.status}: #{xhr.statusText}")
            console.log(xhr.statusText)

$(document).on 'click', '#nav-topics-tab', ->
    $.ajax 
        type: 'GET'
        url: "/about/followed_topics"
        error: (xhr) ->
            # $('.error-msg').text("#{xhr.status}: #{xhr.statusText}")
            console.log(xhr.statusText)

$(document).on 'click', '#nav-questions-tab', ->
    $.ajax 
        type: 'GET'
        url: "/about/questions"
        error: (xhr) ->
            # $('.error-msg').text("#{xhr.status}: #{xhr.statusText}")
            console.log(xhr.statusText)

$(document).on 'click', '#nav-answers-tab', ->
    $.ajax 
        type: 'GET'
        url: "/about/answers"
        error: (xhr) ->
            # $('.error-msg').text("#{xhr.status}: #{xhr.statusText}")
            console.log(xhr.statusText)
 