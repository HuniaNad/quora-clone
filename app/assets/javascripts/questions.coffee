$ ->
    $('.question-card').each ->
        qId = $(this).data('q-id')
        answersContainer = this.querySelector("div .answers-container")
        $.ajax
            type: 'GET'
            url: "/questions/#{qId}/answers"
            dataType: 'json'
            success: (data) ->
                console.log("->  ", data)
                for answer in data
                    answerContainerStyling(answersContainer)
                    el = document.createElement('div')
                    el.classList.add('text-capitalize')

                    answerContent = document.createElement('h6')
                    answerLikes = document.createElement('p')
                    generateAnswerBody(el, answerContent, answerLikes, answer)

                    seperator = document.createElement('hr')
                    el.append(seperator)
                    answersContainer.append(el)
            error: (xhr, status, error) ->
                console.log("AJAX error:", error)

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