% rebase("bootstrap.tpl")
<div class="p-3 mb-2 bg-warning text-dark">
<h1 style="color:blue;">ANSWER</h1>

<p>Select an option or add new answer</p>
</div>
<div class = "container">
%question = s["question"]
<p>QUESTION:</p>
<b><strong> {{question}}</strong> </b>
<br>


% if s["options"] != {}:
<br>
   <b> OPTIONS: </b>
<table class="table table-primary table-striped">
  <thead>
    <tr>
      <th scope="col">Option</th>
      <th scope="col">Votes</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
%for number in range(len(options)):
%option = options[number]
%votes = s["options"][option]
%s_i=str(number)
    <tr>
      <th scope="row">{{option}}</th>
      <td>{{votes}}</td>
      <td>
        <form action="/answer" method="post">
          <input value="Select option" name = {{s_i}}  type="submit" class="btn btn-success"  />
        </form>
      </td>
    </tr>
%end
%end
  </tbody>
  </table>
<br>
%answers = s["answers"]
%if len(answers) != 0:
<b> ANSWERS: </b>

<table class="table table-success table-striped">
  <thead>
    <tr>
      <th scope="col">Answer</th>
      <th scope="col">User</th>
    </tr>
  </thead>
  <tbody>
%for u in answers:
%for an in answers[u]:
    <tr>
      <th scope="row">-{{an}}</th>
      <td>{{u}}</td>
    </tr>
%end
%end
%end
</tbody>
</table>
<br>
<br>
<form action="/answer" method="post">
  <strong>ADD NEW ANSWER</strong>: <input type="text" name="add_answer" />
   <input value="Add" type="submit"class= "btn btn-primary"  />
</form>

<br>
<form action="/answer" method="post">
   <input name="forum" value="Forum" type="submit"class= "btn btn-secondary btn-lg"  />
</form>
<br>
</div>
