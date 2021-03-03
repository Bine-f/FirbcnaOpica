% rebase("bootstrap.tpl")

<body>
<div class = "container">
%question = s["question"]
<p>Answer to question:</p>
<div class="container">
  <div class="row">
    <div class="col-6">
      <div class="p-3 border bg-light"><p><b>{{question}}</b></p></div>
      </div>    
  </div>
</div>


%for number in range(len(options)):
%option= options[number]
%s_n=str(number)
<br>
<form action="/answer" method="post">
  {{option}} <input name = {{s_n}} value="select option" type="submit"class="btn btn-success"  />
</form>
<br>
%end


<br>
<form action="/answer" method="post">
  answer: <input type="text" name="add_answer" />
   <input value="add" type="submit"class= "btn btn-primary"  />
</form>
<br>
<br>
<form action="/answer" method="post">
   <input name="forum" value="Forum" type="submit"class= "btn btn-secondary btn-lg"  />
</form>
<br>
</div>
