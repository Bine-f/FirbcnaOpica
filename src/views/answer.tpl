% rebase("bootstrap.tpl")

<body>
<div class = "container">
<h1>Answer</h1>
%question = s["question"]
Answer to question:
<p>{{question}}</p>

%for number in range(len(options)):
%option= options[number]
%s_n=str(number)
<br>
<form action="/answer" method="post">
  {{option}} <input name = {{s_n}} value="select option" type="submit"class="btn btn-outline-success btn-sm"  />
</form>
<br>
%end


<br>
<form action="/answer" method="post">
  answer: <input type="text" name="add_answer" />
   <input value="add" type="submit"class="btn btn-outline-success btn-sm"  />
</form>
<br>
<br>
<form action="/answer" method="post">
   <input name="forum" value="Forum" type="submit"class="btn btn-outline-success btn-sm"  />
</form>
<br>
</div>
