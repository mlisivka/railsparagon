//= require jquery
//= require bootstrap-sprockets
$(document).ready(function() {
	var path = window.location.pathname;
  $(".dropdown-menu li a").click(function(){
    var selText = $(this).text();
    $(this).parents('.team-select').removeClass('open').find('[data-bind="label"]').text(selText);
		var team_id = $(this).data("team-id");
		$("#btn-send").click(function() {
		var id = path.substring(path.lastIndexOf('/') + 1);
			$.ajax({
				url: "/invites",
				type: 'POST',
      	beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
				data: {
					team_id: team_id,
					user_id: id
				},
	      error: function(XMLHttpRequest, errorTextStatus, error){
	        console.log("Failed: "+ errorTextStatus+" ;"+error);
					$("#pick-team").after("<div class='error_msg'>Invitation not sent!</div>");
	      },
	      success: function(){
					$("#pick-team").after("<div class='success_msg'>Invitation sent!</div>");
	      }
			});
		});
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
    var id = $(this).closest(".notify-main").find("input").val();
    $.ajax({
      url: "/invites/" + id,
      type: 'PUT',
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      data: {
        accepted: $(e.target).attr("value")
      },
      error: function(XMLHttpRequest, errorTextStatus, error){
        console.log("Failed: "+ errorTextStatus+" ;"+error);
      },
      success: function(){
        //$(this).closest('.notify-main').remove();
      }
    });
  });
  $("#success-alert").fadeTo(2000, 500).slideUp(500);
  $(document).click(function(e){
    if(e.target.id == "notify-cl"){
      $("#notify").toggle();
    }
    else if($("#notify").is(':visible') && !$(e.target).closest("#notify").length && e.target.id != "notify-cl")
    {
      $("#notify").hide();
    }
  });
});
