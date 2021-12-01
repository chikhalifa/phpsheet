<?php
defined('BASEPATH') OR exit('No direct script access allowed');
date_default_timezone_set('Africa/Lagos');
require 'vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\WriterXlsx;
use PhpOffice\PhpSpreadsheet\ReaderIReader;
use PhpOffice\PhpSpreadsheet\IOFactory;

class Home extends CI_Controller {
    public function __construct() {
		parent::__construct();
		// Load Model
		$this->load->helper('url', 'form');
		$this->load->model('User_model');
		$this->ip_address    = $_SERVER['REMOTE_ADDR'];
		$this->datetime 	    = date("Y-m-d H:i:s");
	}

	public function index()
	{
		$this->load->view('index');
	}
    public function import() {
	
		$path 		= 'uploads/imports/';
		$json 		= [];
		// $this->upload_config($path);
		$config['upload_path'] 		= './'.$path;		
		$config['allowed_types'] 	= 'csv|CSV|xlsx|XLSX|xls|XLS';
		$config['max_filename']	 	= '255';
		$config['encrypt_name'] 	= FALSE;
		$config['max_size'] 		= 4096; 
		$this->load->library('upload', $config);
		if (!$this->upload->do_upload('profile_pic')) {
			$error = array('error' => $this->upload->display_errors());
			echo"test";
			$json = [
				// 'error_message' => showErrorMessage($this->upload->display_errors()),
			];
		}else {
			$file_data 	= $this->upload->data();
			$file_name 	= $path.$file_data['file_name'];
			// $filename = $this->upload->do_upload("profile_pic");
			var_dump($file_name);
			// die("name");
			$arr_file 	= explode('.', $file_name);
			$extension 	= end($arr_file);
			if('csv' == $extension) {
				$reader 	= new \PhpOffice\PhpSpreadsheet\Reader\Csv();
			} else {
				$reader 	= new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
			}
			$spreadsheet 	= $reader->load($file_name);
			// $sheet_data 	= $spreadsheet->getActiveSheet()->toArray();
			$list 			= [];
            $sheetCount = $spreadsheet -> getSheetCount();
			var_dump( $sheetCount)  ; 
			die("here");
for ($i = 0; $i < $sheetCount; $i++) {
   $sheet = $spreadsheet -> getSheet($i);
   $highestRow = $sheet->getHighestRow(); // e.g. 10
    $highestColumn = $sheet->getHighestColumn(); // e
   $sheetData = $sheet -> toArray(null, true, true, true);
   for ($row = 9; $row <= $highestRow; ++$row) {
    echo '<tr>' ;
    for ($col = 'A'; $col != $highestColumn; ++$col) {
        echo '<td>' .
           $sheetRecord=  $sheetData->getCell($col . $row)  ->getValue() ;
          var_dump( $sheetRecord)  ; 
          die("here");
    }
    
}


			foreach($sheet_data as $key => $val) {
				if($key != 0) {
					$result 	= $this->user->get(["country_code" => $val[2], "mobile" => $val[3]]);
					if($result) {
					} else {
						$list [] = [
							'name'					=> $val[0],
							'country_code'			=> $val[1],
							'mobile'				=> $val[2],
							'email'					=> $val[3],
							'city'					=> $val[4],
							'ip_address'			=> $this->ip_address,
							'created_at' 			=> $this->datetime,
							'status'				=> "1",
						];
					}
				}
			}
			if(file_exists($file_name))
				unlink($file_name);
			if(count($list) > 0) {
				$result 	= $this->user->add_batch($list);
				if($result) {
					$json = [
						'success_message' 	=> showSuccessMessage("All Entries are imported successfully."),
					];
				} else {
					$json = [
						'error_message' 	=> showErrorMessage("Something went wrong. Please try again.")
					];
				}
			} else {
				$json = [
					'error_message' => showErrorMessage("No new record is found."),
				];
			}
		}
		echo json_encode($json);
	}
}
	public function upload_config($path) {
		if (!is_dir($path)) 
			mkdir($path, 0777, TRUE);		
		$config['upload_path'] 		= './'.$path;		
		$config['allowed_types'] 	= 'csv|CSV|xlsx|XLSX|xls|XLS';
		$config['max_filename']	 	= '255';
		$config['encrypt_name'] 	= FALSE;
		$config['max_size'] 		= 4096; 
		$this->load->library('upload', $config);
	}

}
