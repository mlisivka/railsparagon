//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets

$(document).ready(function() {
  var path = window.location.pathname;
  var team_id; // id for sending invites to the player
  $(".dropdown-menu li a").click(function() {
    var selText = $(this).text();
    team_id = $(this).data("team-id");
    $(this).parents('.team-select').removeClass('open').find('[data-bind="label"]').text(selText);
  });
  $('.btn-details').click(function() { // function 'accordion' on the user/show page
    if ($(this).hasClass('change')) {
      $(this).removeClass('change')
    } else {
      $(this).addClass('change')
    }
    $(this).parent().next('.result-full').slideToggle();
  });
	function register(){
    var id = path.substring(path.lastIndexOf('/') + 1);
		var players_id = new Array();
		$(".played_user:checked").each(function () {
			console.log(players_id);
			players_id.push($(this).val());
		});
    $.ajax({
      url: path + "/registration_team",
      type: 'GET',
      beforeSend: function(xhr) {
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
      },
      data: {
				players: players_id,
        team_id: team_id
      },
      error: function(XMLHttpRequest, errorTextStatus, error) {
        console.log("Failed: " + errorTextStatus + " ;" + error);
        $("#pick-team").after("<div class='error_msg'>Error!</div>");
      }
    });
	}
  $("#send_inv").click(function(e) {
  	$('.success.msg').remove();
  	$('.error_msg').remove();
    var user_name = path.substring(path.lastIndexOf('/') + 1);
    $.ajax({
      url: "/invites",
      type: 'POST',
      beforeSend: function(xhr) {
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
      },
      data: {
        team_id: team_id,
        user: user_name
      },
      error: function(XMLHttpRequest, errorTextStatus, error) {
        console.log("Failed: " + errorTextStatus + " ;" + error);
        $("#pick-team").after("<div class='error_msg'>Invitation not sent!</div>");
      },
      success: function(data) {
				if (data) {
	        var obj = JSON.parse(data);
        	if (obj.error.user[0]) {
        	  $("#pick-team").after("<div class='error_msg'>" + obj.error.user[0] + "</div>");
        	}
				}
				else {
          $("#pick-team").after("<div class='success_msg'>Invitation sent!</div>");
        }
      }
    });
  });
  $('.dropdown-menu#request > li > a').click(function() {
    $.ajax({
      url: path + '/detail',
      type: 'GET',
      data: {
        team_id: team_id
      },
      dataType: "script",
      error: function(XMLHttpRequest, errorTextStatus, error) {
        console.log("Failed: " + errorTextStatus + " ;" + error);
      },
			success: function() {
				document.getElementById("register").addEventListener("click", register);
			}
    });
  });
  $(".notify-btn .btn").click(function(e) {
    var id = $(this).closest(".notify-main").find("input").val();
    $.ajax({
      url: "/invites/" + id,
      type: 'PUT',
      beforeSend: function(xhr) {
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
      },
      data: {
        accepted: $(e.target).attr("value")
      },
      error: function(XMLHttpRequest, errorTextStatus, error) {
        console.log("Failed: " + errorTextStatus + " ;" + error);
      },
      success: function() {
        if ($(e.target).attr("value") == "true") {
          $(e.target).closest(".notify-main").append("<div class='success_msg'>invitation was confirmed now you is a member of the team</div>");
          $(e.target).parent().remove();
        } else {
          $(e.target).closest(".notify-main").append("<div class='success_msg'>invitation was rejected</div>");
          $(e.target).parent().remove();
        }
        //$(this).closest('.notify-main').remove();
      }
    });
  });
  $("#success-alert").fadeTo(2000, 500).slideUp(500);
  $(document).click(function(e) {
    if (e.target.id == "notify-cl") {
      $("#notify").toggle();
    } else if ($("#notify").is(':visible') && !$(e.target).closest("#notify").length && e.target.id != "notify-cl") {
      $("#notify").hide();
    }
		if(e.target.id == "locale"){
			$("#locale_list").toggle();
		}
		else{
			$("#locale_list").hide();
		}
  });
});
