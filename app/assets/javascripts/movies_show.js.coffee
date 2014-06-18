
$(document).ready ->
  $("#link_rate").click -> 
    $.get( "/movies/#{movie_id}/rate", {stars: $("#stars").val()});