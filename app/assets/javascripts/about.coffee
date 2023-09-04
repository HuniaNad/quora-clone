$(document).on 'click', '#nav-profile-tab', ->
    $.ajax 
        type: 'GET'
        url: "/about"
        error: (xhr) ->
            console.log(xhr.statusText)

$(document).on 'click', '#nav-topics-tab', ->
    $.ajax 
        type: 'GET'
        url: "/about/followed_topics"
        error: (xhr) ->
            console.log(xhr.statusText)

$(document).on 'click', '#nav-questions-tab', ->
    $.ajax 
        type: 'GET'
        url: "/about/questions"
        error: (xhr) ->
            console.log(xhr.statusText)

$(document).on 'click', '#nav-answers-tab', ->
    $.ajax 
        type: 'GET'
        url: "/about/answers"
        error: (xhr) ->
            console.log(xhr.statusText)
 