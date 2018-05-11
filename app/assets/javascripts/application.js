// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

// = require jquery
// = require bootstrap-sprockets
//= require turbolinks
//= require_tree .



console.log("hello world");

// ***** BuildBox



// $(document).ready(function(){
//
//   $( "#box_family" ).click(function() {
//     $( "#collapse2" ).toggle( "fast", function() {
//     });
//   });
//
//   $( "#entered-quantity" ).click(function() {
//     $( "#collapse3" ).show( "slow", function() {
//     });
//   });
//
//     });




// **** Cart quantity

$(document).ready(function(){


  $("#box_family").click(function(){
    console.log("hello")
    $( "#collapse2" ).show( "slow", function() {
        });
        $( "#collapse1" ).hide( "slow", function() {
            });
  });

  $("#box_adult").click(function(){
    console.log("hello")
    $( "#collapse2" ).show( "slow", function() {
        });
        $( "#collapse1" ).hide( "slow", function() {
            });
            $( ".counter-child" ).hide( "slow", function() {
                });
                $( "suncreenchild" ).empty( function() {
                    });
  });

  $("#entered-quantity").click(function(){
    var numChild = $("#child").val();
    if (numChild==0) {
      $( ".suncreenchild" ).empty( function() {
      });
        }
    pushAdultBase(),
    pushChildBase(),
    pushFamilyBase(),
    $( "#collapse3" ).show( "slow", function() {
        });
        $( "#collapse2" ).hide( "slow", function() {
            });
  });

  $("#back-to-1").click(function(){
    console.log("hello")

    $( "#collapse2" ).hide( "slow", function() {
        });
        location.reload();
        $( "#collapse1" ).show( "slow", function() {
            });
  });

  $("#back-to-2").click(function(){
    console.log("hello")
    $( "#collapse2" ).show( "slow", function() {
        });
        $( "#collapse3" ).hide( "slow", function() {
            });
  });

});

function getNumAdult(){
  var numAdult = $("#adult").val()
  console.log(numAdult)

};

function getNumChild(){
  var numChild = $("#child").val()
  console.log(numChild)

};

function getNumFam(){
  var numAdult = $("#adult").val()
  var numChild = $("#child").val()
  var getNumFam = parseInt("numAdult")+parseInt("numChild")

};

function pushAdultBase(){
  var numAdult = Math.ceil($("#adult").val()/4)
  console.log(numAdult)
  $( "#sunscreen-adult_qty" ).val(numAdult)

};

function pushChildBase(){
  var numChild = Math.ceil($("#child").val()/4)
  console.log(numChild)
  $( "#sunscreen-child_qty" ).val(numChild)

};

function pushFamilyBase(){
  var numAdult = $("#adult").val()
  var numChild = $("#child").val()
  var getNumFam = parseInt(numAdult)+parseInt(numChild)
  console.log(getNumFam)
  $( "#towel_qty" ).val(getNumFam);
  $( "#chair_qty" ).val(getNumFam);


};



// ****** Counter

$(document).on('click', '.number-spinner a', function () {
       var btn = $(this),
       input = btn.closest('.number-spinner').find('input'),
       total = $('#people').val(),
       oldValue = input.val().trim();

   if (btn.attr('data-dir') == 'up') {
     if(oldValue < input.attr('max')){
       oldValue++;
       total++;
     }
   } else {
     if (oldValue > input.attr('min')) {
       oldValue--;
       total--;
     }
   }
   $('#people').val(total);
   input.val(oldValue);
 });
