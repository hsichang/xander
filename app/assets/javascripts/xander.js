// TODO: Escape button closes modals
$(function() {
  $("body").on("click", "#listen_experimental_btn", function(){
    // switch listen_experimental_btn with listen_player
    $("#listen_experimental_btn").addClass("hidden");
    $("#listen_player").removeClass("hidden");
  })

  $("body").on("click", "#listen_player", function(){
    $("#listen_experimental_btn").removeClass("hidden");
    $("#listen_player").addClass("hidden");
  })

  $("body").on("click", ".top_menu", function(){
    var currentId = $(this).attr('id');
    top_menu_listener(currentId);
  });

  $("body").on("click", ".listen-menu-btn", function(){
    var currentId = $(this).attr('id');
    listen_menu_listener(currentId);
  });

  $("body").on("click", ".music-btn", function () {
    click_music_player($(this).attr('id'));
  });

  $("body").on("click", ".dark2", function() {
    closePage("theater_dark");
  });

  $("body").on("click", ".dark3", function() {
    closePage("film_dark");
  });

  $("body").on("click", ".dark4", function() {
    closePage("listen_dark");
  });

});

function hover_music_player_out (id) {
  $(".row"+id).removeClass("hover-music-player");
  $(".song"+id+"-marker").removeClass("title-white");
}
function hover_music_player (id) {
  $(".row"+id).addClass("hover-music-player");
  $(".song"+id+"-marker").addClass("title-white");
}

function top_menu_listener (id) {
  if ($(".selected").length === 0) {
    $("#"+id).addClass("selected");
    openPage();
    return false
  }
  $("#"+id).addClass("selected");
  $(".top_menu").not("#"+id).each(function(){
    if ($(this).hasClass("selected")){
      $(this).removeClass("selected");
      closePage(this.id);
    }
  });
}

function closePage (page) {
  switch (page)
  {
    case "listen_dark":
      $('#listen-audio-player').slideUp('slow', function(){
      });
      $("#listen_container").fadeOut('slow', function() {
        $(".front_page_text_space_hidden").show();
        $("#shade").hide();
        $(".dark4").fadeOut('slow', function() {
          $('#listen').removeClass('selected');
          $(".front_page_text_space_hidden").hide();
          $('#front_page_text').fadeIn('slow', function(){
          });
        })
      });
      break;
    case "listen":
      $('.wade_text').hide();
      $('.experimenta_text').hide();
      $("#listen_container").fadeOut('slow', function() {
        $(".front_page_text_space_hidden").show();
        $("#shade").hide();
        $(".dark4").fadeOut('slow', function() {
          $('#listen').removeClass('selected');
          $(".front_page_text_space_hidden").hide();

        // pause any music playing
        $('.playing').find($('.play-pause')).click()
          openPage();
        })
      });
      break
    case "news":
      $("#news_container").fadeOut('slow', function() {
        $(".front_page_text_space").show();
        openPage();
      });
      break;
    case "contact":
      $("#contact_container").fadeOut('slow', function() {
        $(".front_page_text_space").show();
        openPage();
      });
      break;
    case "theater":
      $('.theater_video_container').fadeOut('slow', function(){
        $('#theater_container').fadeOut('slow', function(){
          // Animation complete
          $('.front_page_text_space_hidden').hide();
          $(".front_page_text_space").show();
          openPage();
        });
      });
      $(".dark2").fadeOut('slow', function() {
        $('#theater').removeClass('selected');
      });
      break
    case "theater_dark":
      $('.theater_video_container').fadeOut('slow', function(){
        $('#theater_container').fadeOut('slow', function(){
          // Animation complete
          $('.front_page_text_space_hidden').hide();
          $(".front_page_text_space").show();
          $('#front_page_text').fadeIn('slow', function(){
          });
        });
      });
      $(".dark2").fadeOut('slow', function() {
        $('#theater').removeClass('selected');
      });
      break
    case "film":
      $(".dark3").fadeOut('slow', function() {
        $('#film').removeClass('selected');
        $('.film_container').fadeOut('slow', function(){
          $('.front_page_text_space_hidden').hide();
          openPage();
        });
      });
      break
    case "film_dark":

        $('#film').removeClass('selected');
        $('.film_container').fadeOut('slow', function(){
          $(".dark3").fadeOut('slow', function() {
            $('.front_page_text_space_hidden').hide();
            $('#front_page_text').fadeIn('slow', function(){
          });
        });
      });
      break
  }
}

function openPage () {
  id = $(".selected").attr('id');
  fn = "open_"+id+"_page"
  func = eval ('('+fn+')');
  func();
  // alert(fn)
}

// listen_menu_listener
// ====================
// Menu button is clicked from the listen page.
// Capture the id of the menu item clicked,
// If it is big - shrink it
// If it is small - expand it
// If it is not a target - reduce it
function listen_menu_listener (id) {
  target_id = "#"+id+"-window";
  var open_window = false;
  $(".listen-window").not(target_id).each(function(){
    if ($(this).hasClass("open")) {
      open_window = true;
      hideTarget(this);
      $(this).removeClass("open");
    }
  });
  // if the target is opened, close it.  otherwise open it.
  if ($(target_id).hasClass("hidden")) {
    showTarget(target_id);
  }
  else if (!$(target_id).hasClass('hidden')) {
    hideTarget(target_id);
  }
}

function showTarget(target_id) {
  if (target_id == "#releases-window") {
    open_releases();
  }
  $(target_id).removeClass("hidden");
  $(target_id).addClass("open");
  $(target_id).slideDown('slow', function() {
    // Animation complete.
  });
}

function open_listen_page () {
  $("#front_page_text").fadeOut('slow', function(){
    $(".front_page_text_space_hidden").show();
    $('.dark4').fadeIn('slow', function(){
      $(".front_page_text_space_hidden").hide();
      $('#listen_container').fadeIn('slow', function() {});
    });
    $("#shade").fadeIn('slow', function(){
      $("#listen-audio-player").slideDown('slow', function(){
        open_music_player();
      });
    });
  });
}

function open_theater_page() {
  $('#front_page_text').fadeOut('slow', function(){
    $('.front_page_text_space_hidden').show();
    $('.dark2').fadeIn('slow', function(){
      $('.theater_container').fadeIn('slow', function() {
      });
      $('.theater_video_container').fadeIn('slow', function() {
      });
    });
  });
}

function open_film_page () {
  $("#front_page_text").fadeOut('slow', function(){
    $('.front_page_text_space_hidden').show();

    $('.dark3').fadeIn('slow', function() {
      $('.film_container').show();
    });
    // $("#film_container").show();
  });
}
function setup_listen_page () {
  $("#releases-window").hide();
  $("#theater-window").hide();
  $("#film-window").hide();
}
function open_contact_page() {
  $("#front_page_text").addClass("hidden");
  $("#contact_container").show();
}

function open_releases () {
  $(".image2").fadeOut('slow', function() {
    $("#listen_menu").addClass("hidden");
    $("#listen_container").removeClass("hidden");
    setup_listen_page();
  });
  $('#releases-window').slideDown('slow', function() {
      // Animation complete.
  });
}




function open_music_player () {
  // set up the first song
    // put the music icon in the right place
    // put the song title in the song title
    // pick the right music player
    // add image

  var song_number = id;
  var $song = $(".player_songTitle");
  var $album = $(".player_albumTitle");
  var $label = $(".player_labelTitle");
  //var $image = $(".cover");

  $song.text('"Beat Boxes"');
  $album.text('Wade Laiste');
  $label.text("");
  $(".wade_text").show();
  $(".experimental_text").hide();
  $(".song-player").each(function(){
    $(this).hide();
  });

  $(".song-marker").each(function() {
    $(this).empty();
  });

  $(".song1-player").slideDown("slow", function(){
    $("#1").addClass("playing");
    $(".song1-marker").empty();
    $(".song1-marker").append("<img src='./assets/music-note.png' style='height: 20px; left: 7px; position: relative; top: 5px;' />");
  //  $image.append('<img src="./assets/cover_waide.jpg" height="60" width="60"/>');
  });
}

function click_music_player (id) {
  // If there is a song playing (always) - remove its marker
  // find the new song
  // add the marker to it
  // play the new song
  // clear out the old song

  $(".music-btn").each(function(){
    if ($(this).hasClass("playing")) {
      open_id = $(this).attr('id');
      $(this).removeClass("playing");
      $(".song"+open_id+"-player").slideUp("slow", function(){});
      $(".song"+open_id+"-marker img:last-child").remove();
      $(".song"+open_id+"-marker").append("");
    }
  });
  $(".song"+id+"-player").slideDown("slow",function(){});
  $(".song"+id+"-marker").empty();
  $(".song"+id+"-marker").append("<img src='./assets/music-note.png' style='height: 20px; left: 7px; position: relative; top: 5px;' />");
  $("#"+id).addClass("playing");
  changePlayerInfo(id);
  audiojs.events.ready(function () {
    var as = audiojs.createAll();

    $('audio').each(function () {
      var myAudio = this;
      this.addEventListener('play', function () {
        $('audio').each(function () {
          if (!(this === myAudio)) {
            this.pause();
          }
        });
      });
    });
  });
};

function changePlayerInfo(id) {
  // Songs
  // + 1. Santori Time [Wade Laiste]
  // + 2. Beat Boxes [Wade Laiste)]
  // + 3. Endure Me [Wade Laiste]
  // + 4. Emma Baby [Experimental Tape No. 2, Vol. 1] ( ©Mexican Summer, 2011)
  // + 5. X (I Don't Wanna Go Home) [Experimental Tape No. 2, Vol. 1] ( ©Mexican Summer, 2011)
  // + 6. Live & Learn [Experimental Tape No. 2, Vol. 1] ( ©Mexican Summer, 2011)
  // + 7. Joy [In Due Time]
  var song_number = id;
  var $song = $(".player_songTitle");
  var $album = $(".player_albumTitle");
  var $label = $(".player_labelTitle");
  var $image = $(".cover");
  switch(song_number){
    case '1':
      $song.text('"Beat Boxes"');
      $album.text('Wade Laiste');
      $label.text("");
      $image.empty();
      $image.append('<img src="./assets/cover_waide.jpg" height="60" width="60"/>');
      $('.wade_text').show();
      $('.experimental_text').hide();
      break;
    case '2':
      $song.text('"Santori Time"');
      $album.text('Wade Laiste');
      $label.text("");
      $image.empty();
      $image.append('<img src="./assets/cover_waide.jpg" height="60" width="60"/>')
      $('.wade_text').show();
      $('.experimental_text').hide();
      break;
    case '3':
      $song.text('"Endure Me"');
      $album.text('Wade Laiste');
      $label.text("");
      $image.empty();
      $image.append('<img src="./assets/cover_waide.jpg" height="60" width="60"/>')
      $('.wade_text').show();
      $('.experimental_text').hide();
      break;
    case '4':
      $song.text('"Emma Baby"');
      $album.text('Experimental Tape No. 2, Vol. 1]');
      $label.text('Mexican Summer, 2011');
      $image.empty();
      $image.append('<img src="./assets/cover_experimental.jpg" height="60" width="60"/>')
      $('.wade_text').hide();
      $('.experimental_text').show();
      break;
    case '5':
      $song.text('"X (I Dont Wanna Go Home)"');
      $album.text('Experimental Tape No. 2, Vol. 1]');
      $label.text('Mexican Summer, 2011');
      $image.empty();
      $image.append('<img src="./assets/cover_experimental.jpg" height="60" width="60"/>')
      $('.wade_text').hide();
      $('.experimental_text').show();
      break;
    case '6':
      $song.text('"Live & Learn"');
      $album.text('Experimental Tape No. 2, Vol. 1]');
      $label.text('Mexican Summer, 2011');
      $image.empty();
      $image.append('<img src="./assets/cover_experimental.jpg" height="60" width="60"/>')
      $('.wade_text').hide();
      $('.experimental_text').show();
      break;
    case '7':
      $song.text('"Joy"');
      $album.text('In Due Time');
      $label.text("");
      $image.empty();
      $image.append('<img src="./assets/cover_time.jpg" height="60" width="60"/>')
      $('.wade_text').hide();
      $('.experimental_text').hide();
      break;
  }
};
