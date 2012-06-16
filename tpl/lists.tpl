<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-cn" lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加新闻种类</title>
</head>
<body>
<div id="main">
<h1><a href="<{spUrl c=main a=show}>">回到管理首页</a> <a href="<{spUrl c=lists a=index}>"><span>添加list</span></a></h1>
  <div class="boxin">
	<h2 class="tutor">请填写list信息</h2>
		<form action="<{spUrl c=lists a=add}>" method=POST>
		<p>标题：<input type=text name='name' size=40></p>
	<p>选择上层list：<select name="root_id">
	<option value="0"></option>
		<{foreach from=$results item=iter}>
			<{if $iter.root_id == 0}>
			<option value="<{$iter.id}>"><{$iter.name}></option>
			<{/if}>
		<{/foreach}>
	</select>
	</p>
		<p><input type=submit value=" 提交 "></p>
		</form>
    <ul class="list">
 <{foreach from=$results item=one}>
      <li><{$one.id}> <a href="<{spUrl c=lists a=show id=$one.id}>"><{$one.name}></a> <{$one.date}> <{$one.root_id}> <a href="<{spUrl c=lists a=del id=$one.id }>">delete</a> 
	<a href="<{spUrl c=lists a=edit id=$one.id }>">edit</a>
	</li>
<{/foreach}>
    </ul>
  </div>
</div>
</body>
</html>	

