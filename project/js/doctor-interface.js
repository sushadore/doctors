$(function(){
  $("#find-doctors").submit(function(e) {
    e.preventDefault();

    var medicalIssue = $("medical-issue").val();
    $("medical-issue").val("");
    
  });
});
