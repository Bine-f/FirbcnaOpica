
% rebase("bootstrap.tpl")
<div class="p-3 mb-2 bg-warning text-dark">
<h1 style="color:blue;">FORUM</h1>

<p>Welcome {{user}}, on this site you can add new questions and view other questions.</p>
</div>
<div class = "container">
<h1><strong>ADD QUESTION:</strong></h1>
<p>To add new question, you have to enter the title first. </p>

<br>
<form action="/forum" method="post">
  Title of question: <input type="text" name="add_title" />
   <input value="Post title" type="submit"class="btn btn-primary btn-lg"  />
</form>
<br>



<h1><strong>VIEW TITLES:</strong></h1>
<table class="table table-primary table-striped">
  <thead>
    <tr>
      <th scope="col">Title</th>
      <th scope="col">Author</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
%for n in range (len(sets)):
%title = sets[n]["title"]
%owner = sets[n]["owner"]
%name = owner+"_"+title
%i=str(n)
    <tr>
      <th scope="row">{{title}}</th>
      <td>{{owner}}</td>
      <td>
        <form action="/forum" method="post">
        <input value="VIEW QUESTION" name = {{i}}  type="submit"class="btn btn-primary"  />
        </form>
      </td>
    </tr>
%end
  </tbody>
  </table>
<div class = "container">
<br>
<form action="/forum" method="post">
   <input name= "login" value= "Logout" type = "submit" class = "btn btn-secondary btn-lg"  />
</form>
<br>
</div>