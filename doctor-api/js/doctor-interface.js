var Doctor = require("./../js/doctor.js").doctorModule;

var displayDoctors = function(object) {
  $("#doctors").append(`<h5>${object.profile.first_name} ${object.profile.last_name} ${object.profile.title ? object.profile.title : ""}</h5>`);
};

$(function(){
  $("#find-doctors").click(function(e) {
    e.preventDefault();

    var condition = $("#medical-condition").val();
    $("#medical-condition").val("");
    var newDoctor = new Doctor(condition);
    newDoctor.getDoctors(displayDoctors);
    $("#doctors").empty();
  });
});
