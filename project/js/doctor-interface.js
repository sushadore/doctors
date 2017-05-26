var Doctor = require("./../js/doctor.js").doctorModule;

$(function(){
  $("#find-doctors").click(function(e) {
    e.preventDefault();

    var condition = $("#medical-condition").val();
    $("#medical-condition").val("");
    var newDoctor = new Doctor(condition);
    newDoctor.getDoctors();
  });
});
