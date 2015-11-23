
$(document).ready(function(){

  if (top.location.pathname === '/'){

    $("#login").on("click", 'a', function(event){
      event.preventDefault();
      var link = $(this).attr("href");
      var request = $.ajax({
        url: link,
        method: "GET"
      })
      request.done(function(response){
        if ($("#login_button").length === 0){
          $("div.zipcode-form").append(response);
          $("div.zipcode-form div form").hide();
        }
      })
    })
  }
})



