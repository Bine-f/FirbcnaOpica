% rebase("bootstrap.tpl")
<div class="p-3 mb-2 bg-warning text-dark">
  <h1 style="color:blue;">EDITOR</h1>

  <p>Add question, add or remove options and view results</p>
</div>
<div class = "container">
  %if s["question"] == "":
  %title = s["title"]
  <br>

  <form action="/editor" method="post">
    <b> Qestion:</b> <input type="text" name="question" />
      <input value="Post question" type="submit" class="btn btn-success"  />
  </form>
  <br>
  %else:
  %question = s["question"]
  <b> Question: {{question}} </b>
  %end
</div>
<br>
<div class = "container">
  <form action="/editor" method="post">
    Add option: <input type="text" name="add_option" />
    <input value="Add option" type="submit" class="btn btn-success"  />
  </form>
  <br>

  <br>
  % if s["options"] != {}:
    <b> Options: </b>
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
  %s_n=str(number)
      <tr>
        <th scope="row">{{option}}</th>
        <td>{{votes}}</td>
        <td>
          <form action="/editor" method="post">
            <input value="Remove option" name = {{s_n}}  type="submit" class="btn btn-danger"  />
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
  <b> Answers: </b>

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
        <th scope="row">{{an}}</th>
        <td>{{u}}</td>
      </tr>
  %end
  %end
  %end
  </tbody>
  </table>
  <br>
</div>
<div class="container">
  <form action="/editor" method="post">
    <input name="remove" value="Remove question" type="submit" class="btn btn-danger btn-lg"  />
  </form>
  <br>
</div>
<div class="container">
  <form action="/editor" method="post">
    <input name="forum" value="Forum" type="submit" class="btn btn-secondary btn-lg"  />
  </form>
  <br>

</div>
