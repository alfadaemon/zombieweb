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
            nextQuestion();
        }
        else
        {
            alert("Incorrecto");
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