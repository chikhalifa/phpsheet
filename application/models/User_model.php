<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User_model extends CI_Model {

	public function __construct() {
		parent::__construct();
		$this->table = 'regional_credit_volume';
        $this->table1 = 'regional_target_volume';
		$this->attachmentdetail = 'attachmentdetail';
		$this->limit=NULL;
		$this->offset=NULL;
        
        
	}
    public $primary_table = '';

	public function add($data) {
		$this->db->insert($this->table, $data);
		return $this->db->insert_id();
	}
    public function add2($data) {
		$this->db->insert($this->table1, $data);
		return $this->db->insert_id();
	}
	public function update($where, $data) {
		return $this->db->update($this->table, $data, $where);
	}

	public function delete($where) {
		return $this->db->delete($this->table, $where);
	}

	public function get($where = 0) {
		if($where) 
			$this->db->where($where);
		$query = $this->db->get($this->attachmentdetail);
		return $query->row();
	}

	public function get_all($where = 0, $order_by_column = 0, $order_by = 0) {
		if($where) 
			$this->db->where($where);
		if($order_by_column and $order_by) 
			$this->db->order_by($order_by_column, $order_by);
		$query = $this->db->get($this->table);
		return $query->result();
	}

	public function get_num_rows($where = 0) {
		if($where) 
			$this->db->where($where);
		$query = $this->db->get($this->table);		
		return $query->num_rows();
	}

	public function add_batch($data) {
		return $this->db->insert_batch($this->table, $data);
	}
	public function add_batch2($data) {
		return $this->db->insert_batch($this->table1, $data);
	}
	public function run_qry($sql, $action='result', $multi=''){
        $qry_res=$this->db->query($sql);
        //log_message("error", "run proc log - ".$this->db->last_query()); 
        
        switch ($action) {
            case "run":
                return TRUE;
                break;         
            case "result":
                if ($qry_res->num_rows() < 1) {$res= Null;}
                if ($qry_res->num_rows() == 1 && $multi=='') {$res= $qry_res->row();
                } else {$res= $qry_res->result();}
                // $qry_res->next_result();
                $qry_res->free_result();
                return $res;
                break;      
            case "count":
                return $qry_res->num_rows();  
                break;          
            case "qry":
                return $qry_res;             
                break;
        }
    }   
	function get_records($request_id) {
        $query = $this->db->get_where('regional_target_volume', array('request_id' => $request_id), $this->limit, $this->offset);
        return $query->result_array();
    }

}