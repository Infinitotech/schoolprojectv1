{% extends 'base.html' %}
{% block content %}


<div id="content" class="clearfix">
<div class="innerWrapper">
<!--[if IE 6]>
<div class="alert-box error editor">
	<p class="bold">You are using Internet Explorer Version 6 which will not work with ClassMarker administration pages.</p>
	<p>Please upgrade to a modern web browser to use ClassMarker.</p>
	<p>Your Test takers can still use Internet explorer 6 however.</p>
	<p>Modern browsers include: <a href="https://www.google.com/intl/en/chrome/browser/">Google Chrome</a> | <a href="http://www.mozilla.org/en-US/firefox/new/">Mozilla Firefox</a> | <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">Microsoft Internet Explorer</a></p>
</div>
<![endif]-->
<div class="col-span-7"><p class="breadcrumb3"><a href="https://www.classmarker.com/a/tests/" class="first"><span>Tests</span></a><a href="https://www.classmarker.com/a/tests/test/?test_id=755522#q"><span>Edit Test</span></a><span>Add New Questions</span></p></div><div class="col-span-3"><ul class="menu-sections">
<li class="test"><a href="https://www.classmarker.com/a/tests/#tests"><span>Tests</span></a></li>
<li class="group"><a class="sect" href="https://www.classmarker.com/a/tests/#groups"><span>Groups</span></a></li>
<li class="link"><a class="sect" href="https://www.classmarker.com/a/tests/#links"><span>Links</span></a></li></ul>
</div><div class="clearheight20"></div><div class="clearheight20"></div>
<h2 class="test-name name"><a href="https://www.classmarker.com/a/tests/test/?test_id=755522" class="graylink">


<%@ page import = "java.sql.*, java.util.*"%>
<jsp:declaration> //Jsp Declaration

	String name = " "; 
		//Object o=request.getAttribute("testname");
	
</jsp:declaration>
<jsp:scriptlet>
		name = request.getParameter("testname"); 
</jsp:scriptlet>
<jsp:expression> 
	
	name

</jsp:expression>




</a></h2> <div class="clearheight5"></div>
<div class="questions-title" id="scrollToShowCount">
<div class="col-span-3"><h3><span id="total_questions_count">0</span> Questions</h3></div>
<div class="col-span-2 "><span id="num_static_questions">0</span> Fixed Questions<br>
<span class="little"><span id="static_points">0</span> Points</span> <span class="add-symbol"> + </span></div>
<div class="col-span-5 ">0 Random Questions<br>
<span class="little">Points <span class="showTooltip tooltip tooltiptextlevel" title="Points dependent on the Questions that are randomly selected from your Question Bank each time this Test starts.">&nbsp;</span></span>
</div>
</div>
<a id="qtop"></a>
 
<div class="clear"></div>
<div id="msgDiv"></div>
<div class="clear"></div>
<ul class="cmtableTabs"><li class="tabon"><a href="https://www.classmarker.com/a/tests/qb/manage/?test_id=755522&amp;qtype=mcsa#">Add New Questions</a></li></ul>
<div class="table">
<div class="table-utility row above">
<div class="col-span-2 little">
&nbsp;
</div>
<div class="col-span-8 col-btns">
<a href="https://www.classmarker.com/a/tests/qb/manage/?test_id=755522&amp;qtype=mcsa#" id="showQuestionExamples" class="explain-underline">Question Examples</a> |
<a href="https://www.classmarker.com/a/tests/qb/manage/?test_id=755522&amp;qtype=mcsa#" id="showSymbols" class="explain-underline">Symbols</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a class="btn btn-analytics" href="https://www.classmarker.com/a/tests/test/?test_id=755522#q">Back to Test</a> </div>
</div>
<div class="row edit-questions-bg">
<ul class="question_type_selector_links">
<li class="selected"><a href="https://www.classmarker.com/a/tests/qb/manage/?test_id=755522&amp;qtype=mcsa#" id="edit_mc" class="no_anchor">Multiple Choice</a></li>
<li><a href="https://www.classmarker.com/a/tests/qb/manage/?test_id=755522&amp;qtype=mcsa#" id="edit_tf" class="no_anchor">True False</a></li>
<li><a href="https://www.classmarker.com/a/tests/qb/manage/?test_id=755522&amp;qtype=mcsa#" id="edit_ft" class="no_anchor">Free Text</a></li>
<li><a href="https://www.classmarker.com/a/tests/qb/manage/?test_id=755522&amp;qtype=mcsa#" id="edit_p" class="no_anchor">Grammar</a></li>
<li><a href="https://www.classmarker.com/a/tests/qb/manage/?test_id=755522&amp;qtype=mcsa#" id="edit_e" class="no_anchor">Essay</a></li>
</ul>
<div class="clearheight30"></div>
<div class="clear"></div>
<div class="col-span-7">
<h3 id="editQheader" class="left">
</h3>
</div>
<script type="text/javascript">
	/* initialise */
	var active_question_form = 'mc';//Global scope - keep outside of $(document).ready

	$(document).ready(function () {


		$('#symbolsDiv').jqm({ajax: '/inc/lib/misc/symbols.php?V3=1', trigger: 'a[id^=showSymbols]'});
		$('#questionExamplesDiv').jqm({ajax: '/inc/lib/html/tests/questionExamples.html.php', trigger: 'a[id^=showQuestionExamples]'});


		$('.showCorrect').change(function(){
			$(this).prev('h5').toggleClass('editShowCorrect');
			$(this).next('label').toggleClass('editShowCorrect');
		});
		$('.showCorrecttf').change(function(){
			$('.showCorrecttf').each( function (){
				$(this).prev('h5').toggleClass('editShowCorrecttf');
				$(this).next('label').toggleClass('editShowCorrecttf');
			})
		});



		/* Show div displays always  */
		$('#edit_mc').click(function () {
			$('#editQheader').text('Multiple Choice / Response');
			active_question_form = 'mc';
			$('#qtype').val('mcsa');
			showDiv();
		});

		$('#edit_tf').click(function () {
			$('#editQheader').text('True False');
			active_question_form = 'tf';
			$('#qtype').val('tf');
			showDiv();
		});

		$('#edit_ft').click(function () {
			$('#editQheader').text('Free Text');
			active_question_form = 'ft';
			$('#qtype').val('ft');
			showDiv();
		});

		$('#edit_p').click(function () {
			$('#editQheader').text('Grammar');
			active_question_form = 'p';
			$('#qtype').val('p');
			showDiv();
		});

		$('#edit_e').click(function () {
			$('#editQheader').text('Essay');
			active_question_form = 'e';
			$('#qtype').val('e');
			showDiv();
		});

		showDiv();

	});

	function showDiv() {

		/*
		 Change which question form displays

		 Hide all */
		//$('.question_explain_div').hide();
		$('#questionForm [class*="_formdiv"]').hide();/* Hide all divs */
		$('#questionForm [class*="_formdiv"] input, #questionForm [class*="_formdiv"] textarea').attr('disabled', 'disabled');/* Disable all inputs */

		/* SHow required */
		$('#questionForm [class*="'+ active_question_form+'_formdiv"] input, #questionForm [class*="'+ active_question_form+'_formdiv"] textarea').removeAttr('disabled');/* Activate required divs */
		$('#questionForm [class*="'+ active_question_form+'_formdiv"]').show();/* Show required divs */

		$('#div_preview').hide();
		$('.edit_question_link').hide();


		$('[id^="form_div_"]').each(function () {
			$(this).hide();
		});

		if (typeof isMSIE8 !== 'undefined') {
			$('#form_div').removeClass('move_off_screen');
		} else {
			$('#form_div').show();
		}

		$('#button_row').show();

		$('[id^="edit_"]').each(function () {
			$(this).closest('li').removeClass('selected');

		});
		$('#edit_' + active_question_form).closest('li').addClass('selected');

		$('.question-selector').show();

		// comment out the following code temporarily since it throws exception in IE8  Allen
		// Add id for selenium test
//		var ids = ["question", "ans1", "ans2", "ans3", "ans4"];
//		for (var i = 0; i < ids.length; i++) {
//			addSeleniumId(ids[i]);
//		}
	}



</script>
<form action="https://www.classmarker.com/a/tests/qb/manage/submitSingleQuestion.php" method="post" id="questionForm"><div id="form_div" class="editQuestionDiv"><div class="col-span-7"><input type="hidden" name="qtype" id="qtype" value="mcsa"><input type="hidden" name="test_id" value="755522"><input type="hidden" name="return_url" value="/a/tests/qb/manage/?&amp;test_id=755522&amp;qtype=mcsa"><div class="e_formdiv delay_hide_sceditor hide mc_formdiv tf_formdiv ft_formdiv " style="display: block;"><div id="main_question_box">
<h5>Question</h5>
   
<textarea name="question" rows="3" cols="67" id="question" class="edit_qboxes question_text qclear mc_forminput tf_forminput ft_forminput e_forminput fullBBcodeEditor" style="display: none;"></textarea><div class="sceditor-container ltr" style="width: 550px;" id="editor_question"><div class="sceditor-group"><a class="sceditor-button sceditor-button-superscript" data-sceditor-command="superscript" unselectable="on" title="Superscript"><div unselectable="on">Superscript</div></a><a class="sceditor-button sceditor-button-subscript" data-sceditor-command="subscript" unselectable="on" title="Subscript"><div unselectable="on">Subscript</div></a><a class="sceditor-button sceditor-button-square" data-sceditor-command="square" unselectable="on" title="Square Root"><div unselectable="on">Square Root</div></a><a class="sceditor-button sceditor-button-pastetext" data-sceditor-command="pastetext" unselectable="on" title="Paste Text"><div unselectable="on">Paste Text</div></a></div></div><textarea dir="ltr" style="display: none; width: 540px; height: 93px;"></textarea><div class="sceditor-grip"></div><div class="sceditor-resize-cover" style="display: none;"></div></div><div class="jqmWindow jqmID1" id="symbolsDiv"></div>






</div><div class="clearheight"></div></div><div class="hide delay_hide_sceditor mc_formdiv" style="display: block;"><div class="multiple_choice_answers">
<h5>Answers <span class="showTooltip tooltip" title="Type at least two answer options and select which answer/s are correct.">Tip</span></h5><div class="answer">
<div class="answer_heading">
<h5 class="">(A)</h5>
<input class="showCorrect mc_forminput" type="checkbox" name="correct1" value="1" id="a1">
<label for="a1" class="">This answer option is correct</label>
</div>
  
<textarea name="question" rows="3" cols="67" id="ans1" class="edit_qboxes question_text qclear mc_forminput tf_forminput ft_forminput e_forminput fullBBcodeEditor" style="display: none;"></textarea><div class="sceditor-container ltr" style="width: 550px;" id="editor_question"><div class="sceditor-group"><a class="sceditor-button sceditor-button-superscript" data-sceditor-command="superscript" unselectable="on" title="Superscript"><div unselectable="on">Superscript</div></a><a class="sceditor-button sceditor-button-subscript" data-sceditor-command="subscript" unselectable="on" title="Subscript"><div unselectable="on">Subscript</div></a><a class="sceditor-button sceditor-button-square" data-sceditor-command="square" unselectable="on" title="Square Root"><div unselectable="on">Square Root</div></a><a class="sceditor-button sceditor-button-pastetext" data-sceditor-command="pastetext" unselectable="on" title="Paste Text"><div unselectable="on">Paste Text</div></a></div></div><textarea dir="ltr" style="display: none; width: 540px; height: 93px;"></textarea><div class="sceditor-grip"></div><div class="sceditor-resize-cover" style="display: none;"></div></div><div class="jqmWindow jqmID1" id="symbolsDiv">






</div><div class="answer">
<div class="answer_heading">
<h5 class="">(B)</h5>
<input class="showCorrect mc_forminput" type="checkbox" name="correct2" value="2" id="a2">
<label for="a2" class="">This answer option is correct</label>
</div>
  
<textarea name="question" rows="3" cols="67" id="ans2" class="edit_qboxes question_text qclear mc_forminput tf_forminput ft_forminput e_forminput fullBBcodeEditor" style="display: none;"></textarea><div class="sceditor-container ltr" style="width: 550px;" id="editor_question"><div class="sceditor-group"><a class="sceditor-button sceditor-button-superscript" data-sceditor-command="superscript" unselectable="on" title="Superscript"><div unselectable="on">Superscript</div></a><a class="sceditor-button sceditor-button-subscript" data-sceditor-command="subscript" unselectable="on" title="Subscript"><div unselectable="on">Subscript</div></a><a class="sceditor-button sceditor-button-square" data-sceditor-command="square" unselectable="on" title="Square Root"><div unselectable="on">Square Root</div></a><a class="sceditor-button sceditor-button-pastetext" data-sceditor-command="pastetext" unselectable="on" title="Paste Text"><div unselectable="on">Paste Text</div></a></div></div><textarea dir="ltr" style="display: none; width: 540px; height: 93px;"></textarea><div class="sceditor-grip"></div><div class="sceditor-resize-cover" style="display: none;"></div></div><div class="jqmWindow jqmID1" id="symbolsDiv">
</div><div class="answer">
<div class="answer_heading">
<h5 class="">(C)</h5>
<input class="showCorrect mc_forminput" type="checkbox" name="correct3" value="3" id="a3">
<label for="a3" class="">This answer option is correct</label>
</div>
  
<textarea name="question" rows="3" cols="67" id="ans3" class="edit_qboxes question_text qclear mc_forminput tf_forminput ft_forminput e_forminput fullBBcodeEditor" style="display: none;"></textarea><div class="sceditor-container ltr" style="width: 550px;" id="editor_question"><div class="sceditor-group"><a class="sceditor-button sceditor-button-superscript" data-sceditor-command="superscript" unselectable="on" title="Superscript"><div unselectable="on">Superscript</div></a><a class="sceditor-button sceditor-button-subscript" data-sceditor-command="subscript" unselectable="on" title="Subscript"><div unselectable="on">Subscript</div></a><a class="sceditor-button sceditor-button-square" data-sceditor-command="square" unselectable="on" title="Square Root"><div unselectable="on">Square Root</div></a><a class="sceditor-button sceditor-button-pastetext" data-sceditor-command="pastetext" unselectable="on" title="Paste Text"><div unselectable="on">Paste Text</div></a></div></div><textarea dir="ltr" style="display: none; width: 540px; height: 93px;"></textarea><div class="sceditor-grip"></div><div class="sceditor-resize-cover" style="display: none;"></div></div><div class="jqmWindow jqmID1" id="symbolsDiv">
</div><div class="answer">
<div class="answer_heading">
<h5 class="">(D)</h5>
<input class="showCorrect mc_forminput" type="checkbox" name="correct4" value="4" id="a4">
<label for="a4" class="">This answer option is correct</label>
</div>
  
<textarea name="question" rows="3" cols="67" id="ans4" class="edit_qboxes question_text qclear mc_forminput tf_forminput ft_forminput e_forminput fullBBcodeEditor" style="display: none;"></textarea><div class="sceditor-container ltr" style="width: 550px;" id="editor_question"><div class="sceditor-group"><a class="sceditor-button sceditor-button-superscript" data-sceditor-command="superscript" unselectable="on" title="Superscript"><div unselectable="on">Superscript</div></a><a class="sceditor-button sceditor-button-subscript" data-sceditor-command="subscript" unselectable="on" title="Subscript"><div unselectable="on">Subscript</div></a><a class="sceditor-button sceditor-button-square" data-sceditor-command="square" unselectable="on" title="Square Root"><div unselectable="on">Square Root</div></a><a class="sceditor-button sceditor-button-pastetext" data-sceditor-command="pastetext" unselectable="on" title="Paste Text"><div unselectable="on">Paste Text</div></a></div></div><textarea dir="ltr" style="display: none; width: 540px; height: 93px;"></textarea><div class="sceditor-grip"></div><div class="sceditor-resize-cover" style="display: none;"></div></div><div class="jqmWindow jqmID1" id="symbolsDiv">
</div>
<!--<a href="https://www.classmarker.com/a/tests/qb/manage/?test_id=755522&amp;qtype=mcsa#" id="tog_extra" class="btn btn-add-wysiwyg hideme">Add more answer options</a><div class="hide delay_hide_sceditor" id="dotog_extra" style="display: none;"><div class="answer">
<div class="answer_heading">
<h5 class="">(E)</h5>
<input class="showCorrect mc_forminput" type="checkbox" name="correct5" value="5" id="a5">
<label for="a5" class="">This answer option is correct</label>
</div>
<textarea name="ans5" rows="3" cols="67" id="ans5" class="qclear mc_forminput fullBBcodeEditor" style="display: none;"></textarea><div class="sceditor-container ltr" style="width: 550px;" id="editor_ans5"><div class="sceditor-toolbar" unselectable="on"><div class="sceditor-group"><a class="sceditor-button sceditor-button-bold" data-sceditor-command="bold" unselectable="on" title="Bold"><div unselectable="on">Bold</div></a><a class="sceditor-button sceditor-button-italic" data-sceditor-command="italic" unselectable="on" title="Italic"><div unselectable="on">Italic</div></a><a class="sceditor-button sceditor-button-underline" data-sceditor-command="underline" unselectable="on" title="Underline"><div unselectable="on">Underline</div></a><a class="sceditor-button sceditor-button-strike" data-sceditor-command="strike" unselectable="on" title="Strikethrough"><div unselectable="on">Strikethrough</div></a><a class="sceditor-button sceditor-button-color" data-sceditor-command="color" unselectable="on" title="Font Color"><div unselectable="on">Font Color</div></a><a class="sceditor-button sceditor-button-size" data-sceditor-command="size" unselectable="on" title="Font Size"><div unselectable="on">Font Size</div></a></div><div class="sceditor-group"><a class="sceditor-button sceditor-button-orderedlist" data-sceditor-command="orderedlist" unselectable="on" title="Numbered list"><div unselectable="on">Numbered list</div></a><a class="sceditor-button sceditor-button-bulletlist" data-sceditor-command="bulletlist" unselectable="on" title="Bullet list"><div unselectable="on">Bullet list</div></a><a class="sceditor-button sceditor-button-table" data-sceditor-command="table" unselectable="on" title="Insert a table"><div unselectable="on">Insert a table</div></a></div><div class="sceditor-group"><a class="sceditor-button sceditor-button-link" data-sceditor-command="link" unselectable="on" title="Insert a link"><div unselectable="on">Insert a link</div></a><a class="sceditor-button sceditor-button-yt" data-sceditor-command="yt" unselectable="on" title="Insert Image, Document, Audio or Video"><div unselectable="on">Insert Image, Document, Audio or Video</div></a></div><div class="sceditor-group"><a class="sceditor-button sceditor-button-superscript" data-sceditor-command="superscript" unselectable="on" title="Superscript"><div unselectable="on">Superscript</div></a><a class="sceditor-button sceditor-button-subscript" data-sceditor-command="subscript" unselectable="on" title="Subscript"><div unselectable="on">Subscript</div></a><a class="sceditor-button sceditor-button-square" data-sceditor-command="square" unselectable="on" title="Square Root"><div unselectable="on">Square Root</div></a><a class="sceditor-button sceditor-button-pastetext" data-sceditor-command="pastetext" unselectable="on" title="Paste Text"><div unselectable="on">Paste Text</div></a></div></div><iframe id="qa_frame_editor_ans5" frameborder="0" src="javascript:false" style="width: 540px; height: 93px;" src="./ClassMarker - Welcome_files/saved_resource(5).html"></iframe><textarea dir="ltr" style="display: none; width: 540px; height: 93px;"></textarea><div class="sceditor-grip"></div><div class="sceditor-resize-cover" style="display: none;"></div></div>
</div><div class="answer">
<div class="answer_heading">
<h5 class="">(F)</h5>
<input class="showCorrect mc_forminput" type="checkbox" name="correct6" value="6" id="a6">
<label for="a6" class="">This answer option is correct</label>
</div>
<textarea name="ans6" rows="3" cols="67" id="ans6" class="qclear mc_forminput fullBBcodeEditor" style="display: none;"></textarea><div class="sceditor-container ltr" style="width: 550px;" id="editor_ans6"><div class="sceditor-toolbar" unselectable="on"><div class="sceditor-group"><a class="sceditor-button sceditor-button-bold" data-sceditor-command="bold" unselectable="on" title="Bold"><div unselectable="on">Bold</div></a><a class="sceditor-button sceditor-button-italic" data-sceditor-command="italic" unselectable="on" title="Italic"><div unselectable="on">Italic</div></a><a class="sceditor-button sceditor-button-underline" data-sceditor-command="underline" unselectable="on" title="Underline"><div unselectable="on">Underline</div></a><a class="sceditor-button sceditor-button-strike" data-sceditor-command="strike" unselectable="on" title="Strikethrough"><div unselectable="on">Strikethrough</div></a><a class="sceditor-button sceditor-button-color" data-sceditor-command="color" unselectable="on" title="Font Color"><div unselectable="on">Font Color</div></a><a class="sceditor-button sceditor-button-size" data-sceditor-command="size" unselectable="on" title="Font Size"><div unselectable="on">Font Size</div></a></div><div class="sceditor-group"><a class="sceditor-button sceditor-button-orderedlist" data-sceditor-command="orderedlist" unselectable="on" title="Numbered list"><div unselectable="on">Numbered list</div></a><a class="sceditor-button sceditor-button-bulletlist" data-sceditor-command="bulletlist" unselectable="on" title="Bullet list"><div unselectable="on">Bullet list</div></a><a class="sceditor-button sceditor-button-table" data-sceditor-command="table" unselectable="on" title="Insert a table"><div unselectable="on">Insert a table</div></a></div><div class="sceditor-group"><a class="sceditor-button sceditor-button-link" data-sceditor-command="link" unselectable="on" title="Insert a link"><div unselectable="on">Insert a link</div></a><a class="sceditor-button sceditor-button-yt" data-sceditor-command="yt" unselectable="on" title="Insert Image, Document, Audio or Video"><div unselectable="on">Insert Image, Document, Audio or Video</div></a></div><div class="sceditor-group"><a class="sceditor-button sceditor-button-superscript" data-sceditor-command="superscript" unselectable="on" title="Superscript"><div unselectable="on">Superscript</div></a><a class="sceditor-button sceditor-button-subscript" data-sceditor-command="subscript" unselectable="on" title="Subscript"><div unselectable="on">Subscript</div></a><a class="sceditor-button sceditor-button-square" data-sceditor-command="square" unselectable="on" title="Square Root"><div unselectable="on">Square Root</div></a><a class="sceditor-button sceditor-button-pastetext" data-sceditor-command="pastetext" unselectable="on" title="Paste Text"><div unselectable="on">Paste Text</div></a></div></div><iframe id="qa_frame_editor_ans6" frameborder="0" src="javascript:false" style="width: 540px; height: 93px;" src="./ClassMarker - Welcome_files/saved_resource(6).html"></iframe><textarea dir="ltr" style="display: none; width: 540px; height: 93px;"></textarea><div class="sceditor-grip"></div><div class="sceditor-resize-cover" style="display: none;"></div></div>
</div><div class="answer">
<div class="answer_heading">
<h5 class="">(G)</h5>
<input class="showCorrect mc_forminput" type="checkbox" name="correct7" value="7" id="a7">
<label for="a7" class="">This answer option is correct</label>
</div>
<textarea name="ans7" rows="3" cols="67" id="ans7" class="qclear mc_forminput fullBBcodeEditor" style="display: none;"></textarea><div class="sceditor-container ltr" style="width: 550px;" id="editor_ans7"><div class="sceditor-toolbar" unselectable="on"><div class="sceditor-group"><a class="sceditor-button sceditor-button-bold" data-sceditor-command="bold" unselectable="on" title="Bold"><div unselectable="on">Bold</div></a><a class="sceditor-button sceditor-button-italic" data-sceditor-command="italic" unselectable="on" title="Italic"><div unselectable="on">Italic</div></a><a class="sceditor-button sceditor-button-underline" data-sceditor-command="underline" unselectable="on" title="Underline"><div unselectable="on">Underline</div></a><a class="sceditor-button sceditor-button-strike" data-sceditor-command="strike" unselectable="on" title="Strikethrough"><div unselectable="on">Strikethrough</div></a><a class="sceditor-button sceditor-button-color" data-sceditor-command="color" unselectable="on" title="Font Color"><div unselectable="on">Font Color</div></a><a class="sceditor-button sceditor-button-size" data-sceditor-command="size" unselectable="on" title="Font Size"><div unselectable="on">Font Size</div></a></div><div class="sceditor-group"><a class="sceditor-button sceditor-button-orderedlist" data-sceditor-command="orderedlist" unselectable="on" title="Numbered list"><div unselectable="on">Numbered list</div></a><a class="sceditor-button sceditor-button-bulletlist" data-sceditor-command="bulletlist" unselectable="on" title="Bullet list"><div unselectable="on">Bullet list</div></a><a class="sceditor-button sceditor-button-table" data-sceditor-command="table" unselectable="on" title="Insert a table"><div unselectable="on">Insert a table</div></a></div><div class="sceditor-group"><a class="sceditor-button sceditor-button-link" data-sceditor-command="link" unselectable="on" title="Insert a link"><div unselectable="on">Insert a link</div></a><a class="sceditor-button sceditor-button-yt" data-sceditor-command="yt" unselectable="on" title="Insert Image, Document, Audio or Video"><div unselectable="on">Insert Image, Document, Audio or Video</div></a></div><div class="sceditor-group"><a class="sceditor-button sceditor-button-superscript" data-sceditor-command="superscript" unselectable="on" title="Superscript"><div unselectable="on">Superscript</div></a><a class="sceditor-button sceditor-button-subscript" data-sceditor-command="subscript" unselectable="on" title="Subscript"><div unselectable="on">Subscript</div></a><a class="sceditor-button sceditor-button-square" data-sceditor-command="square" unselectable="on" title="Square Root"><div unselectable="on">Square Root</div></a><a class="sceditor-button sceditor-button-pastetext" data-sceditor-command="pastetext" unselectable="on" title="Paste Text"><div unselectable="on">Paste Text</div></a></div></div><iframe id="qa_frame_editor_ans7" frameborder="0" src="javascript:false" style="width: 540px; height: 93px;" src="./ClassMarker - Welcome_files/saved_resource(7).html"></iframe><textarea dir="ltr" style="display: none; width: 540px; height: 93px;"></textarea><div class="sceditor-grip"></div><div class="sceditor-resize-cover" style="display: none;"></div></div>
</div><div class="answer">
<div class="answer_heading">
<h5 class="">(H)</h5>
<input class="showCorrect mc_forminput" type="checkbox" name="correct8" value="8" id="a8">
<label for="a8" class="">This answer option is correct</label>
</div>
<textarea name="ans8" rows="3" cols="67" id="ans8" class="qclear mc_forminput fullBBcodeEditor" style="display: none;"></textarea><div class="sceditor-container ltr" style="width: 550px;" id="editor_ans8"><div class="sceditor-toolbar" unselectable="on"><div class="sceditor-group"><a class="sceditor-button sceditor-button-bold" data-sceditor-command="bold" unselectable="on" title="Bold"><div unselectable="on">Bold</div></a><a class="sceditor-button sceditor-button-italic" data-sceditor-command="italic" unselectable="on" title="Italic"><div unselectable="on">Italic</div></a><a class="sceditor-button sceditor-button-underline" data-sceditor-command="underline" unselectable="on" title="Underline"><div unselectable="on">Underline</div></a><a class="sceditor-button sceditor-button-strike" data-sceditor-command="strike" unselectable="on" title="Strikethrough"><div unselectable="on">Strikethrough</div></a><a class="sceditor-button sceditor-button-color" data-sceditor-command="color" unselectable="on" title="Font Color"><div unselectable="on">Font Color</div></a><a class="sceditor-button sceditor-button-size" data-sceditor-command="size" unselectable="on" title="Font Size"><div unselectable="on">Font Size</div></a></div><div class="sceditor-group"><a class="sceditor-button sceditor-button-orderedlist" data-sceditor-command="orderedlist" unselectable="on" title="Numbered list"><div unselectable="on">Numbered list</div></a><a class="sceditor-button sceditor-button-bulletlist" data-sceditor-command="bulletlist" unselectable="on" title="Bullet list"><div unselectable="on">Bullet list</div></a><a class="sceditor-button sceditor-button-table" data-sceditor-command="table" unselectable="on" title="Insert a table"><div unselectable="on">Insert a table</div></a></div><div class="sceditor-group"><a class="sceditor-button sceditor-button-link" data-sceditor-command="link" unselectable="on" title="Insert a link"><div unselectable="on">Insert a link</div></a><a class="sceditor-button sceditor-button-yt" data-sceditor-command="yt" unselectable="on" title="Insert Image, Document, Audio or Video"><div unselectable="on">Insert Image, Document, Audio or Video</div></a></div><div class="sceditor-group"><a class="sceditor-button sceditor-button-superscript" data-sceditor-command="superscript" unselectable="on" title="Superscript"><div unselectable="on">Superscript</div></a><a class="sceditor-button sceditor-button-subscript" data-sceditor-command="subscript" unselectable="on" title="Subscript"><div unselectable="on">Subscript</div></a><a class="sceditor-button sceditor-button-square" data-sceditor-command="square" unselectable="on" title="Square Root"><div unselectable="on">Square Root</div></a><a class="sceditor-button sceditor-button-pastetext" data-sceditor-command="pastetext" unselectable="on" title="Paste Text"><div unselectable="on">Paste Text</div></a></div></div><iframe id="qa_frame_editor_ans8" frameborder="0" src="javascript:false" style="width: 540px; height: 93px;" src="./ClassMarker - Welcome_files/saved_resource(8).html"></iframe><textarea dir="ltr" style="display: none; width: 540px; height: 93px;"></textarea><div class="sceditor-grip"></div><div class="sceditor-resize-cover" style="display: none;"></div></div>
</div><div class="answer">
<div class="answer_heading">
<h5 class="">(I)</h5>
<input class="showCorrect mc_forminput" type="checkbox" name="correct9" value="9" id="a9">
<label for="a9" class="">This answer option is correct</label>
</div>
<textarea name="ans9" rows="3" cols="67" id="ans9" class="qclear mc_forminput fullBBcodeEditor" style="display: none;"></textarea><div class="sceditor-container ltr" style="width: 550px;" id="editor_ans9"><div class="sceditor-toolbar" unselectable="on"><div class="sceditor-group"><a class="sceditor-button sceditor-button-bold" data-sceditor-command="bold" unselectable="on" title="Bold"><div unselectable="on">Bold</div></a><a class="sceditor-button sceditor-button-italic" data-sceditor-command="italic" unselectable="on" title="Italic"><div unselectable="on">Italic</div></a><a class="sceditor-button sceditor-button-underline" data-sceditor-command="underline" unselectable="on" title="Underline"><div unselectable="on">Underline</div></a><a class="sceditor-button sceditor-button-strike" data-sceditor-command="strike" unselectable="on" title="Strikethrough"><div unselectable="on">Strikethrough</div></a><a class="sceditor-button sceditor-button-color" data-sceditor-command="color" unselectable="on" title="Font Color"><div unselectable="on">Font Color</div></a><a class="sceditor-button sceditor-button-size" data-sceditor-command="size" unselectable="on" title="Font Size"><div unselectable="on">Font Size</div></a></div><div class="sceditor-group"><a class="sceditor-button sceditor-button-orderedlist" data-sceditor-command="orderedlist" unselectable="on" title="Numbered list"><div unselectable="on">Numbered list</div></a><a class="sceditor-button sceditor-button-bulletlist" data-sceditor-command="bulletlist" unselectable="on" title="Bullet list"><div unselectable="on">Bullet list</div></a><a class="sceditor-button sceditor-button-table" data-sceditor-command="table" unselectable="on" title="Insert a table"><div unselectable="on">Insert a table</div></a></div><div class="sceditor-group"><a class="sceditor-button sceditor-button-link" data-sceditor-command="link" unselectable="on" title="Insert a link"><div unselectable="on">Insert a link</div></a><a class="sceditor-button sceditor-button-yt" data-sceditor-command="yt" unselectable="on" title="Insert Image, Document, Audio or Video"><div unselectable="on">Insert Image, Document, Audio or Video</div></a></div><div class="sceditor-group"><a class="sceditor-button sceditor-button-superscript" data-sceditor-command="superscript" unselectable="on" title="Superscript"><div unselectable="on">Superscript</div></a><a class="sceditor-button sceditor-button-subscript" data-sceditor-command="subscript" unselectable="on" title="Subscript"><div unselectable="on">Subscript</div></a><a class="sceditor-button sceditor-button-square" data-sceditor-command="square" unselectable="on" title="Square Root"><div unselectable="on">Square Root</div></a><a class="sceditor-button sceditor-button-pastetext" data-sceditor-command="pastetext" unselectable="on" title="Paste Text"><div unselectable="on">Paste Text</div></a></div></div><iframe id="qa_frame_editor_ans9" frameborder="0" src="javascript:false" style="width: 540px; height: 93px;" src="./ClassMarker - Welcome_files/saved_resource(9).html"></iframe><textarea dir="ltr" style="display: none; width: 540px; height: 93px;"></textarea><div class="sceditor-grip"></div><div class="sceditor-resize-cover" style="display: none;"></div></div>
</div><div class="answer">
<div class="answer_heading">
<h5 class="">(J)</h5>
<input class="showCorrect mc_forminput" type="checkbox" name="correct10" value="10" id="a10">
<label for="a10" class="">This answer option is correct</label>
</div>
<textarea name="ans10" rows="3" cols="67" id="ans10" class="qclear mc_forminput fullBBcodeEditor" style="display: none;"></textarea><div class="sceditor-container ltr" style="width: 550px;" id="editor_ans10"><div class="sceditor-toolbar" unselectable="on"><div class="sceditor-group"><a class="sceditor-button sceditor-button-bold" data-sceditor-command="bold" unselectable="on" title="Bold"><div unselectable="on">Bold</div></a><a class="sceditor-button sceditor-button-italic" data-sceditor-command="italic" unselectable="on" title="Italic"><div unselectable="on">Italic</div></a><a class="sceditor-button sceditor-button-underline" data-sceditor-command="underline" unselectable="on" title="Underline"><div unselectable="on">Underline</div></a><a class="sceditor-button sceditor-button-strike" data-sceditor-command="strike" unselectable="on" title="Strikethrough"><div unselectable="on">Strikethrough</div></a><a class="sceditor-button sceditor-button-color" data-sceditor-command="color" unselectable="on" title="Font Color"><div unselectable="on">Font Color</div></a><a class="sceditor-button sceditor-button-size" data-sceditor-command="size" unselectable="on" title="Font Size"><div unselectable="on">Font Size</div></a></div><div class="sceditor-group"><a class="sceditor-button sceditor-button-orderedlist" data-sceditor-command="orderedlist" unselectable="on" title="Numbered list"><div unselectable="on">Numbered list</div></a><a class="sceditor-button sceditor-button-bulletlist" data-sceditor-command="bulletlist" unselectable="on" title="Bullet list"><div unselectable="on">Bullet list</div></a><a class="sceditor-button sceditor-button-table" data-sceditor-command="table" unselectable="on" title="Insert a table"><div unselectable="on">Insert a table</div></a></div><div class="sceditor-group"><a class="sceditor-button sceditor-button-link" data-sceditor-command="link" unselectable="on" title="Insert a link"><div unselectable="on">Insert a link</div></a><a class="sceditor-button sceditor-button-yt" data-sceditor-command="yt" unselectable="on" title="Insert Image, Document, Audio or Video"><div unselectable="on">Insert Image, Document, Audio or Video</div></a></div><div class="sceditor-group"><a class="sceditor-button sceditor-button-superscript" data-sceditor-command="superscript" unselectable="on" title="Superscript"><div unselectable="on">Superscript</div></a><a class="sceditor-button sceditor-button-subscript" data-sceditor-command="subscript" unselectable="on" title="Subscript"><div unselectable="on">Subscript</div></a><a class="sceditor-button sceditor-button-square" data-sceditor-command="square" unselectable="on" title="Square Root"><div unselectable="on">Square Root</div></a><a class="sceditor-button sceditor-button-pastetext" data-sceditor-command="pastetext" unselectable="on" title="Paste Text"><div unselectable="on">Paste Text</div></a></div></div><iframe id="qa_frame_editor_ans10" frameborder="0" src="javascript:false" style="width: 540px; height: 93px;" src="./ClassMarker - Welcome_files/saved_resource(10).html"></iframe><textarea dir="ltr" style="display: none; width: 540px; height: 93px;"></textarea><div class="sceditor-grip"></div><div class="sceditor-resize-cover" style="display: none;"></div></div>
</div></div><div class="clear"></div>-->
<div id="show_selected_letters" class="hide"></div>
<div class="clearheight"></div></div></div><div class="hide tf_formdiv" style="display: none;"><div class="clearheight"></div>
<h5 class="left editShowCorrecttf">Answer</h5>&nbsp;&nbsp;&nbsp;
<input type="radio" name="correct" class="showCorrecttf tf_forminput  editShowCorrecttf" value="1" id="tf1" checked="checked" disabled="disabled">
<label for="tf1" class=" editShowCorrecttf">This answer is correct</label><div class="clear"></div>
<input type="text" name="tfans1" size="30" id="tfans1" class="tf_forminput" value="True" disabled="disabled"><div class="clearheight"></div>
<h5 class="left">Answer</h5>&nbsp;&nbsp;&nbsp;
<input type="radio" name="correct" class="showCorrecttf tf_forminput  editShowCorrecttf" value="2" id="tf2" disabled="disabled">
<label for="tf2" class="">This answer is correct</label><div class="clear"></div>
<input type="text" name="tfans2" size="30" id="tfans2" class="tf_forminput" value="False" disabled="disabled"><div class="clearheight30"></div>
<div class="clearheight"></div></div><div class="hide ft_formdiv" style="display: none;"><h5>Accepted answers
<span class="showTooltip tooltip" title="Add each separate accepted answer per box. Users will not see these when answering this question.">Tip</span></h5><p><input type="text" name="ans1" class="qclear ft_forminput" size="30" id="ftans1" value="" disabled="disabled"> Mandatory</p><p><input type="text" name="ans2" class="qclear ft_forminput" size="30" id="ftans2" value="" disabled="disabled"> Optional</p><p><input type="text" name="ans3" class="qclear ft_forminput" size="30" id="ftans3" value="" disabled="disabled"> Optional</p><p><input type="text" name="ans4" class="qclear ft_forminput" size="30" id="ftans4" value="" disabled="disabled"> Optional</p><p><input type="text" name="ans5" class="qclear ft_forminput" size="30" id="ftans5" value="" disabled="disabled"> Optional</p><div class="clearheight"></div></div><div class="hide p_formdiv" style="display: none;"><div id="punctuation_question_box">
<div>
<h5>Incorrect version <span class="showTooltip tooltip" title="Add a sentence with incorrect punctuation or grammar.">Tip</span></h5>
<p><input type="text" name="question" size="60" id="questionp" value="" class="edit_qboxes qclear p_forminput" disabled="disabled"></p>
</div><h5>Correct version (users will not see this during the test)
<span class="showTooltip tooltip" title="ClassMarker will compare corrections made to the sentence above with the correct version you add here.">Tip</span></h5><p><input type="text" name="pans" size="60" id="pans" value="" class="edit_qboxes qclear p_forminput" disabled="disabled"></p><div class="clearheight"></div>
</div></div><div class="hide delay_hide_sceditor e_formdiv" style="display: none;"><div class="clearheight"></div></div><a href="https://www.classmarker.com/a/tests/qb/manage/?test_id=755522&amp;qtype=mcsa#" id="tog_feedback" class="btn btn-add-wysiwyg add-feedback hideme">Add question feedback</a>
<div class="hide delay_hide_sceditor" id="dotog_feedback" style="display: none;"><div class="clearheight30"></div><div><h5 class="green">Feedback: Correctly answered
<span class="showTooltip tooltip" title="Feedback is optional. This text will show when Answer is correct">Tip</span></h5><div class="edToolbar"></div>
<textarea disabled="disabled" name="inactive" rows="2" cols="67"></textarea><br>
<a href="https://www.classmarker.com/a/tests/qb/manage/?test_id=755522&amp;qtype=mcsa#" class="upgradeRpc explain-underline">Add feedback</a></div><div class="clearheight"></div><div><h5 class="red">Feedback: Incorrectly answered
<span class="showTooltip tooltip" title="Feedback is optional. This text will show when Answer is incorrect">Tip</span></h5><div class="edToolbar"></div>
<textarea disabled="disabled" name="inactive" rows="2" cols="67"></textarea><br>
<a href="https://www.classmarker.com/a/tests/qb/manage/?test_id=755522&amp;qtype=mcsa#" class="upgradeRpc explain-underline">Add feedback</a></div></div><div class="clearheight30"></div>
<h5>Category <span class="showTooltip tooltip" title="Select the category for this question.">Tip</span></h5>
<select name="cat_id" id="cat_id"><option value="0" selected="selected">Generic</option></select> <a href="https://www.classmarker.com/a/tests/qb/manage/?test_id=755522&amp;qtype=mcsa#" id="createCatRpc_" class="not-ie67 not-ie8">New category</a><div><div class="clearheight30"></div><h5>Points Available
<span class="showTooltip tooltip" original-title="How many points this question is worth. Decimals are allowed. EG: 1 or 2.5">Tip</span></h5>
<input type="text" id="points" name="points" maxlength="5" value="1" size="2">
<div id="warn_change_points"></div>
</div><div class="hide mc_formdiv" style="display: block;"><div id="random_options"><div class="clearheight30"></div>
<h5>Randomize Answers
<span class="showTooltip tooltip" title="Show answers in random order. The A), B), C) prefix is not shown during the test for questions whose answers are given in random order.
		 This is because (for group discussions &amp; reviewing) final results are always displayed in original answer ordering and creates confusion
		  if a user recalls selecting an answer with prefix A) for a question, however, the results view show
		  their selected answer now with a prefix as C).">Tip</span></h5><input type="radio" name="random_a" checked="checked" value="0" id="ra_1" class="mc_forminput"> <label for="ra_1">No</label>
<div class="clearheight5"></div>
<input type="radio" name="random_a" value="1" id="ra_2" class="mc_forminput"> <label for="ra_2">Yes</label></div></div><div class="hide mc_formdiv" style="display: block;"><div id="show_radio_or_checkbox"><div class="clearheight30"></div><h5>Answer Selection</h5>
<input type="radio" name="radio_or_checkbox_not_used" checked="checked" value="0" id="roc_0" class="mc_forminput"> <label for="roc_0">Radio buttons (Only one answer option can be selected)</label>
<span class="showTooltip tooltip" title="Radio buttons are used to enforce (and indicate) only one answer can be selected as the correct answer.">Tip</span>
<div class="clearheight5"></div>
<input type="radio" name="radio_or_checkbox_not_used" value="1" id="roc_1" class="mc_forminput"> <label for="roc_1">Checkboxes (Multiple answer options can be selected)</label>
<span class="showTooltipHTML tooltip" title="Checkboxes are used to indicate one or more answers can be selected as the correct answer (Tip: Checkboxes can make questions more difficult when only one answer is correct).">Tip</span>
</div></div><div class="hide mc_formdiv" style="display: block;"><div id="show_grade_style" style="display: none;"><div class="clearheight30"></div><h5>Grading Scale</h5>
<input type="radio" name="grade_style" checked="checked" value="0" id="gs_0" class="mc_forminput"> <label for="gs_0">Off</label>
<span class="showTooltipHTML tooltip" title="Full points for correct answer&lt;br/&gt;Zero points if any error is made">Tip</span>
<div class="clearheight5"></div>
<input type="radio" name="grade_style" value="1" id="gs_1" class="mc_forminput"> <label for="gs_1">Partial with deduction</label>
<span class="showTooltip tooltip" title="Partial points for some correct, remove partial points for incorrect answers">Tip</span>
<div class="clearheight5"></div>
<input type="radio" name="grade_style" value="2" id="gs_2" class="mc_forminput"> <label for="gs_2">Partial without deduction</label>
<span class="showTooltip tooltip" title="Partial points for some correct, do not remove points for incorrect answers">Tip</span></div></div></div><div class="col-span-3">&nbsp;</div></div>
<div id="div_preview" class="hide bbcode" style="display: none;"></div><div class="clearheight30"></div>
<div id="msgDivError"></div>
<div id="edit-question-btns">
<a class="btn btn-analytics preview_question_link ">Preview</a>
<a class="btn btn-analytics edit_question_link margleft" style="display: none;">Edit</a>
<a href="https://www.classmarker.com/a/tests/qb/manage/?test_id=755522&amp;qtype=mcsa#" id="save_question" class="btn btn-create margleft">Save</a>
<a href="https://www.classmarker.com/a/tests/test/?test_id=755522#q" class="btn btn-cancel cancel_link f-right confirm-cancel">Cancel</a>
</div>
</form>
</div>
</div>
 
<div class="jqmWindow jqmID1" id="symbolsDiv"></div>
<div class="jqmWindowWide jqmID2" id="questionExamplesDiv"></div>
</div> 
<img src="./ClassMarker - Welcome_files/icon_loading_circleV3.gif" alt="Hidden Loading Image" class="hide" width="20" height="20">
</div>


{% endblock %}