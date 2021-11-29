$(document).ready(function() {
  let job_id = "";
  $("#copy_course_btn").click(function () {
    $('#progress_bar').show();
    let url = window.location.href
    params = url.split('/')
    param = {}
    param["course_id"] = params[params.length - 1]
    $.ajax({
      mode: 'no-cors',
      type: "POST",
      url: "/courses/copy_course",
      data: param,
      dataType: "json",
      success: function (result, status, xhr) {
      //  console.log(result.id + " is the job id")
        job_id = result.id
      },
      error: function (xhr, status, error) {
        alert("Result: " + status + " " + error + " " + xhr.status + " " + xhr.statusText)
      }
  });
  let interval;
  interval = setInterval(function(){
    let url = window.location.href
    params = url.split('/')
    param = {}
    param["course_id"] = params[params.length - 1]
    $.ajax({
      url: '/progress-job/' + job_id,
      success: function(job){
        var stage, progress;

        // If there are errors
        if (job.last_error != null) {
          $('.progress-status').addClass('text-danger').text(job.progress_stage);
          $('.progress-bar').addClass('progress-bar-danger');
          $('.progress').removeClass('active');
          clearInterval(interval);
        }

        progress = job.progress_current / job.progress_max * 100;
        // In job stage
        if (progress.toString() !== 'NaN'){
          $('.progress-status').text(job.progress_current + '/' + job.progress_max + "You have one course being created");
          $('.progress-bar').css('width', progress + '%').text(progress + '%');
        }
      },
      error: function(){
        // Job is no loger in database which means it finished successfuly
        $('.progress').removeClass('active');
        $('.progress-bar').css('width', '100%').text('100%');
        $('.progress-status').text('Your course list has updated. Refresh to see new courses!');
        $('.export-link').show();
        clearInterval(interval);
      }
    })
  },100);
  });
});
