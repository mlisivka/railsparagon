//= require jquery
//= require bootstrap-sprockets
$(document).ready(function() {
  $(".dropdown-menu li a").click(function(){
    var selText = $(this).text();
    $(this).parents('.team-select').removeClass('open').find('[data-bind="label"]').text(selText);
  });
  $('#team_id').change(function() {
    $.ajax({
      type: 'GET',
      data: {
        team_id: $("#team_id option:selected").val()
      },
      dataType: "script",
      error: function(XMLHttpRequest, errorTextStatus, error){
        console.log("Failed: "+ errorTextStatus+" ;"+error);
      }
    });
  });
  $("#success-alert").fadeTo(2000, 500).slideUp(500);
  $(document).click(function(e){
    if(e.target.id == "notify-cl"){
      $("#demo").toggle();
    }
    else if($("#demo").is(':visible') && e.target.id != "notify-cl")
    {
      $("#demo").hide();
    }
  });
});
