<?php
defined('BASEPATH') or exit('No direct script access allowed');
date_default_timezone_set('Africa/Lagos');
require 'vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
// use PhpOffice\PhpSpreadsheet\WriterXlsx;
use PhpOffice\PhpSpreadsheet\Worksheet;
use PhpOffice\PhpSpreadsheet\IOFactory;
use phpoffice\phpexcel\IOFactor;

class Home extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		// Load Model
		$this->load->helper('url', 'form');
		$this->load->model('User_model', 'user');
		$this->ip_address    = $_SERVER['REMOTE_ADDR'];
		$this->datetime         = date("Y-m-d H:i:s");
	}
	public function index()
	{
		$this->load->view('index');
	}
	// GET RESULT USING PHPSPREEDSHEET
	public function import()
	{
		$TITLE = "MIDDLE BELT";
		$path       = 'uploads/imports/';
		$json       = [];
		// $this->upload_config($path);
		$config['upload_path']      = './' . $path;
		$config['allowed_types']    = 'csv|CSV|xlsx|XLSX|xls|XLS';
		$config['max_filename']     = '255';
		$config['encrypt_name']     = FALSE;
		$config['max_size']         = 4096;
		$this->load->library('upload', $config);
		if (!$this->upload->do_upload('profile_pic')) {
			$error = array('error' => $this->upload->display_errors());
			echo "test";
			$json = [
				// 'error_message' => showErrorMessage($this->upload->display_errors()),
			];
		} else {
			$file_data  = $this->upload->data();
			$file_name  = $path . $file_data['file_name'];
			$arr_file   = explode('.', $file_name);
			$extension  = end($arr_file);
			if ('csv' == $extension) {
				$reader     = new \PhpOffice\PhpSpreadsheet\Reader\Csv();
			} else {
				$reader     = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
			}
			$reader->setReadDataOnly( false );
			$spreadsheet    = $reader->load($file_name);
			$sheet_data     = $spreadsheet->getActiveSheet();
			$list           = [];
			$sheetCount = $spreadsheet->getSheetCount();
			// var_dump($sheetCount);
			$sheetNames = $spreadsheet->getSheetNames();
			foreach ($sheetNames as $sheetIndex => $sheetName) {
				var_dump('WorkSheet #' . $sheetIndex . ' is named "' . $sheetName . '"');
			}

			// $worksheet = $spreadsheet->getActiveSheet()->toArray(null, false, true, true);
			$worksheet = $spreadsheet->getSheetByName($TITLE);
			
			$rows = [];
foreach ($worksheet->getRowIterator() AS $row) {
    $cellIterator = $row->getCellIterator();
    $cellIterator->setIterateOnlyExistingCells(FALSE); // This loops through all cells,
    $cells = [];
    foreach ($cellIterator as $cell) {
        // $cells[] = $cell->getValue();
		$cells[] = ($cell->isFormula())?$cell->getOldCalculatedValue():$cell->getValue();
    }
    $rows[] = $cells;
}
			// var_dump($rows);
			// die("here1");
			$rowsCount = count($rows);
			if ($rowsCount > 1) {
				for ($row = 9; $row <= $rowsCount; $row++) {
					$name = "no value";
					$regional_target_volume = array(
						// 'area'    => ($worksheet->getCell($worksheet[$row]['B'])->isFormula())?$worksheet->getCell($worksheet[$row]['B'])->getOldCalculatedValue():$worksheet->getCell($worksheet[$row]['B'])->getValue(),
						'area'     => isset($rows[$row][1]) ? $rows[$row][1]: null,
						'GBNLURN'     => isset($rows[$row][2]) ? $rows[$row][2]: null,
						
						'Name'          => isset($rows[$row][4]) ? $rows[$row][4]: null,
						'Band'       => isset($rows[$row][5]) ? $rows[$row][5]: null,
						'Total_Base_Target'       => isset($rows[$row][6]) ? $rows[$row][6]: null,
						'Benson_and_Hedges_Cool_Fusion'       => isset($rows[$row][7]) ? $rows[$row][7]: null,
						'BH_Tropical_Boost'       => isset($rows[$row][8]) ? $rows[$row][8]: null,
						// 'BH_Switch'       => isset($rows[$row][9]) ? $rows[$row][9]: null,
						'Benson_Hedges_Boost'       => isset($rows[$row][10]) ? $rows[$row][10]: null,
						'Benson_Hedges_Demi-Slims'       => isset($rows[$row][11]) ? $rows[$row][11]: null,
						// 'PallMallExcelBlend'       => isset($rows[$row][12]) ? $rows[$row][12]: null,
						'Benson_and_Hedges_Flavour'       => isset($rows[$row][13]) ? $rows[$row][13]: null,
						'Dunhill_Switch'       => isset($rows[$row][14]) ? $rows[$row][14]: null,
						'st_Moritz_by_dunhill'       => isset($rows[$row][15]) ? $rows[$row][15]: null,
						'Rothmans_Menthol'       => isset($rows[$row][16]) ? $rows[$row][16]: null,
						'Rothmans_Menthol_Mix'       => isset($rows[$row][17]) ? $rows[$row][17]: null,
						'Pall_Mall_Rubi'       => isset($rows[$row][18]) ? $rows[$row][18]: null,
						'Pall_Mall_Boost'       => isset($rows[$row][19]) ? $rows[$row][19]: null,
						'Pall_Mall_Filter'       => isset($rows[$row][20]) ? $rows[$row][20]: null,
						'Pall_Mall_Menthol'       => isset($rows[$row][21]) ? $rows[$row][21]: null,
						'Rothmans_Flavour'       => isset($rows[$row][22]) ? $rows[$row][22]: null,
						'Royal_Std_Filter'       => isset($rows[$row][23]) ? $rows[$row][23]: null,
						'BH_Demi_Rubi'       => isset($rows[$row][24]) ? $rows[$row][24]: null,
						'Rothmans_Switch_Indigo'       => isset($rows[$row][25]) ? $rows[$row][25]: null,
						'Dunhill_Lights'       => isset($rows[$row][26]) ? $rows[$row][26]: null,
						'Total_Target_Value'       => isset($rows[$row][28]) ? $rows[$row][28]: null,
						'date_updated'            => $this->datetime,

						
						
						// 'Rothmans_Switch'     => $worksheet->getCell( $worksheet[$row]['F'])->getOldCalculatedValue(),
						

					);
					// var_dump($regional_target_volume);
					if (file_exists($file_name))
				unlink($file_name);
			if (count($regional_target_volume) > 0) {
				
				$this->load->model('User_model');

				$result =$this->User_model->add2($regional_target_volume);
				// $result     = $this->user->add_batch2($regional_target_volume);
				if ($result) {
					$json = [
						// 'success_message'    => showSuccessMessage("All Entries are imported successfully."),
					];
					// echo '<script>alert("You Have Successfully updated this Record!");</script>';
					echo "yes";
				} else {
					$json = [
						// 'error_message'  => showErrorMessage("Something went wrong. Please try again.")
					];
				}
			}
				}
				
				die("here");
			}
			die("here");
			// echo '<pre>';
			// print_r($worksheet);
			// die("here");
			$worksheetCount = count($worksheet);
			if ($worksheetCount > 1) {
				for ($row = 9; $row <= $worksheetCount; $row++) {
					$name = $worksheet[$row]['C'];
					$additional_data = array(
						// 'area'    => ($worksheet->getCell($worksheet[$row]['B'])->isFormula())?$worksheet->getCell($worksheet[$row]['B'])->getOldCalculatedValue():$worksheet->getCell($worksheet[$row]['B'])->getValue(),
						'GBNLURN'     => $worksheet[$row]['C'],

						'BATURN'   => $worksheet[$row]['D'],
						'Name'          => $worksheet[$row]['D'],
						'Band'       => $worksheet[$row]['G'],
						// 'Rothmans_Switch'     => $worksheet->getCell( $worksheet[$row]['F'])->getOldCalculatedValue(),
						'cust_name'     => $worksheet[$row]['C'],
						'cust_code'     => $worksheet[$row]['C']

					);
					print_r($additional_data);
				}
				die("here");
			}
// 
			$highestRow = $worksheet->getHighestRow(); // e.g. 10
			$highestColumn = $worksheet->getHighestColumn(); // e.g 'F'
			// 	$rowData = $worksheet->rangeToArray('A2:' . $highestColumn . $highestRow,
			//  NULL, TRUE, FALSE);


			// // Increment the highest column letter
			// $highestColumn++;
			// echo '<table>' . "\n";
			// for ($row = 1; $row <= $highestRow; ++$row) {
			// 	echo '<tr>' . PHP_EOL;
			// 	for ($col = 'A'; $col != $highestColumn; ++$col) {
			// 		echo '<td>' .
			// 			$worksheet->getCell($col . $row)
			// 			->getCalculatedValue()  .

			// 			'</td>' . PHP_EOL;
			// 	}
			// 	echo '</tr>' . PHP_EOL;
			// }
			// echo '</table>' . PHP_EOL;
			// Get the highest row and column numbers referenced in the worksheet
$highestRow = $worksheet->getHighestRow(); // e.g. 10
$highestColumn = $worksheet->getHighestColumn(); // e.g 'F'
$highestColumnIndex = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::columnIndexFromString($highestColumn); // e.g. 5
$rowsData = [];
echo '<table>' . "\n";
for ($row = 8; $row <= $highestRow; ++$row) {
    echo '<tr>' . PHP_EOL;
    for ($col = 2; $col <= $highestColumnIndex; ++$col) {
		if ($worksheet->getCellByColumnAndRow($col, $row)->isFormula()) {
			$value = $worksheet->getCellByColumnAndRow($col, $row)->getOldCalculatedValue();
		} else {
			$value = $worksheet->getCellByColumnAndRow($col, $row)->getValue();
		}
        // $value = $worksheet->getCellByColumnAndRow($col, $row)->getFormattedValue();
        // echo '<td>' . $value . '</td>' . PHP_EOL;
		$rowsData=$value;
		var_dump($rowsData );
		
    }
    // echo '</tr>' . PHP_EOL;
	
	
}

			die("val");
			foreach ($sheet_data as $key => $val) {
				if ($key != 0) {
					$result     = $this->user->get(["country_code" => $val[2], "mobile" => $val[3]]);
					if ($result) {
					} else {
						$list[] = [
							'name'                  => $val[0],
							'country_code'          => $val[1],
							'mobile'                => $val[2],
							'email'                 => $val[3],
							'city'                  => $val[4],
							'ip_address'            => $this->ip_address,
							'created_at'            => $this->datetime,
							'status'                => "1",
						];
					}
				}
			}
			if (file_exists($file_name))
				unlink($file_name);
			if (count($list) > 0) {
				$result     = $this->user->add_batch($list);
				if ($result) {
					$json = [
						// 'success_message'    => showSuccessMessage("All Entries are imported successfully."),
					];
				} else {
					$json = [
						// 'error_message'  => showErrorMessage("Something went wrong. Please try again.")
					];
				}
			} else {
				$json = [
					// 'error_message' => showErrorMessage("No new record is found."),
				];
			}
	
		echo json_encode($json);
	}
	}

	//  USING PHP EXCEL
	public function import1()
	{
		$TITLE = "MIDDLE BELT";
		$path       = 'uploads/imports/';
		$json       = [];
		// $this->upload_config($path);
		$config['upload_path']      = './' . $path;
		$config['allowed_types']    = 'csv|CSV|xlsx|XLSX|xls|XLS';
		$config['max_filename']     = '255';
		$config['encrypt_name']     = FALSE;
		$config['max_size']         = 4096;
		$config['file_ext_tolower'] = TRUE;
		$this->load->library('upload', $config);
		if (!$this->upload->do_upload('profile_pic')) {
			$error = array('error' => $this->upload->display_errors());
			echo "test";
			$json = [
				// 'error_message' => showErrorMessage($this->upload->display_errors()),
			];
		} else {
			$file_data  = $this->upload->data();

			$file_name  = $path . $file_data['file_name'];
			$arr_file   = explode('.', $file_name);
			$extension  = end($arr_file);
			if ('csv' == $extension) {
				$reader     = new \PhpOffice\PhpSpreadsheet\Reader\Csv();
			} else {
				$reader     = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
			}
			$spreadsheet    = $reader->load($file_name);
			$sheet_data     = $spreadsheet->getActiveSheet();
			$list           = [];
			$sheetCount = $spreadsheet->getSheetCount();
			// var_dump($sheetCount);
			$sheetNames = $spreadsheet->getSheetNames();
			foreach ($sheetNames as $sheetIndex => $sheetName) {
				var_dump('WorkSheet #' . $sheetIndex . ' is named "' . $sheetName . '"');
			}
			$this->load->library('Excel');
			try {
				// $objPHPExcel = PHPExcel_IOFactory::load($file_name);
				$inputFileType = PHPExcel_IOFactory::identify($file_name);
				$objReader = PHPExcel_IOFactory::createReader($inputFileType);
				$objPHPExcel = $objReader->load($file_name);

				$objWorksheet = $objPHPExcel->getSheetByName($TITLE);
			} catch (Exception $e) {
				die($e->getMessage());
			}
			$highestRow = $objWorksheet->getHighestDataRow();
			$highestColumn = $objWorksheet->getHighestDataColumn();
			$rowData = $objWorksheet->rangeToArray(
				'A2:' . $highestColumn . $highestRow,
				NULL,
				TRUE,
				FALSE
			);
			for ($row = 9; $row <= $highestRow; $row++) {



				$additional_data = array(
					'area'    => $rowData[$row - 9][1],
					'GBNLURN'     => $rowData[$row - 9][2],

					'BATURN'   => $rowData[$row - 9][3],
					'Name'          => $rowData[$row - 9][4],
					'Band'       => $rowData[$row - 9][5],
					'Rothmans_Switch'     => $rowData[$row - 9][6],
					'cust_name'     => $rowData[$row - 9][7],
					'cust_code'     => $rowData[$row - 9][8]

				);
			}
			var_dump($additional_data);
			die("here");
			foreach ($sheet_data as $key => $val) {
				if ($key != 0) {
					$result     = $this->user->get(["country_code" => $val[2], "mobile" => $val[3]]);
					if ($result) {
					} else {
						$list[] = [
							'name'                  => $val[0],
							'country_code'          => $val[1],
							'mobile'                => $val[2],
							'email'                 => $val[3],
							'city'                  => $val[4],
							'ip_address'            => $this->ip_address,
							'created_at'            => $this->datetime,
							'status'                => "1",
						];
					}
				}
			}
			if (file_exists($file_name))
				unlink($file_name);
			if (count($list) > 0) {
				$result     = $this->user->add_batch($list);
				if ($result) {
					$json = [
						// 'success_message'    => showSuccessMessage("All Entries are imported successfully."),
					];
				} else {
					$json = [
						// 'error_message'  => showErrorMessage("Something went wrong. Please try again.")
					];
				}
			} else {
				$json = [
					// 'error_message' => showErrorMessage("No new record is found."),
				];
			}
		}
		echo json_encode($json);
	}
	public function upload_config($path)
	{
		if (!is_dir($path))
			mkdir($path, 0777, TRUE);
		$config['upload_path']      = './' . $path;
		$config['allowed_types']    = 'csv|CSV|xlsx|XLSX|xls|XLS';
		$config['max_filename']     = '255';
		$config['encrypt_name']     = TRUE;
		$config['max_size']         = 4096;
		$this->load->library('upload', $config);
	}
}
