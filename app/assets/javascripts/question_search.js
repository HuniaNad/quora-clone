$(document).on('turbolinks:load', function () {
    $('#topics').autocomplete({
      serviceUrl: '/search/suggestions',
      paramName: 'topics',
      minChars: 3,
      transformResult: function(response) {

        return {
            suggestions: $.map($.parseJSON(response), function(item) {
                return {
                    value: item.title,
                    data: item.id,
                    id: item.id
                };
            })
        };
    },
      onSelect: function (suggestion) {
        window.location.href = '/topics/' + suggestion.data
      }
    });
  });
