var apiKey = require("./../.env").apiKey;

function Doctor(condition) {
  this.condition = condition;
}

Doctor.prototype.getDoctors = function(displayDoctors) {
  $.get(`https://api.betterdoctor.com/2016-03-01/doctors?=${this.condition}&location=45.5231%2C-122.6765%2C%205&user_location=45.5231%2C-122.6765&skip=0&limit=20&user_key=${apiKey}`)
   .then(function(result) {

      result.data.forEach(function(object) {
        displayDoctors(object);
      });
    })
   .fail(function(error){
      console.log(error.data.ErrorMessage);
    });
};

exports.doctorModule = Doctor;
