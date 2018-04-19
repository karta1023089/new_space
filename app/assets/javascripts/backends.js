//= require jquery
//= require bootstrap
//= require jquery-ui

//= require backend_template/js/jquery.dcjqaccordion.2.7.js
//= require backend_template/js/jquery.scrollTo.min.js
//= require backend_template/js/slidebars.min.js
//= require backend_template/js/jquery.nicescroll.js
//= require backend_template/js/respond.min.js
//= require backend_template/assets/toastr-master/toastr.js
//= require backend_template/assets/bootstrap-colorpicker/js/bootstrap-colorpicker.js
//= require backend_template/assets/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js
//= require jquery_ujs
//= require jquery.remotipart
//= require jquery-ui-daterangepicker/jquery.comiseo.daterangepicker.js
//= require jquery-ui-daterangepicker/moment.js
//= require backend_template/assets/fancybox/source/jquery.fancybox.js
//= require backend_template/js/jquery.multi-select.js
//= require select2

//= require backend_template/js/common-scripts.js

//= require sort.js

$(document).ready(function(){
  $('.dropify').dropify();

  $(".ckeditor").each(function(){
    CKEDITOR.replace($(this).attr("id"), {
      filebrowserUploadUrl : '/backends/images/ck_upload',
      height: $(this).data("height"),
    });      
  })

  $( ".select2" ).select2({
    theme: "bootstrap",
    width: '100%'
  });

  $(function() {
    $(".fancybox").fancybox();
  });

  $(".datetime").datetimepicker({
    autoclose: true,
    pickerPosition: "top-right"
  }) 

})