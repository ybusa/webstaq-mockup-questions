$(function () {
    $("a.removeQuestionOptions").live("click", function (e) {
      $(this).closest("fieldset").find("input[name$='[_destroy]']").val(1);
      $(this).closest("fieldset").slideUp(500);
      e.preventDefault();
      });

    $("a.addQuestionOption").click(function (e) {
      var new_id = new Date().getTime();
      var regex = new RegExp("new_question_option", "g");
      var $new_opt = $("#newQuestionOptions").clone();
      $(this).closest("li").before($new_opt);
      $new_opt.attr("id", new_id).html($new_opt.html().replace(regex, new_id)).slideDown(500);

      e.preventDefault();
      });
    });

