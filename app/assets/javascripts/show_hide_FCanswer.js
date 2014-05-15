/* - - hide the answer area and set button to say show answer- - */

function showAnswer(current_text){
	if(current_text == "Show Answer"){
		$("#answer_display").show();
		$("#btn_answerShow").val("Hide Answer");
	}
	else {
		$("#answer_display").hide();
		$("#btn_answerShow").val("Show Answer");
	}

}
