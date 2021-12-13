<?php
defined('BASEPATH') or exit('No direct script access allowed');
date_default_timezone_set('Africa/Lagos');
require 'vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\WriterXlsx;
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
		$this->requestid ="ABCD123";
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
			$post_file = array(
				'request_id' => $this->requestid, 
				'file_type' => $extension, 
				'filename' => $file_data['file_name'],
				'attachment_file' => $file_name,
				'dateadded' => date('Y-m-d H:i:s')
			);      
			$this->db->insert('attachmentDetail', $post_file);
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
						// 'Pall_Mall_ExcelBlend'       => isset($rows[$row][12]) ? $rows[$row][12]: null,
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
						'request_id'            => $this->requestid,
						
						
						// 'Rothmans_Switch'     => $worksheet->getCell( $worksheet[$row]['F'])->getOldCalculatedValue(),
						

					);
					// second table
					$regional_credit_volume = array(
						// 'area'    => ($worksheet->getCell($worksheet[$row]['B'])->isFormula())?$worksheet->getCell($worksheet[$row]['B'])->getOldCalculatedValue():$worksheet->getCell($worksheet[$row]['B'])->getValue(),
						'area'     => isset($rows[$row][1]) ? $rows[$row][1]: null,
						'GBNLURN'     => isset($rows[$row][2]) ? $rows[$row][2]: null,
						
						'Name'          => isset($rows[$row][4]) ? $rows[$row][4]: null,
						'Band'       => isset($rows[$row][5]) ? $rows[$row][5]: null,
						'Total_Base_Target'       => isset($rows[$row][6]) ? $rows[$row][6]: null,
						'Total_Credit_Volume'       => isset($rows[$row][30]) ? $rows[$row][30]: null,
						'Dunhill_Lights'       => isset($rows[$row][31]) ? $rows[$row][31]: null,
						// 'BH_Switch'       => isset($rows[$row][9]) ? $rows[$row][9]: null,
						'st_Moritz_by_dunhill'       => isset($rows[$row][32]) ? $rows[$row][32]: null,
						'Benson_and_Hedges_Flavour'       => isset($rows[$row][33]) ? $rows[$row][33]: null,
						'B_and_H_Switch'       => isset($rows[$row][34]) ? $rows[$row][34]: null,
						'Benson_Hedges_Demi-Slims'       => isset($rows[$row][35]) ? $rows[$row][35]: null,
						'Benson_Hedges_Boost'       => isset($rows[$row][36]) ? $rows[$row][36]: null,
						'Rothmans_Flavour'       => isset($rows[$row][37]) ? $rows[$row][37]: null,
						'Rothmans_Switch'       => isset($rows[$row][38]) ? $rows[$row][38]: null,
						'BH_Demi_Rubi'       => isset($rows[$row][39]) ? $rows[$row][39]: null,
						'Rothmans_Menthol'       => isset($rows[$row][40]) ? $rows[$row][40]: null,
						'Pall_Mall_Filter'       => isset($rows[$row][41]) ? $rows[$row][41]: null,
						'Benson_and_Hedges_Cool_Fusion'       => isset($rows[$row][42]) ? $rows[$row][42]: null,
						'BH_Tropical_Boost'       => isset($rows[$row][43]) ? $rows[$row][43]: null,
						'Rothmans_Menthol_Mix'       => isset($rows[$row][44]) ? $rows[$row][44]: null,
						'Pall_Mall_Menthol'       => isset($rows[$row][45]) ? $rows[$row][45]: null,
						'Total_Target_Value'       => isset($rows[$row][46]) ? $rows[$row][46]: null,
						'Maximum_Credit_Allocation'       => isset($rows[$row][47]) ? $rows[$row][47]: null,
						'Comments'       => isset($rows[$row][48]) ? $rows[$row][48]: null,
						'Customer_Credit_Rating'       => isset($rows[$row][49]) ? $rows[$row][49]: null,
						'date_updated'            => $this->datetime,
						'request_id'            => $this->requestid,

						
						
						// 'Rothmans_Switch'     => $worksheet->getCell( $worksheet[$row]['F'])->getOldCalculatedValue(),
						

					);
					// var_dump($regional_credit_volume);
					if (file_exists($file_name))
				unlink($file_name);
			if (count($regional_target_volume) > 0 && count($regional_credit_volume) > 0) {
				
				$this->load->model('User_model');

				$result =$this->User_model->add2($regional_target_volume);
				$result2 =$this->User_model->add($regional_credit_volume);
				// $result     = $this->user->add_batch2($regional_target_volume);
				if ($result && $result2) {
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
	// export file
	public function Export($request_id="")  {
		$this->load->model('User_model');
		$request=($request_id === '')?$this->requestid:$request_id;
		// $request_id =$this->request_id;
		$subscribers = $this->User_model->get_records($request);
		$sql="SELECT filename from attachmentDetail WHERE request_id = '$request'";       
        $filenamedatail = $this->User_model->run_qry($sql);
		$array = json_decode(json_encode($filenamedatail), true);
		$filename=$array["filename"];
		var_dump($array["filename"]);
		// die("hh");
		require_once APPPATH . '/third_party/Phpexcel/Bootstrap.php';

		// Create new Spreadsheet object
		$spreadsheet =  new \PhpOffice\PhpSpreadsheet\Spreadsheet();
		
// Set document properties
		$spreadsheet->getProperties()->setCreator('Nubiaville.com');
				$spreadsheet->getProperties()->setLastModifiedBy('Samuel Obe');
				$spreadsheet->getProperties()->setTitle('Phpecxel codeigniter tutorial');
				$spreadsheet->getProperties()->setSubject('integrate codeigniter with PhpExcel');
				$spreadsheet ->getProperties()->setDescription('');

		// add style to the header
		$styleArray = array(
				'font' => array(
						'bold' => true,
				),
				'alignment' => array(
						'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
						'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
				),
				'borders' => array(
						'top' => array(
								'style' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
						),
				),
				'fill' => array(
						'type' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_GRADIENT_LINEAR,
						'rotation' => 90,
						'startcolor' => array(
								'argb' => 'FFA0A0A0',
						),
						'endcolor' => array(
								'argb' => 'FFFFFFFF',
						),
				),
		);
		// $spreadsheet->getActiveSheet()->getStyle('A1:AC')->applyFromArray($styleArray);

		$sheet = $spreadsheet->getActiveSheet();
		// auto fit column to content

		// foreach(array_merge(range('A','Z'), ['AA', 'AC']) as $columnID) {
			foreach (range('A', $sheet->getHighestColumn()) as $col) {
			// $spreadsheet->getActiveSheet()->getColumnDimension($columnID);
			$sheet->getColumnDimension($col)->setAutoSize(true);

			// var_dump($spreadsheet);
		// die("het");
					// $spreadsheet ->setAutoSize(true);
		}
		// set the names of header cells
		$spreadsheet->setActiveSheetIndex(0);
		$spreadsheet->setActiveSheetIndex(0)->setCellValue("A1",'AREA');
		$spreadsheet->setActiveSheetIndex(0)->setCellValue("B1",'GBNL URN');
		$spreadsheet->setActiveSheetIndex(0)->setCellValue("C1",'Name');
		$spreadsheet	->setActiveSheetIndex(0)->setCellValue("D1",'Band');
		$spreadsheet->setActiveSheetIndex(0)->setCellValue("E1",'Total Base Target');
		$spreadsheet->setActiveSheetIndex(0)->setCellValue("F1",'Benson and Hedges Cool Fusion');
		$spreadsheet->setActiveSheetIndex(0)->setCellValue("G1",'B&H Tropical Boost');
		$spreadsheet->setActiveSheetIndex(0)->setCellValue("H1",'B & H Switch');
				
		$spreadsheet->setActiveSheetIndex(0)->setCellValue("I1",'Rothmans Switch');
		$spreadsheet->setActiveSheetIndex(0)->setCellValue("J1",'Benson & Hedges Boost');
		$spreadsheet->setActiveSheetIndex(0)->setCellValue("K1",'Benson & Hedges Demi-Slims');
		$spreadsheet->setActiveSheetIndex(0)->setCellValue("L1",'Pall Mall - Excel Blend');
		$spreadsheet->setActiveSheetIndex(0)->setCellValue("M1",'Benson & Hedges Flavour');
		$spreadsheet->setActiveSheetIndex(0)->setCellValue("N1",'Dunhill Switch');
		$spreadsheet	->setActiveSheetIndex(0)->setCellValue("O1",'ST Moritz By Dunhill');
		$spreadsheet->setActiveSheetIndex(0)->setCellValue("P1",'Rothmans Menthol');
		$spreadsheet->setActiveSheetIndex(0)->setCellValue("Q1",'Rothmans Menthol Mix');
		$spreadsheet->setActiveSheetIndex(0)->setCellValue("R1",'Pall Mall Rubi');
		$spreadsheet->setActiveSheetIndex(0)->setCellValue("S1",'Pall Mall Boost');
		$spreadsheet	->setActiveSheetIndex(0)->setCellValue("T1",'Pall Mall Filter');
		$spreadsheet	->setActiveSheetIndex(0)->setCellValue("U1",'Pall Mall Menthol');
		$spreadsheet	->setActiveSheetIndex(0)->setCellValue("V1",'Rothmans Flavour');
		$spreadsheet	->setActiveSheetIndex(0)->setCellValue("W1",'Royal  Std Filter');
		$spreadsheet->setActiveSheetIndex(0)->setCellValue("X1",'B&H Demi Rubi');
		$spreadsheet->setActiveSheetIndex(0)->setCellValue("Y1",'Rothmans Switch Indigo');
		$spreadsheet->setActiveSheetIndex(0)->setCellValue("Z1",'Dunhill Lights');
		$spreadsheet->setActiveSheetIndex(0)->setCellValue("AA1",'Total Target Value (₦)');
				
				
				

		// Add some data
		$x= 2;
		foreach($subscribers as $sub){
			$spreadsheet->setActiveSheetIndex(0);
			$spreadsheet->setActiveSheetIndex(0)->setCellValue("A$x",$sub['area']);
			$spreadsheet->setActiveSheetIndex(0)->setCellValue("B$x",$sub['GBNLURN']);
			$spreadsheet->setActiveSheetIndex(0)->setCellValue("C$x",$sub['Name']);
			$spreadsheet	->setActiveSheetIndex(0)->setCellValue("D$x",$sub['Band']);
			$spreadsheet	->setActiveSheetIndex(0)->setCellValue("E$x",$sub['Total_Base_Target']);
			$spreadsheet	->setActiveSheetIndex(0)->setCellValue("F$x",$sub['Benson_and_Hedges_Cool_Fusion']);
			$spreadsheet	->setActiveSheetIndex(0)->setCellValue("G$x",$sub['BH_Tropical_Boost']);
					$spreadsheet	->setActiveSheetIndex(0)->setCellValue("H$x",$sub['BH_Switch']);
					$spreadsheet	->setActiveSheetIndex(0)->setCellValue("I$x",$sub['Rothmans_Switch']);
					$spreadsheet	->setActiveSheetIndex(0)->setCellValue("J$x",$sub['Benson_Hedges_Boost']);
					$spreadsheet	->setActiveSheetIndex(0)->setCellValue("K$x",$sub['Benson_Hedges_Demi-Slims']);
					$spreadsheet->setActiveSheetIndex(0)->setCellValue("L$x",$sub['Pall_Mall_ExcelBlend']);
					$spreadsheet->setActiveSheetIndex(0)->setCellValue("M$x",$sub['Benson_and_Hedges_Flavour']);
					$spreadsheet->setActiveSheetIndex(0)->setCellValue("N$x",$sub['Dunhill_Switch']);
					$spreadsheet->setActiveSheetIndex(0)->setCellValue("O$x",$sub['st_Moritz_by_dunhill']);
					$spreadsheet	->setActiveSheetIndex(0)->setCellValue("P$x",$sub['Rothmans_Menthol']);
					$spreadsheet->setActiveSheetIndex(0)->setCellValue("QR$x",$sub['Rothmans_Menthol_Mix']);
					$spreadsheet->setActiveSheetIndex(0)->setCellValue("R$x",$sub['Pall_Mall_Rubi']);
					$spreadsheet	->setActiveSheetIndex(0)->setCellValue("S$x",$sub['Pall_Mall_Boost']);
					$spreadsheet	->setActiveSheetIndex(0)->setCellValue("T$x",$sub['Pall_Mall_Filter']);
					$spreadsheet	->setActiveSheetIndex(0)->setCellValue("U$x",$sub['Pall_Mall_Menthol']);
					$spreadsheet	->setActiveSheetIndex(0)->setCellValue("V$x",$sub['Rothmans_Flavour']);
					$spreadsheet	->setActiveSheetIndex(0)->setCellValue("W$x",$sub['Royal_Std_Filter']);
					$spreadsheet		->setActiveSheetIndex(0)->setCellValue("X$x",$sub['BH_Demi_Rubi']);
					$spreadsheet		->setActiveSheetIndex(0)->setCellValue("Y$x",$sub['Rothmans_Switch_Indigo']);
					$spreadsheet	->setActiveSheetIndex(0)->setCellValue("Z$x",$sub['Dunhill_Lights']);
					$spreadsheet	->setActiveSheetIndex(0)->setCellValue("AA$x",$sub['Total_Target_Value']);
					
			
			$x++;
		}



// Rename worksheet
		$spreadsheet->getActiveSheet()->setTitle('Users Information');

// set right to left direction
//		$spreadsheet->getActiveSheet()->setRightToLeft(true);

// Set active sheet index to the first sheet, so Excel opens this as the first sheet
		$spreadsheet->setActiveSheetIndex(0);

// Redirect output to a client’s web browser (Excel2007)
		header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
		// header('Content-Disposition: attachment;filename=$filename');
		header("Content-Disposition: attachment; filename=$filename");
		header('Cache-Control: max-age=0');
// If you're serving to IE 9, then the following may be needed
		header('Cache-Control: max-age=1');

// If you're serving to IE over SSL, then the following may be needed
		header('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
		header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT'); // always modified
		header('Cache-Control: cache, must-revalidate'); // HTTP/1.1
		header('Pragma: public'); // HTTP/1.0

		$writer = \PhpOffice\PhpSpreadsheet\IOFactory::createWriter($spreadsheet, 'Excel2007');
		var_dump($writer );
		$writer->save('php://output');
		exit;

		//  create new file and remove Compatibility mode from word title


	}

}
