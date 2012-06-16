<?php
class lists extends spController
{
	function index() {
		$m_lists = spClass("m_lists");
		$this->results = $m_lists->findAll();
		//var_dump($this->results);
		$this->display("lists.tpl");
	}

	function show() {
		if ($id = $this->spArgs("id")) {
			$m_lists = spClass("m_lists");
			$this->list_result = $m_lists->find(array('id' => $id));

			$root_id = $this->list_result['root_id'];

			if ($root_id != 0 ) {
				$root_list_result = $m_lists->find(array('id' => $root_id), NULL, "name");
				$this->root_list = $root_list_result['name'];
				$list_all_condition = "id = $root_id OR root_id = $root_id";
			}
			else {
				$list_all_condition = "id = $id OR root_id = $id";
				$this->root_list = $this->list_result['name'];
			}
			
			$this->list_all = $m_lists->findall($list_all_condition);

			if ($root_id == 0) {
				$id_condition = "";
				foreach ($this->list_all as $iter) {
					if ($id_condition == "") {
						$id_condition = $iter['id'];
					}
					else {
						$id_condition = $id_condition.",".$iter['id'];
					}
				}
				$id_condition = "list_id in (".$id_condition.")";
			} 
			else {
				$id_condition = array('list_id' => $id);
			}
			$m_msg = spClass("m_msg");
			$this->msg_list = $m_msg->spPager($this->spArgs('page', 1), 10)->findAll($id_condition, 'date DESC', "id, title, content, click, date(date) as day");

			$this->pager = $m_msg->spPager()->getPager();

			//var_dump($this->pager);
			//var_dump($this->msg_list);
			//var_dump($this->list_result);
			//var_dump($this->root_list);
			//var_dump($this->list_all);
			//var_dump($id_condition);
			$this->display("lists_show.tpl");
		}
	}

	function add() {
		if ($name = $this->spArgs("name")) {
			$date = date('Y-m-d H:i:s',time());
			$newrow = array(
				'name' => $name,
				'date' => $date,
				'root_id' => $this->spArgs("root_id"),
			);
			//var_dump($newrow);
			$m_lists = spClass("m_lists");
			$m_lists->create($newrow);
		}
		$this->jump(spUrl('lists', 'index'));
	}

	function del() {
		if ($id = $this->spArgs("id")) {
			$m_lists = spClass("m_lists");
			$conditions = array('id' => $id);
			$m_lists->delete($conditions);
		}
		$this->jump(spUrl('lists', 'index'));
	}

	function edit() {
		if ($id = $this->spArgs("id")) {
			$conditions = array('id' => $id);
			$m_lists = spClass("m_lists");

			$this->lists_all = $m_lists->findAll();

			if ($this->result = $m_lists->find($conditions))
				$this->display("lists_edit.tpl");
			else 
				$this->jump(spUrl('lists', 'index'));
		}
		else {
			$this->jump(spUrl('lists', 'index'));
		}
	}

	function update() {
		if (($name = $this->spArgs("name")) && ($id= $this->spArgs("id"))) {
			$conditions = array('id' => $id);
			$date = date('Y-m-d H:i:s',time());
			$newrow = array(
				'name' => $name,
				'date' => $date,
				'root_id' => $this->spArgs("root_id"),
			);
			$m_lists = spClass("m_lists");
			$m_lists->update($conditions, $newrow);
		}
		$this->jump(spUrl('lists', 'index'));
	}
}
?>
