<{include file="header.tpl"}>
<div align="center">
<div id="body">
<div class="table">

<div id="left">

 
  
<style>
ul { padding:0; margin:0;}
#main1,#main2 { width:244px; height:28px; line-height:28px; padding-left:5px; background:#ccc; cursor:pointer; border-bottom:1px solid #fff;}
#child1,#child2 { width:248px; background:#eee;}
#child1 ul li,#child2 ul li { padding-left:5px; border-bottom:1px solid #fff; line-height:180%;}
#child1 ul li a,#child2 ul li a { color:#666;}
</style>

 
 <div>
 
 
	<div class="border_no_top" style="height:auto;">
		<div class="notice-marquee"   style="line-height:18px;text-align:left;">
<div id="main1" onClick="document.getElementById('child1').style.display=(document.getElementById('child1').style.display =='none')?'':'none'" ><img src="files/jh.gif" border="0"><{$root_list}></a></div>
<div id="child1"  >
<ul>
<{foreach from=$list_all item=one}>
<{if $one.root_id != 0}>
<li><a href="<{spUrl c=lists a=show id=$one.id}>"><{$one.name}></a></li> 
<{/if}>
<{/foreach}>
			 
</ul>
</div>
		</div>
	</div>
 
</div>
 
<div class="space_between"><div class="space_between"></div></div>
 
 
 
 	
 
 
 
 
  
 






</div>

<div id="right">
	<div class="global_sub"><{$list_result.name}></div>
	<div class="border_no_top">
	<{foreach from=$msg_list item=msg}>
				<div class="list_out" onmouseover="this.className='list_over'" onmouseout="this.className='list_out'">
			<table cellpadding="0" cellspacing="0">
			<tr>
				<td height="23px" width="580px">&nbsp;
					<img src="files/preart.gif" border="0" align="absmiddle">&nbsp;
				<a href="<{spUrl c=msg a=show id=$msg.id}>" title="<{$msg.title}>" style=""><{$msg.title}></a>
				</td>
				<td width="80px"><a href="list.php?id=6" title="<{$list_result.name}>"></a></td>
				<td width="50px"><{$msg.click}></td>
				<td width="100px" align="right"><{$msg.day}>&nbsp;</td>
			</tr>
			</table>
		</div>
		<{/foreach}>
		<{if $pager}>
		<div align="right"><table class='pagelist'><tr><td class='n'><{$pager.page_size}>/<{$pager.total_count}></td>
	<td class='n'>
	<{if $pager.current_page != $pager.first_page}>
	<a href="<{spUrl c=lists a=show id=$list_result.id page=$pager.first_page}>">首页</a> | 
	<a href="<{spUrl c=lists a=show id=$list_result.id page=$pager.prev_page}>">上一页</a> | 
	<{/if}>
	</td>
<!--开始循环页码，同时如果循环到当前页则不显示链接-->
<{foreach from=$pager.all_pages item=thepage}>
	<{if $thepage != $pager.current_page}>
		<td class='n'><a href="<{spUrl c=lists a=show id=$list_result.id page=$thepage}>"><{$thepage}></a></td>
	<{else}>
		<!-- <b><{$thepage}></b> -->
		<td class='m'><{$thepage}></td>
	<{/if}>
<{/foreach}>
<!--在当前页不是最后一页的时候，显示下一页和后页-->
<{if $pager.current_page != $pager.last_page}>
 | 
<td class='n'><a href="<{spUrl c=lists a=show id=$list_result.id page=$pager.next_page}>">下一页</a></td>
<td class='n'><a href="<{spUrl c=lists a=show id=$list_result.id page=$pager.last_page}>">尾页</a></td>
<{/if}>

</tr></table></div>
<{/if}>
	</div>
</div>
<div style="clear:both;"></div>

</div>
</div>
</div>

<{include file="footer.tpl"}>
