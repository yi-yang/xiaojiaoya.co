<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-cn" lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加新闻种类</title>
</head>
<body>
<div id="main">
<h1><a href="<{spUrl c=main a=show}>">回到管理首页</a> <a href="<{spUrl c=msg a=index}>"><span>添加新闻</span></a> <a href="<{spUrl c=msg a=index}>">所有新闻</a></h1>
  <div class="boxin">
    <ul class="list">
 <{foreach from=$results item=one}>
      <li><{$one.id}> <a href="<{spUrl c=msg a=show id=$one.id}>"><{$one.title}></a> <{$one.date}> <a href="<{spUrl c=msg a=index list_id=$one.list_id}>"><{$one.list_name}></a> <a href="<{spUrl c=msg a=del id=$one.id }>">delete</a> 
	<a href="<{spUrl c=msg a=edit id=$one.id }>">edit</a>
	</li>
<{/foreach}>
    </ul>

	<h2 class="tutor">请填写新闻内容</h2>
	<form action="<{spUrl c=msg a=add}>" method=POST>
	<p>选择新闻种类：<select name="list_id">
		<{foreach from=$lists item=iter}>
			<option value="<{$iter.id}>"><{$iter.name}></option>
		<{/foreach}>
	</select>
	</p>
	<p>标题：<input type=text name='title' size=40></p>
	<p>内容：</p>
	<p><{$editor}></p>
	<p><input type=submit value=" 提交 "></p>
	</form>

  </div>
</div>
</body>
</html>	

