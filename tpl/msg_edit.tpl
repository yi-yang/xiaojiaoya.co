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

	<h2 class="tutor">修改新闻</h2>
	<form action="<{spUrl c=msg a=update}>" method=POST>
	<p>id: <input type=text name='id' size=40 readonly value="<{$result.id}>" > </p>
	<p>选择新闻种类：<select name="list_id">
		<{foreach from=$lists_all item=iter}>
			<option value="<{$iter.id}>"
				<{if $result.list_id == $iter.id}>
					selected
				<{/if}>
			><{$iter.name}></option>
		<{/foreach}>
	</select>
	</p>
	<p>标题：<input type=text name='title' size=40 value="<{$result.title}>"></p>
	<p>内容：</p>
	<p><{$editor}></p>
	<p><input type=submit value=" 提交 "></p>
	</form>

  </div>
</div>
</body>
</html>	

