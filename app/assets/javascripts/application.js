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
  $(".notify-btn .btn").click(function (e) {
    var id = $('input[name="id"]').val();
    $.ajax({
      url: "invites/" + id,
      type: 'PUT',
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      data: {
        accepted: $(e.target).attr("value")
      },
      error: function(XMLHttpRequest, errorTextStatus, error){
        console.log("Failed: "+ errorTextStatus+" ;"+error);
      },
      success: function(){
        alert(true);
      }
    });
  });
  $("#success-alert").fadeTo(2000, 500).slideUp(500);
  $(document).click(function(e){
    if(e.target.id == "notify-cl"){
      $("#notify").toggle();
    }
    else if($("#notify").is(':visible') && e.target.id != "notify-cl" && e.target.id != "notify")
    {
      $("#notify").hide();
    }
  });
});
