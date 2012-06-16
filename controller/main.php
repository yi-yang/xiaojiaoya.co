<?php
class main extends spController
{
	function show(){
		echo "Enjoy, Speed of PHP!";
		echo "<br><br>";
		echo "<br>新闻种类：<a href='index.php?c=lists'>lists</a>";
		echo "<br>新闻：<a href='index.php?c=msg'>msg</a>";
		echo "<br>特殊页面：<a href='index.php?c=special'>special</a>";
	}

	function index() {
		$m_msg = spClass("m_msg");
		$this->msg_list = $m_msg->findSql("select id,title from msg where msg.list_id = 2");
		$this->msg_list2 = $m_msg->findSql("select id,title from msg where msg.list_id in (select id from lists where root_id = 7)");
		$this->msg_list3 = $m_msg->findSql("select id,title from msg where msg.list_id = 5");
		$this->display("main.tpl");
	}
}
