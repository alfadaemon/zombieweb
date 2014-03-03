
	var whatbadguy = 0;
	var estado = 'Stage1';
	
	function AnimateBadAnswer(){
	if(whatbadguy == 0){
			letmove1 = true;
			whatbadguy = 1;
			badguys1.animation.run('walking');
		}
		else if(whatbadguy == 1){
			letmove2 = true;
			whatbadguy = 0;
			badguys2.animation.run('walking');
		}
	}
	function AnimateGoodAnswer(){
		if (estado == 'Stage5'){
			goodGuy.animation.run('stage5');
			estado = 'Stage6';
		}
		if (estado == 'Stage4'){
			goodGuy.animation.run('stage4');
			estado = 'Stage5';
		}
		if (estado == 'Stage3'){
			goodGuy.animation.run('stage3');
			estado = 'Stage4';
		}
		if (estado == 'Stage2'){
			goodGuy.animation.run('stage2');
			estado = 'Stage3';
		}
		if (estado == 'Stage1'){
			goodGuy.animation.run('stage1');
			estado = 'Stage2';
		}
	}
	
	function Button1_onclick() {
		AnimateGoodAnswer();					
     }
	 
	 
var items;
var num = 0;
var values;

function nextQuestion(){
  if(items.length == num){
      num = 0;
    }
  var item;
  item = items[num];

      document.getElementById("the_list").innerHTML=item;
    document.getElementById("a").innerHTML=values[num].answers[0].answer;
    document.getElementById("b").innerHTML=values[num].answers[1].answer;
    document.getElementById("c").innerHTML=values[num].answers[2].answer;

      num = num + 1;
};

function validate(resp){
  $.getJSON("/api/v1/answers/" + values[num-1].answers[resp].id,function(data){
      if(data.correct == true){
        alert("Correcto");
		AnimateGoodAnswer();
        nextQuestion();
      }
      else
      {
        alert("Incorrecto");
		AnimateBadAnswer();
        nextQuestion();
      }
  });
}

 $(document).ready(function() {
    $.getJSON("/api/v1/questions", function(data) {
      //var items;
      items = [];
      values = [];
      $.each(data, function(key, val) {
        items.push("<li id='" + val.id + "'>" + val.question + "</li>");
        values.push(val);
      });
    });
  });