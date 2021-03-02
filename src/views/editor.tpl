% rebase("bootstrap.tpl")
<div class = "container">
<h1>EDITOR</h1>

<p>Add question, add or remove options and view results</p>
%if s["question"] == "":
%title = s["title"]
<br>
<form action="/editor" method="post">
   <input type="text" name="question" />
   <input value="Post question" type="submit" class="btn btn-primary"  />
</form>
<br>
%else:
%question = s["question"]
<b> Qestion: {{question}} </b>
%end
<br>
<form action="/editor" method="post">
  Add option: <input type="text" name="add_option" />
   <input value="Add option" type="submit" class="btn btn-primary"  />
</form>
<br>

<br>
% if s["options"] != {}:
   <b> Options: </b>

%for number in range(len(options)):
%option = options[number]
%votes = s["options"][option]
%s_n=str(number)
<div class="container">
  <div class="row">
    <div class="col-6">
      {{option}}
    </div>
    <div class="col">
      Votes: {{votes}}
    </div>
    <div class="col">
      <form action="/editor" method="post">
 <input value="Remove option" name = {{s_n}}  type="submit" class="btn btn-primary"  />
</form>
    </div>
  </div>
</div>
%end
<br>


%answers = s["answers"]
%if len(answers) != 0:
Answers:
<ul>
%for answer in answers:
  <li>{{answer}}</li>
</ul>  
<br>
%end
%end
%end
<form action="/editor" method="post">
   <input name="login" value="Login" type="submit" class="btn btn-secondary btn-lg"  />
</form>
<form action="/editor" method="post">
   <input name="forum" value="Forum" type="submit" class="btn btn-secondary btn-lg"  />
</form>
<br>
</div>
