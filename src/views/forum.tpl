
% rebase("bootstrap.tpl")
<div class = "container">
<h1>Wellcome {{user}}, on this site you can upload new questions and view other questions</h1>

<p>Enter title of your question</p>

<br>
<form action="/forum" method="post">
  Title of question: <input type="text" name="add_title" />
   <input value="Post title" type="submit"class="btn btn-outline-success btn-sm"  />
</form>
<br>

</div>
<div class = "container">
<h1>VIEW TITLES:</h1>
%for n in range (len(sets)):
%title = sets[n]["title"]
%owner = sets[n]["owner"]
%name = owner+"_"+title
%i=str(n)

<div class="container">
  <div class="row">
    <div class="col">
      <form action="/forum" method="post">
 <input value="VIEW QUESTION" name = {{i}}  type="submit"class="btn btn-outline-success btn-sm"  />
</form>
    </div>
    <div class="col-6">
      {{title}}
    </div>
    <div class="col">
      Author: {{owner}}
    </div>
  </div>
</div>
%end
<br>
<form action="/forum" method="post">
   <input name="login" value="login" type="submit"class="btn btn-outline-success btn-sm"  />
</form>
<br>
