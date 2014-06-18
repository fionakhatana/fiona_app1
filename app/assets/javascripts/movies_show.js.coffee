
$(document).ready ->
  $(document).on "click", "#link_rate", ->
    $.get "/movies/#{movie_id}/rate", 
    {stars: $("#stars").val()}, 
    (data) ->
      stars = $("#stars").val()
      $("#stars").remove()
      $("#link_rate").remove()
      $("label[for='rate_movie']").append(" #{stars}")
