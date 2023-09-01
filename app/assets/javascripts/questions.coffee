$(document).on 'turbolinks:load', ->

  $(document).ready ->
    $('.select2').select2()

  $('.question-card').each ->
    qId = $(this).data('q-id')
    answersContainer = this.querySelector("div .answers-container")
    if qId && answersContainer
      $.ajax
        type: 'GET'
        url: "/questions/#{qId}/answers"
        dataType: 'json'
        success: (data) ->
          for answer in data
            answerContainerStyling(answersContainer)
            el = document.createElement('div')
            el.classList.add('text-capitalize')

            answerContent = document.createElement('h6')
            answerLikes = document.createElement('small')
            generateAnswerBody(el, answerContent, answerLikes, answer)

            seperator = document.createElement('hr')
            el.append(seperator)
            answersContainer.append(el)
        error: (xhr) ->
          $('.error-msg-answer').text("#{xhr.status}: #{xhr.statusText}")

answerContainerStyling = (answersContainer) ->
  answersContainer.classList.add('card')
  answersContainer.classList.add('card-body')
  answersContainer.classList.add('w-100')

generateAnswerBody = (el, answerContent, answerLikes, answer) ->
  answerContent.append("#{answer.body}")
  answerLikes.classList.add('text-muted')
  answerLikes.append("Upvotes: #{answer.upvotes_count}")
  el.append(answerContent)
  el.append(answerLikes)
