  /*
MySQL Data Transfer
Source Host: localhost
Source Database: credit_request
Target Host: localhost
Target Database: credit_request
Date: 11/15/2021 9:43:13 AM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for attachments
-- ----------------------------
DROP TABLE IF EXISTS `attachments`;
CREATE TABLE `attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_id` varchar(20) NOT NULL,
  `file_type` varchar(20) NOT NULL,
  `filename` varchar(200) NOT NULL,
  `attachment_file` varchar(250) NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wkfl_attachments` (`request_id`),
  CONSTRAINT `wkfl_attachments` FOREIGN KEY (`request_id`) REFERENCES `workflow_requests` (`request_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for brand_prices
-- ----------------------------
DROP TABLE IF EXISTS `brand_prices`;
CREATE TABLE `brand_prices` (
  `skuid` int(11) NOT NULL AUTO_INCREMENT,
  `skuname` varchar(100) DEFAULT NULL,
  `caseprice` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`skuid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for card_details
-- ----------------------------
DROP TABLE IF EXISTS `card_details`;
CREATE TABLE `card_details` (
  `card_id` int(11) NOT NULL AUTO_INCREMENT,
  `request_id` varchar(20) NOT NULL,
  `acct_no` varchar(10) NOT NULL,
  `acct_desc` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `trans_amt` float(11,2) NOT NULL,
  `trans_sku` varchar(10) DEFAULT NULL,
  `attachedfile` text NOT NULL,
  `date_added` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`card_id`),
  KEY `wkfl_card_det` (`request_id`),
  CONSTRAINT `wkfl_card_det` FOREIGN KEY (`request_id`) REFERENCES `workflow_requests` (`request_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for card_request
-- ----------------------------
DROP TABLE IF EXISTS `card_request`;
CREATE TABLE `card_request` (
  `request_id` varchar(20) NOT NULL,
  `request_date` datetime NOT NULL,
  `iniitiated_by` int(11) NOT NULL,
  `dept` varchar(50) NOT NULL,
  `details` text NOT NULL,
  `doctype` varchar(100) NOT NULL,
  `currency` varchar(5) NOT NULL,
  `card_type` varchar(50) NOT NULL,
  `post_date` date NOT NULL,
  `post_month` date NOT NULL,
  `total_expense` float(10,2) NOT NULL,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`request_id`),
  CONSTRAINT `wkfl_card_req` FOREIGN KEY (`request_id`) REFERENCES `workflow_requests` (`request_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for credit_add_request
-- ----------------------------
DROP TABLE IF EXISTS `credit_add_request`;
CREATE TABLE `credit_add_request` (
  `request_id` varchar(20) NOT NULL,
  `request_date` datetime NOT NULL,
  `initiated_by` int(11) NOT NULL,
  `credit_type` varchar(20) NOT NULL,
  `cust_type` varchar(20) NOT NULL,
  `region` varchar(20) DEFAULT NULL,
  `details` text NOT NULL,
  `credit_period` varchar(10) NOT NULL,
  `credit_month` date DEFAULT NULL,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`request_id`),
  CONSTRAINT `wkfl_credit_add_req` FOREIGN KEY (`request_id`) REFERENCES `workflow_requests` (`request_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for credit_report
-- ----------------------------
DROP TABLE IF EXISTS `credit_report`;
CREATE TABLE `credit_report` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `requestid` varchar(20) NOT NULL,
  `cust_type` varchar(20) DEFAULT NULL,
  `region` varchar(20) DEFAULT NULL,
  `target_value` double(20,2) DEFAULT NULL,
  `credit_value` double(20,2) DEFAULT NULL,
  `credit_allocation` double(20,2) DEFAULT NULL,
  `credit_tgt` float(5,2) DEFAULT NULL,
  `deploy_pcent` float(5,2) DEFAULT NULL,
  PRIMARY KEY (`sno`),
  KEY `creditrpt` (`requestid`),
  CONSTRAINT `creditrpt1` FOREIGN KEY (`requestid`) REFERENCES `credit_request` (`request_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for credit_request
-- ----------------------------
DROP TABLE IF EXISTS `credit_request`;
CREATE TABLE `credit_request` (
  `request_id` varchar(20) NOT NULL,
  `request_date` datetime NOT NULL,
  `initiated_by` int(11) NOT NULL,
  `credit_type` varchar(20) NOT NULL,
  `cust_type` varchar(20) NOT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `gbnlfile` varchar(200) DEFAULT NULL,
  `consolidated` varchar(200) DEFAULT NULL,
  `details` text NOT NULL,
  `dept` varchar(20) DEFAULT NULL,
  `credit_period` varchar(10) NOT NULL,
  `request_status` varchar(20) DEFAULT NULL,
  `credit_month` date DEFAULT NULL,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`request_id`),
  CONSTRAINT `wkfl_credit_req` FOREIGN KEY (`request_id`) REFERENCES `workflow_requests` (`request_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for customer_credit
-- ----------------------------
DROP TABLE IF EXISTS `customer_credit`;
CREATE TABLE `customer_credit` (
  `credid` int(11) NOT NULL AUTO_INCREMENT,
  `cusurn` varchar(10) DEFAULT NULL,
  `cusname` varchar(100) DEFAULT NULL,
  `currcredit` double(14,2) DEFAULT NULL,
  `sumcredit` double(14,2) DEFAULT NULL,
  `overdue` int(11) DEFAULT NULL,
  PRIMARY KEY (`credid`)
) ENGINE=InnoDB AUTO_INCREMENT=420 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `deptcode` varchar(12) NOT NULL,
  `deptname` varchar(50) NOT NULL,
  `hod` varchar(50) NOT NULL,
  PRIMARY KEY (`deptname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for location
-- ----------------------------
DROP TABLE IF EXISTS `location`;
CREATE TABLE `location` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(20) DEFAULT NULL,
  `region` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for login_attempts
-- ----------------------------
DROP TABLE IF EXISTS `login_attempts`;
CREATE TABLE `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for receipts
-- ----------------------------
DROP TABLE IF EXISTS `receipts`;
CREATE TABLE `receipts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_id` varchar(20) NOT NULL,
  `refid` int(11) NOT NULL,
  `filename` varchar(200) NOT NULL,
  `receipt_file` varchar(200) NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wkfl_receipts` (`request_id`),
  CONSTRAINT `wkfl_receipts` FOREIGN KEY (`request_id`) REFERENCES `workflow_requests` (`request_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for region_credit_request
-- ----------------------------
DROP TABLE IF EXISTS `region_credit_request`;
CREATE TABLE `region_credit_request` (
  `request_id` varchar(20) NOT NULL,
  `ref_id` varchar(20) NOT NULL,
  `request_date` datetime NOT NULL,
  `initiated_by` int(11) NOT NULL,
  `cust_type` varchar(20) NOT NULL,
  `credit_month` date DEFAULT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `region` varchar(20) DEFAULT NULL,
  `details` text NOT NULL,
  `credit_period` varchar(10) NOT NULL,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`request_id`),
  KEY `wkfl_credit_region_ref` (`ref_id`),
  CONSTRAINT `wkfl_credit_region` FOREIGN KEY (`request_id`) REFERENCES `workflow_requests` (`request_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wkfl_credit_region_2` FOREIGN KEY (`ref_id`) REFERENCES `credit_request` (`request_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for request_approvers
-- ----------------------------
DROP TABLE IF EXISTS `request_approvers`;
CREATE TABLE `request_approvers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `approver_id` int(11) NOT NULL,
  `request_id` varchar(20) NOT NULL,
  `process_id` int(11) NOT NULL,
  `order_no` int(11) NOT NULL,
  `appr_name` int(11) NOT NULL,
  `appr_function` varchar(200) NOT NULL,
  `notifier` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_key` (`approver_id`,`request_id`),
  KEY `request_id` (`request_id`),
  CONSTRAINT `wkfl_appr` FOREIGN KEY (`request_id`) REFERENCES `workflow_requests` (`request_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for setup_credit
-- ----------------------------
DROP TABLE IF EXISTS `setup_credit`;
CREATE TABLE `setup_credit` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `region` varchar(20) DEFAULT NULL,
  `contribution` float(10,2) DEFAULT NULL,
  `creditvol` float(10,2) DEFAULT NULL,
  `creditalloc` double(14,2) DEFAULT NULL,
  `outcredit` double(14,2) DEFAULT NULL,
  `balcreditalloc` double(14,2) DEFAULT NULL,
  `custype` varchar(20) DEFAULT NULL,
  `periodval` date DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for setup_parameters
-- ----------------------------
DROP TABLE IF EXISTS `setup_parameters`;
CREATE TABLE `setup_parameters` (
  `setup_id` int(11) NOT NULL AUTO_INCREMENT,
  `setup_name` varchar(100) DEFAULT NULL,
  `setup_value` text,
  PRIMARY KEY (`setup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `dept` varchar(20) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `hodemail` varchar(100) DEFAULT NULL,
  `manager` varchar(100) DEFAULT NULL,
  `mgr_email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `user_role` varchar(20) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_email` (`email`),
  UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  UNIQUE KEY `uc_remember_selector` (`remember_selector`),
  UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for users_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_groups`;
CREATE TABLE `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  KEY `fk_users_groups_users1_idx` (`user_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`),
  CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for workflow
-- ----------------------------
DROP TABLE IF EXISTS `workflow`;
CREATE TABLE `workflow` (
  `process_id` int(11) NOT NULL AUTO_INCREMENT,
  `request_type` varchar(50) NOT NULL,
  `request_title` varchar(100) NOT NULL,
  `request_method` varchar(50) NOT NULL,
  `request_form` varchar(50) NOT NULL,
  `request_table` varchar(50) DEFAULT NULL,
  `wait_time` varchar(3) NOT NULL,
  `expiration_action` varchar(100) NOT NULL,
  `notice_subject` varchar(200) NOT NULL DEFAULT '',
  `notice_msg` text NOT NULL,
  `flow_type` varchar(20) NOT NULL,
  `date_added` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`process_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for workflow_approvers
-- ----------------------------
DROP TABLE IF EXISTS `workflow_approvers`;
CREATE TABLE `workflow_approvers` (
  `approver_id` int(11) NOT NULL AUTO_INCREMENT,
  `process_id` int(11) NOT NULL,
  `order_no` int(11) NOT NULL,
  `approver_from` varchar(20) NOT NULL,
  `appr_name` int(11) NOT NULL,
  `appr_function` varchar(200) NOT NULL,
  `notice_class` varchar(20) NOT NULL,
  `notifier` varchar(50) NOT NULL,
  PRIMARY KEY (`approver_id`),
  KEY `wkflow_appr_fk` (`process_id`),
  CONSTRAINT `wkflow_appr_fk` FOREIGN KEY (`process_id`) REFERENCES `workflow` (`process_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for workflow_history
-- ----------------------------
DROP TABLE IF EXISTS `workflow_history`;
CREATE TABLE `workflow_history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `request_id` varchar(20) NOT NULL,
  `appr_id` int(11) NOT NULL,
  `appr_name` varchar(100) DEFAULT NULL,
  `appr_function` varchar(100) DEFAULT NULL,
  `appr_action` varchar(100) DEFAULT NULL,
  `appr_status` varchar(200) DEFAULT NULL,
  `appr_comment` varchar(200) DEFAULT NULL,
  `appr_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `next_appr_id` int(11) DEFAULT NULL,
  `next_approver` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `request_id` (`request_id`),
  CONSTRAINT `wkfl_histry` FOREIGN KEY (`request_id`) REFERENCES `workflow_requests` (`request_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for workflow_requests
-- ----------------------------
DROP TABLE IF EXISTS `workflow_requests`;
CREATE TABLE `workflow_requests` (
  `request_id` varchar(20) NOT NULL,
  `request_type` varchar(100) NOT NULL,
  `cust_type` varchar(20) NOT NULL,
  `request_period` varchar(20) NOT NULL,
  `request_month` date NOT NULL,
  `details` text NOT NULL,
  `process_id` int(11) NOT NULL,
  `request_date` datetime NOT NULL,
  `requester_id` int(11) NOT NULL,
  `request_status` varchar(20) NOT NULL,
  `order_no` int(11) NOT NULL,
  `next_appr` int(11) NOT NULL,
  `next_approver` varchar(50) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `total_amount` float(10,2) NOT NULL,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Procedure structure for GET_ACTIVE_REQUESTS
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_ACTIVE_REQUESTS`;
DELIMITER ;;
CREATE DEFINER=`automatordb`@`localhost` PROCEDURE `GET_ACTIVE_REQUESTS`(IN `USERCODE` INT)
BEGIN
                SELECT
                workflow_requests.request_id, workflow_requests.request_date,
                workflow_requests.request_type, workflow.request_title,
		workflow_requests.cust_type,
		workflow_requests.request_period,workflow_requests.request_month,workflow_requests.details,
                date_format(workflow_requests.request_date,"%b %D, %Y %h:%i %p") as requestdate,
                users.fullname, workflow_requests.request_status, workflow_requests.next_approver
                FROM workflow_requests
                left Join workflow ON workflow.process_id = workflow_requests.process_id
		left Join request_approvers ON request_approvers.request_id = workflow_requests.request_id
                left Join users ON users.id = workflow_requests.requester_id
                where (users.id = USERCODE or  request_approvers.appr_name=USERCODE)
		 and workflow_requests.request_status not in  ('Approved','Denied')
group by
workflow_requests.request_type,workflow_requests.request_id;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for GET_ALL_REQUESTS
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_ALL_REQUESTS`;
DELIMITER ;;
CREATE DEFINER=`automatordb`@`localhost` PROCEDURE `GET_ALL_REQUESTS`()
BEGIN
  SELECT
                workflow_requests.request_id, workflow_requests.request_date,
                workflow_requests.request_type, workflow.request_title,workflow_requests.cust_type,
		workflow_requests.request_period,workflow_requests.request_month,workflow_requests.details,
                workflow_requests.currency, format(workflow_requests.total_amount,2) as totalamount,
                date_format(workflow_requests.request_date,"%b %D, %Y %h:%i %p") as requestdate,
                users.fullname, workflow_requests.request_status, workflow_requests.next_approver
                FROM workflow_requests
                Inner Join workflow ON workflow.process_id = workflow_requests.process_id
                Inner Join users ON users.id = workflow_requests.requester_id
                order by requestdate desc;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for GET_ARCHIVED_REQUESTS
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_ARCHIVED_REQUESTS`;
DELIMITER ;;
CREATE DEFINER=`automatordb`@`localhost` PROCEDURE `GET_ARCHIVED_REQUESTS`(IN `USERCODE` INT)
BEGIN
                SELECT
                workflow_requests.request_id, workflow_requests.request_date,
                workflow_requests.request_type, workflow.request_title,workflow_requests.cust_type,
		workflow_requests.request_period,workflow_requests.request_month,workflow_requests.details,
                date_format(workflow_requests.request_date,"%b %D, %Y %h:%i %p") as requestdate,
                users.fullname, workflow_requests.request_status, workflow_requests.next_approver
                FROM workflow_requests
                left Join workflow ON workflow.process_id = workflow_requests.process_id
		left Join request_approvers ON request_approvers.request_id = workflow_requests.request_id
                left Join users ON users.id = workflow_requests.requester_id
                where (users.id = USERCODE or  request_approvers.appr_name=USERCODE)
		 and workflow_requests.request_status in  ('Approved','Denied');
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for GET_AWAITING_APPROVAL
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_AWAITING_APPROVAL`;
DELIMITER ;;
CREATE DEFINER=`automatordb`@`localhost` PROCEDURE `GET_AWAITING_APPROVAL`(IN `USERCODE` INT)
BEGIN
SELECT
workflow_requests.request_id, workflow_requests.request_date,
concat(users.fullname,'<br/>',date_format(workflow_requests.request_date,"%b %D, %Y %h:%i %p") ) as requester,
concat(workflow.request_title,'<br/>',workflow_requests.request_status,' - ', workflow_requests.next_approver) as requestdetails,
tmptbl.details,
if(workflow_requests.currency in ('bottles','items'),concat(format(workflow_requests.total_amount,0),' ',workflow_requests.currency),
concat(workflow_requests.currency,' ',format(workflow_requests.total_amount,2))) as amt,
workflow_requests.request_type
FROM workflow_requests
Inner Join workflow ON workflow.process_id = workflow_requests.process_id
Inner Join users ON users.id = workflow_requests.requester_id
left Join (
	SELECT request_id,
	credit_request.details as details
	from
	credit_request

) as tmptbl
on workflow_requests.request_id=tmptbl.request_id
where workflow_requests.next_appr=USERCODE;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for GET_TOTAL_AMT
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_TOTAL_AMT`;
DELIMITER ;;
CREATE DEFINER=`automatordb`@`localhost` PROCEDURE `GET_TOTAL_AMT`(IN `COL_NAME` VARCHAR(20), IN `TBL_NAME` VARCHAR(20), IN `REQUESTID` VARCHAR(20))
BEGIN
SET @SQL = NULL;

SET @SQL= CONCAT( 'SELECT Sum( ', COL_NAME,') AS total_amt FROM ',TBL_NAME,' where request_id="',REQUESTID,'"');

PREPARE stmt FROM @SQL;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for GET_WORKFLOW_APPROVERS
-- ----------------------------
DROP PROCEDURE IF EXISTS `GET_WORKFLOW_APPROVERS`;
DELIMITER ;;
CREATE DEFINER=`automatordb`@`localhost` PROCEDURE `GET_WORKFLOW_APPROVERS`(IN `ID` INT)
BEGIN
SELECT
                        workflow_approvers.approver_id,if(workflow_approvers.appr_name=0,
			if(workflow_approvers.approver_from='Initiator','Initiator',workflow_approvers.appr_function),users.fullname) as approver_name,
                        workflow_approvers.appr_name,
                        workflow_approvers.order_no,
                        workflow_approvers.notifier,
                        workflow_approvers.appr_function
                        FROM workflow_approvers
                        left Join users ON users.id = workflow_approvers.appr_name
                        where workflow_approvers.process_id=ID;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for LIST_WORKFLOW
-- ----------------------------
DROP PROCEDURE IF EXISTS `LIST_WORKFLOW`;
DELIMITER ;;
CREATE DEFINER=`automatordb`@`localhost` PROCEDURE `LIST_WORKFLOW`()
BEGIN
SELECT
workflow.request_type,
workflow.process_id,
workflow.request_title,
workflow.last_updated,
GROUP_CONCAT(if(workflow_approvers.appr_name=0,if(workflow_approvers.approver_from='Initiator','Initiator',workflow_approvers.appr_function),users.fullname) Order By workflow_approvers.order_no SEPARATOR ',  ' ) as approvers
FROM
workflow
left Join workflow_approvers ON workflow_approvers.process_id = workflow.process_id
left Join users ON workflow_approvers.appr_name = users.id
group by workflow.process_id;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for LOAD_APPROVERS
-- ----------------------------
DROP PROCEDURE IF EXISTS `LOAD_APPROVERS`;
DELIMITER ;;
CREATE DEFINER=`automatordb`@`localhost` PROCEDURE `LOAD_APPROVERS`(IN `USERID` INT, IN `PROCESSID` INT, IN `REQUESTID` VARCHAR(25), IN `EMAILADDR` VARCHAR(100))
BEGIN
set @MGR_ID=NULL;
set @HODEMAIL=NULL;
set @HOD_ID = NULL;
set @HODOVER_ID = NULL;
set @HODOVER_EMAIL = NULL;
set @userid=USERID;
set @processid=PROCESSID;
set @requestid=REQUESTID;
set @emailaddr=EMAILADDR;

SET @count:=0;

SELECT users.hodemail into @HODOVER_EMAIL FROM users WHERE users.id=@userid;

SELECT users.id into @MGR_ID FROM users WHERE users.email =  @emailaddr;

SELECT dept.hod into @HODEMAIL FROM users Inner Join dept ON users.dept = dept.deptname where users.id=@userid;
SELECT users.id into @HOD_ID FROM users WHERE users.email =  @HODEMAIL;
SELECT users.id into @HODOVER_ID FROM users WHERE users.email =  @HODOVER_EMAIL;


insert into request_approvers(approver_id, request_id, process_id,  order_no, appr_name, appr_function)
SELECT approver_id, @requestid, process_id, (@count:=@count+1) AS order_no,appr_name,appr_function from
(SELECT
approver_id,
process_id,
if(appr_name=0 and approver_from="Preset1",@MGR_ID,if(appr_name=0 and approver_from="Preset2",if(@HODOVER_ID IS NULL OR @HODOVER_ID = "",@HOD_ID,@HODOVER_ID),if(appr_name=0 and approver_from="Initiator",@userid,appr_name))) as appr_name,


appr_function
FROM
workflow_approvers
where process_id=@processid
having appr_name <> @userid
order by order_no) as tmptbl
where  approver_id in
(select max(approver_id) from
(SELECT
approver_id,
if(appr_name=0 and approver_from="Preset1",@MGR_ID,if(appr_name=0 and approver_from="Preset2",if(@HODOVER_ID IS NULL OR @HODOVER_ID = "",@HOD_ID,@HODOVER_ID),if(appr_name=0 and approver_from="Initiator",@userid,appr_name))) as appr_name
FROM
workflow_approvers
where process_id=@processid
having appr_name <> @userid
) as tmp_approvers group by appr_name) ON DUPLICATE KEY UPDATE
approver_id=values(approver_id),request_id=values(request_id),
 process_id=values( process_id),order_no=values(order_no),
appr_name=values(appr_name),appr_function=values(appr_function)
;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for LOAD_APPROVERS2
-- ----------------------------
DROP PROCEDURE IF EXISTS `LOAD_APPROVERS2`;
DELIMITER ;;
CREATE DEFINER=`abaobe`@`localhost` PROCEDURE `LOAD_APPROVERS2`(IN `USERID` INT, IN `PROCESSID` INT, IN `REQUESTID` VARCHAR(25), IN `EMAILADDR` VARCHAR(100))
BEGIN
set @MGR_ID=NULL;
set @HODEMAIL=NULL;
set @HOD_ID = NULL;
set @userid=USERID;
set @processid=PROCESSID;
set @requestid=REQUESTID;
set @emailaddr=EMAILADDR;

set @HODOVER_ID = NULL;
set @HODOVER_EMAIL = NULL;

SELECT users.hodemail into @HODOVER_EMAIL FROM users WHERE users.id=@userid;
SELECT users.id into @MGR_ID FROM users WHERE users.email =  @emailaddr;
SELECT dept.hod into @HODEMAIL FROM users Inner Join dept ON users.dept = dept.deptname where users.id=@userid;
SELECT users.id into @HOD_ID FROM users WHERE users.email =  @HODEMAIL;
SELECT users.id into @HODOVER_ID FROM users WHERE users.email =  @HODOVER_EMAIL;

insert into request_approvers(approver_id, request_id, process_id,  order_no, appr_name, appr_function)
SELECT
approver_id, REQUESTID, process_id,order_no,
if(appr_name=0 and approver_from="Preset1",@MGR_ID,if(appr_name=0 and approver_from="Preset2",
if(@HODOVER_ID IS NULL OR @HODOVER_ID = "",@HOD_ID,@HODOVER_ID),
if(appr_name=0 and approver_from="Initiator",@userid,appr_name))) as appr_name,
appr_function
FROM
workflow_approvers
where process_id=PROCESSID
ON DUPLICATE KEY UPDATE
approver_id=values(approver_id),request_id=values(request_id),
process_id=values( process_id),order_no=values(order_no),
appr_name=values(appr_name),appr_function=values(appr_function)
;

END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for REROUTE_REQUEST
-- ----------------------------
DROP PROCEDURE IF EXISTS `REROUTE_REQUEST`;
DELIMITER ;;
CREATE DEFINER=`automatordb`@`localhost` PROCEDURE `REROUTE_REQUEST`(IN `USERID` INT, IN `REQUESTID` VARCHAR(25), IN `NEXTAPPROVER` VARCHAR(255))
    NO SQL
BEGIN
update request_approvers
Inner Join workflow_requests ON workflow_requests.next_appr = request_approvers.appr_name
AND request_approvers.request_id = workflow_requests.request_id
set workflow_requests.next_appr=USERID,
request_approvers.appr_name=USERID,
workflow_requests.next_approver=NEXTAPPROVER
where workflow_requests.request_id = REQUESTID;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for update_data
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_data`;
DELIMITER ;;
CREATE DEFINER=`automatordb`@`localhost` PROCEDURE `update_data`()
BEGIN
update free_goods_details inner join items_table
ON free_goods_details.product_code = items_table.item_code
set free_goods_details.unit_price = items_table.item_price,
free_goods_details.total_price = cast(free_goods_details.qty as unsigned)* items_table.item_price;

UPDATE free_goods AS b1, (
SELECT free_goods.request_id,
sum(cast(free_goods_details.qty as unsigned)) as totalqty,
sum(free_goods_details.total_price) as total_price
FROM free_goods
Inner Join free_goods_details ON free_goods_details.request_id = free_goods.request_id
group by free_goods.request_id) AS b2
SET b1.total_bottles = b2.totalqty,b1.total_amount = b2.total_price
WHERE b1.request_id = b2.request_id;

END;;
DELIMITER ;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `attachments` VALUES ('15', '8fadcc5ab0', 'creditfile', 'SER_October_2021_Value_Max_Rural_Target_and_Credit_Deployment_Template.xlsx', 'attachments/8fadcc5ab0_creditfile_SER_October_2021_Value_Max_Rural_Target_and_Credit_Deployment_Template.xlsx', '2021-10-13 11:21:20');
INSERT INTO `attachments` VALUES ('16', '8fadcc5ab0', 'creditfile', 'SER_October_2021_Value_Max_Rural_Target_and_Credit_Deployment_Template.xlsx', 'attachments/8fadcc5ab0_creditfile_SER_October_2021_Value_Max_Rural_Target_and_Credit_Deployment_Template.xlsx', '2021-10-13 11:21:36');
INSERT INTO `attachments` VALUES ('17', '14b85aae3f', 'creditfile', 'SER_October_2021_Value_Max_Urban_Target_and_Credit_Deployment_Template.xlsx', 'attachments/14b85aae3f_creditfile_SER_October_2021_Value_Max_Urban_Target_and_Credit_Deployment_Template.xlsx', '2021-10-13 11:24:13');
INSERT INTO `attachments` VALUES ('18', '8fadcc5ab0', 'creditfile', 'SER_October_2021_Value_Max_Rural_Target_and_Credit_Deployment_Template.xlsx', 'attachments/8fadcc5ab0_creditfile_SER_October_2021_Value_Max_Rural_Target_and_Credit_Deployment_Template.xlsx', '2021-10-14 10:48:39');
INSERT INTO `attachments` VALUES ('19', '4ff21d44d3', 'creditfile', 'October_2021_Value_Max_Rural_Target_and_Credit_Deployment_Template_North.xlsx', 'attachments/4ff21d44d3_creditfile_October_2021_Value_Max_Rural_Target_and_Credit_Deployment_Template_North.xlsx', '2021-10-15 11:50:19');
INSERT INTO `attachments` VALUES ('20', '4a97b6eb15', 'creditfile', 'October_2021_Value_Max_Urban_Target_and_Credit_Deployment_Template_North.xlsx', 'attachments/4a97b6eb15_creditfile_October_2021_Value_Max_Urban_Target_and_Credit_Deployment_Template_North.xlsx', '2021-10-15 11:51:00');
INSERT INTO `attachments` VALUES ('21', '249c558d81', 'creditfile', 'MB_Region_October_2021_Value_Max_Urban_Target_and_Credit_Deployment_Template_MBelt.xlsx', 'attachments/249c558d81_creditfile_MB_Region_October_2021_Value_Max_Urban_Target_and_Credit_Deployment_Template_MBelt.xlsx', '2021-10-15 12:01:55');
INSERT INTO `attachments` VALUES ('22', '0bb92eb459', 'creditfile', 'MB_Region_October_2021_Value_Max_Rural_Target_and_Credit_Deployment_Template_MBelt.xlsx', 'attachments/0bb92eb459_creditfile_MB_Region_October_2021_Value_Max_Rural_Target_and_Credit_Deployment_Template_MBelt.xlsx', '2021-10-15 12:03:39');
INSERT INTO `attachments` VALUES ('23', '2d7d24f4b1', 'creditfile', 'SWR_-_October_2021_Value_Max_Rural_Target_and_Credit_Deployment.xlsx', 'attachments/2d7d24f4b1_creditfile_SWR_-_October_2021_Value_Max_Rural_Target_and_Credit_Deployment.xlsx', '2021-10-18 10:45:33');
INSERT INTO `attachments` VALUES ('24', 'd7110ba278', 'creditfile', 'October_2021_Value_Max_Urban_Target_and_Credit_Deployment_SWR.xlsx', 'attachments/d7110ba278_creditfile_October_2021_Value_Max_Urban_Target_and_Credit_Deployment_SWR.xlsx', '2021-10-18 11:57:15');
INSERT INTO `attachments` VALUES ('25', '94bf7682d1', 'creditfile', 'SER_additional_credit__request_Oct_2021_RME__v3.xlsx', 'attachments/94bf7682d1_creditfile_SER_additional_credit__request_Oct_2021_RME__v3.xlsx', '2021-11-01 16:53:58');
INSERT INTO `brand_prices` VALUES ('1', 'B & H Switch', '222500.00');
INSERT INTO `brand_prices` VALUES ('2', 'B&H Demi Rubi', '80000.00');
INSERT INTO `brand_prices` VALUES ('3', 'B&H Tropical Boost', '92000.00');
INSERT INTO `brand_prices` VALUES ('4', 'Benson & Hedges Boost', '144000.00');
INSERT INTO `brand_prices` VALUES ('5', 'Benson & Hedges Demi-Slims', '144000.00');
INSERT INTO `brand_prices` VALUES ('6', 'Benson & Hedges Double Cool', '116000.00');
INSERT INTO `brand_prices` VALUES ('7', 'Benson & Hedges Flavour', '188500.00');
INSERT INTO `brand_prices` VALUES ('8', 'Benson and Hedges Cool Fusion', '144000.00');
INSERT INTO `brand_prices` VALUES ('9', 'Dunhill KSF', '100000.00');
INSERT INTO `brand_prices` VALUES ('10', 'Dunhill Lights', '216500.00');
INSERT INTO `brand_prices` VALUES ('11', 'Dunhill Switch', '216500.00');
INSERT INTO `brand_prices` VALUES ('12', 'Pall Mall Boost', '86000.00');
INSERT INTO `brand_prices` VALUES ('13', 'Pall Mall - Excel Blend', '83000.00');
INSERT INTO `brand_prices` VALUES ('14', 'Pall Mall Filter', '104500.00');
INSERT INTO `brand_prices` VALUES ('15', 'Pall Mall Menthol', '91000.00');
INSERT INTO `brand_prices` VALUES ('16', 'Pall Mall Rubi', '68000.00');
INSERT INTO `brand_prices` VALUES ('17', 'Rothmans Flavour', '152000.00');
INSERT INTO `brand_prices` VALUES ('18', 'Rothmans Menthol', '132000.00');
INSERT INTO `brand_prices` VALUES ('19', 'Rothmans Menthol Mix', '101000.00');
INSERT INTO `brand_prices` VALUES ('20', 'Rothmans Switch', '152000.00');
INSERT INTO `brand_prices` VALUES ('21', 'Rothmans Switch Indigo', '91000.00');
INSERT INTO `brand_prices` VALUES ('22', 'Royal  Std Filter', '104500.00');
INSERT INTO `brand_prices` VALUES ('23', 'ST Moritz By Dunhill', '152000.00');
INSERT INTO `brand_prices` VALUES ('24', 'St Moritz King Size', '50000.00');
INSERT INTO `credit_add_request` VALUES ('94bf7682d1', '2021-11-01 16:51:37', '93', 'Standard Credit', 'RWS', 'South East', 'Additional Credit Request for SER RWS', 'Oct 2021', '2021-10-01', '2021-11-01 16:51:37');
INSERT INTO `credit_report` VALUES ('1', '997d3914ad', 'RWS', 'Middle Belt', '317364150.00', '76278250.00', '119222838.00', '24.03', '63.98');
INSERT INTO `credit_report` VALUES ('2', '997d3914ad', 'RWS', 'North', '232950550.00', '65530400.00', '69183559.52', '28.13', '94.72');
INSERT INTO `credit_report` VALUES ('3', '997d3914ad', 'RWS', 'South East', '557735680.00', '137089145.00', '182578577.10', '24.58', '75.09');
INSERT INTO `credit_report` VALUES ('4', '997d3914ad', 'RWS', 'South West', '690577239.50', '189338365.00', '190057691.90', '27.42', '99.62');
INSERT INTO `credit_report` VALUES ('5', '997d3914ad', 'RWS', 'Total', '1798627620.00', '468236160.00', '561042666.50', '26.03', '83.46');
INSERT INTO `credit_report` VALUES ('6', '19b51e30b8', 'UWS', 'Middle Belt', '3208507000.00', '803482500.00', '760741942.70', '25.04', '105.62');
INSERT INTO `credit_report` VALUES ('7', '19b51e30b8', 'UWS', 'North', '2917249500.00', '796137850.00', '792485446.60', '27.29', '100.46');
INSERT INTO `credit_report` VALUES ('8', '19b51e30b8', 'UWS', 'South East', '4037326500.00', '1175224625.00', '1108968628.00', '29.11', '105.97');
INSERT INTO `credit_report` VALUES ('9', '19b51e30b8', 'UWS', 'South West', '4068371000.00', '906709289.30', '920000413.10', '22.29', '98.56');
INSERT INTO `credit_report` VALUES ('10', '19b51e30b8', 'UWS', 'Total', '14231454000.00', '3681554264.00', '3582196431.00', '25.87', '102.77');
INSERT INTO `credit_request` VALUES ('19b51e30b8', '2021-10-12 12:51:55', '25', 'Standard Credit', 'UWS', 'attachments/f63b4e8687_creditfile_MiddleBelt.xlsx', 'templates/uws/GBNL_UWS_Oct_2021.xlsx', 'templates/uws/consolidated_Oct_2021.xlsx', 'Live version for Oct 2021', null, 'Oct 2021', null, '2021-10-01', '2021-10-12 12:51:55');
INSERT INTO `credit_request` VALUES ('997d3914ad', '2021-10-12 12:52:51', '25', 'Standard Credit', 'RWS', 'attachment/252b3727bd_creditfile_rws_standard.xlsx', 'templates/rws/GBNL_RWS_Oct_2021.xlsx', 'templates/rws/consolidated_Oct_2021.xlsx', 'Live Version for Oct 2021', null, 'Oct 2021', null, '2021-10-01', '2021-10-12 12:52:51');
INSERT INTO `customer_credit` VALUES ('1', 'MBC001329', 'Moses Everistos mokwa', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('2', 'MBC001350', 'Musa Isah', '2474777.19', '7424331.57', '3');
INSERT INTO `customer_credit` VALUES ('3', 'MBC001360', 'Danyaya Mohd', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('4', 'MBC001526', 'Rufai Haliru', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('5', 'MBC001921', 'Sunny Holdings Nig', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('6', 'MBC001930', 'De - Blessed Investment', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('7', 'MBC002177', 'Eze Onyebuchi', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('8', 'MBC002873', 'Hussaini Baba', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('9', 'MBC003336', 'JohnChido Ogbuabor', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('10', 'WCJA000001', 'Haruna Mohammed', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('11', 'WCJA000002', 'Abdulmumini Usman', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('12', 'WCJA000004', 'Baba Jos', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('13', 'WCJA000005', 'Chukudi Ogbo', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('14', 'WCJA000006', 'Kenneth KC', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('15', 'WCJA000007', 'Fabian Ecomog', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('16', 'WCJA000008', 'Zila Daura', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('17', 'WCJA000011', 'Haliru Hassan', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('18', 'WCJA000012', 'Mike Ogbonna', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('19', 'WCJA000017', 'Oliver Eze', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('20', 'WCJA000018', 'Zakaria SO', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('21', 'WCJA000019', 'Abubakar Chairman', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('22', 'WCJA000025', 'Lawan Danfari', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('23', 'WCJA000026', 'Bafashi Galadima', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('24', 'WCJA000031', 'Ramatu Fatamoye', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('25', 'WCJA000048', 'Saidu Isiaku', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('26', 'WCJA000103', 'Sunday Edeh', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('27', 'WCJA000104', 'Madueke Nnaji', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('28', 'WCJA000106', 'Mohammed Sule', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('29', 'WCJA000332', 'EMMANUEL ANI', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('30', 'WCJA000334', 'Simon Ossai', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('31', 'WCJA000379', 'Amechi Ogbu', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('32', 'MBC003337', 'A U Supreme Ventures', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('33', 'SWC1980', 'Danjuma Ibrahim', '2107164.46', '6321493.38', '3');
INSERT INTO `customer_credit` VALUES ('34', 'SWC2239', ' Shuaibu Aneru Wisdom', '194997.50', '584992.50', '3');
INSERT INTO `customer_credit` VALUES ('35', 'WCFA000179', 'Mama Habibu', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('36', 'WCFA000180', 'Mama Nana', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('37', 'WCFA000181', 'Hauwa Usman', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('38', 'WCFA000183', 'Majester Obendel', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('39', 'WCFA000229', 'Tanimu Alfa', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('40', 'MBC001327', 'Aminu Saeed', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('41', 'MBC002083', 'Ogbonna Ndubisi', '853902.75', '2561708.25', '3');
INSERT INTO `customer_credit` VALUES ('42', 'MBC002084', 'MS Muhammad', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('43', 'MBC002085', 'Nuhu Usman', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('44', 'MBC002829', 'Kadio Atser', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('45', 'MBC002875', 'ALh.Haruna Umar', '0.00', '5274370.99', '2');
INSERT INTO `customer_credit` VALUES ('46', 'MBC002876', 'Marison Cornelus', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('47', 'MBC002896', 'Ahmed Shuaibu', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('48', 'MBC002944', 'Ibrahim Hassan', '2717421.98', '8990966.11', '2');
INSERT INTO `customer_credit` VALUES ('49', 'MBC002945', 'Alhaji Ubale Ibi', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('50', 'WCJA000095', 'Titus Onyeka', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('51', 'WCJA000096', 'Nasiru Mahmood', '872580.77', '872580.77', '1');
INSERT INTO `customer_credit` VALUES ('52', 'WCJA000097', 'Sani Zico', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('53', 'WCJA000102', 'Abdu Abdullahi', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('54', 'WCJA000112', 'Adamu Julde', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('55', 'WCJA000114', 'Ahmed Musa', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('56', 'WCJA000116', 'Maina Odubo', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('57', 'WCJA000119', 'Darazo Usman ', '0.00', '6264093.32', '1');
INSERT INTO `customer_credit` VALUES ('58', 'WCJA000120', 'Sallau Abdullahi', '0.00', '4443368.78', '1');
INSERT INTO `customer_credit` VALUES ('59', 'WCJA000121', 'Sale Naplato', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('60', 'WCJA000130', 'Danjauro Manu', '0.00', '14274271.85', '1');
INSERT INTO `customer_credit` VALUES ('61', 'WCJA000131', 'Abubakar Mohammed', '0.00', '10288410.09', '1');
INSERT INTO `customer_credit` VALUES ('62', 'WCJA000149', 'Chidube Hygenus', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('63', 'WCJA000300', 'Peter Yohanna', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('64', 'WCJA000423', 'Mal Musa Bappa', '1511557.79', '4534673.37', '3');
INSERT INTO `customer_credit` VALUES ('65', 'MBC001620', 'Sambo Abdullahi', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('66', 'MBC002833', 'Obadiah Anthony', '1207030.06', '3621090.18', '3');
INSERT INTO `customer_credit` VALUES ('67', 'MBC002868', 'USMAN SANI', '0.00', '1385118.52', '1');
INSERT INTO `customer_credit` VALUES ('68', 'WCJA000057', 'Salisu Zuru', '11618331.52', '34854994.56', '3');
INSERT INTO `customer_credit` VALUES ('69', 'WCJA000065', 'Lawan K waba', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('70', 'WCJA000066', 'Audu Vwa', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('71', 'WCJA000072', 'Abubakar DanHalima', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('72', 'WCJA000077', 'Danasabe Abubakar', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('73', 'WCJA000082', 'Abdullahi Sani', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('74', 'WCJA000083', 'Emma Nwabueze', '5910804.11', '11821608.22', '2');
INSERT INTO `customer_credit` VALUES ('75', 'WCJA000088', 'Waliyu Musa', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('76', 'WCJA000151', 'MUSA YUSUF', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('77', 'WCJA000188', 'Nadabo Musa', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('78', 'WCJA000117', 'Abdullahi Adamu', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('79', 'WCJA000099', 'Sani Dalhatu', '0.00', '2278498.74', '1');
INSERT INTO `customer_credit` VALUES ('80', 'WCJA000032', 'Sunday umeh', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('81', 'MBC003463', 'IDRIS IBRAHIM', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('82', 'SWC2911', 'FELIX OMEYE', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('83', 'MBC003538', 'Daniel I. Chukwuemeka', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('84', 'SWC3017', 'Saidu Abubakar', '1687164.00', '5065493.94', '3');
INSERT INTO `customer_credit` VALUES ('85', 'NTC1928', 'Nasiru Sarki', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('86', 'NTC1981', 'Abubakar Yahuza', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('87', 'WCDA000005', 'Salisu Maikanti', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('88', 'WCDA000006', 'Nafiu Musa', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('89', 'WCDA000011', 'Sheu S Jos', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('90', 'WCDA000013', 'Salisu Adamu', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('91', 'WCDA000015', 'Yusuf Abdulrahman', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('92', 'WCDA000016', 'Barau AbdulFrahaman', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('93', 'WCDA000025', 'Usman Sale', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('94', 'WCDA000026', 'Alh. Zubairu Daura', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('95', 'NTC0031', 'BUHARI MANIR', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('96', 'NTC1243', 'Alh.Ibrahim Maikudi', '24983.75', '74951.25', '3');
INSERT INTO `customer_credit` VALUES ('97', 'NTC1721', 'ALH ABDULMUMINU ISAH', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('98', 'WCDA000032', 'Abdulhamid Musa', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('99', 'WCDA000034', 'Ahl. Sani Tasha', '869112.00', '2607336.00', '3');
INSERT INTO `customer_credit` VALUES ('100', 'WCDA000043', 'Alh. Lawan Danrabe', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('101', 'MBC002893', 'Hussaini Umar Bassingbourn', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('102', 'MBC002973', 'MUKTARI  YASHAU', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('103', 'NTC0063', 'HADI ALI', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('104', 'NTC1127', 'Tijani Terry', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('105', 'NTC1192', 'Maikudi Isa', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('106', 'NTC1851', 'John Goji', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('107', 'WCDA000052', 'Goni Ibrahim', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('108', 'WCDA000057', 'Jidda Goni', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('109', 'WCDA000134', 'GARBA 50/50', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('110', 'WCJA000124', 'Usman Garba ', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('111', 'WCJA000312', 'MOHD VANDI', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('112', 'WCJA000392', 'ALH ABABARE GOMBI', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('113', 'NTC1071', 'Bilyaminu Ladan', '4520000.00', '13560000.00', '3');
INSERT INTO `customer_credit` VALUES ('114', 'NTC1162', 'Ibrahim Mohammed Gani', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('115', 'NTC1578', 'ALH. Sahabi Dahiru', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('116', 'NTC1659', 'NAZIRU DAHIRU', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('117', 'NTC1682', 'Nasiru Haruna', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('118', 'NTC1686', 'Mohammed Rila', '336691.40', '1010074.20', '3');
INSERT INTO `customer_credit` VALUES ('119', 'NTC1730', 'Green White Green', '170262.50', '510787.50', '3');
INSERT INTO `customer_credit` VALUES ('120', 'WCDA000077', 'Alh Aminu Fara', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('121', 'WCDA000079', 'Alh Dahiru Bello', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('122', 'WCDA000086', 'Alh Malami S. Hurumi', '42029.50', '126088.50', '3');
INSERT INTO `customer_credit` VALUES ('123', 'WCDA000087', 'Alh Malami Wurno', '0.00', '2852321.57', '1');
INSERT INTO `customer_credit` VALUES ('124', 'WCDA000088', 'Alh Musa Kange', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('125', 'WCDA000089', 'Alh Namadina', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('126', 'WCDA000103', 'Alh Musa Jega', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('127', 'WCDA000105', 'Alh Umaru Khande', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('128', 'WCDA000108', 'Alh Audu Abdullahi Danfulani', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('129', 'WCDA000111', 'Alh Dahiru Alto', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('130', 'WCDA000172', 'Alh Gado', '0.17', '0.51', '3');
INSERT INTO `customer_credit` VALUES ('131', 'WCDA000180', 'Saidu Bello', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('132', 'WCJA000035', 'Cosmos Anyougu', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('133', 'WCDA000069', 'Barkindo ba', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('134', 'WCDA000071', 'Manu Mohammed', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('135', 'NTC1964', 'Gurza Enterprises', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('136', 'NTC2304', 'Lawali Muhammad', '2851392.76', '8554178.28', '3');
INSERT INTO `customer_credit` VALUES ('137', 'NTC2307', 'Aminu Usman', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('138', 'NTC2351', 'Alh Suleiman Bagudo', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('139', 'NTC1289', 'Alh Muntaka M.T.K', '0.00', '1327.36', '2');
INSERT INTO `customer_credit` VALUES ('140', 'MBC003485', 'Ali Audu', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('141', 'NTC1262', 'Varuwa Tizhe', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('142', 'NTC2306', 'Shamsudeen Usman', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('143', 'SWC1225', 'Multiple Popular', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('144', 'SWC1252', 'Ugochukwu Ezeja', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('145', 'SWC1275', 'Igere Richard', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('146', 'SWC1388', 'Igwe Stores', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('147', 'SWC1614', 'Sir Peesman', '4344881.60', '13034644.80', '3');
INSERT INTO `customer_credit` VALUES ('148', 'SWC1989', 'Ufuanyaegbunam Okechukwu', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('149', 'SWC2391', 'Clement Igbafa Afekhena', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('150', 'WCFA000138', 'Amechi Aniemeka', '0.09', '0.27', '3');
INSERT INTO `customer_credit` VALUES ('151', 'WCFA000139', 'Damian Eziekwu', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('152', 'WCFA000143', 'James Okochi', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('153', 'WCFA000145', 'Peter Esiobu (Vindon O.)', '1848470.91', '5645412.73', '3');
INSERT INTO `customer_credit` VALUES ('154', 'WCFA000152', 'Rhoda E', '1310436.25', '3931308.75', '3');
INSERT INTO `customer_credit` VALUES ('155', 'WCFA000190', 'Felicia Oji', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('156', 'WCFA000194', 'Maria Asakpa(Warri)', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('157', 'WCFA000195', 'Maria Ogbe', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('158', 'WCFA000197', 'Roseline Afor', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('159', 'WCFA000198', 'Stella Omoshowafa', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('160', 'WCFA000200', 'Victoria Agbajo', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('161', 'WCFA000201', 'Benvosa Resources', '0.00', '1455472.84', '1');
INSERT INTO `customer_credit` VALUES ('162', 'WCFA000203', 'Clara Ohwaga', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('163', 'WCFA000204', 'Florence Mofe', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('164', 'WCFA000205', 'Grace Oboh', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('165', 'PWCPP00030', 'Jacob Ekpo', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('166', 'PWCPP00046', 'Too Good', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('167', 'PWCPP00052', 'Anthony Ikeagwu', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('168', 'SEC001235', 'Aniekan Napoleon', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('169', 'SEC001390', 'IME ELIJAH', '0.00', '5985780.13', '1');
INSERT INTO `customer_credit` VALUES ('170', 'SEC001788', 'EMEKA UDEMBA', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('171', 'SEC003328', 'Uzoma Nwankwo Samuel', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('172', 'WCPA000024', 'JONAS DIKE', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('173', 'WCPA000025', 'NZE C.N. OKONKWO', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('174', 'WCPA000026', 'JUDE ANYANWU', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('175', 'WCPA000028', 'IGNATUS OKAFOR', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('176', 'WCPA000042', 'OKEY EZUNAGU', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('177', 'WCPA000139', 'IME B. EKPO', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('178', 'WCPA000143', 'ISIDORE NKANTA', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('179', 'WCPA000144', 'FRIDAY BASSEY', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('180', 'WCPA000148', 'JOSEPH EZEH', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('181', 'WCPA000152', 'CHUKWUDI ASIEGBU', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('182', 'WCPA000155', 'ABUBAKAR & SON', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('183', 'WCPA000156', 'INNOCENT & SON', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('184', 'WCPA000181', 'STEPHEN AMAMA', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('185', 'PWCPP00030', 'SAMUEL IWEKA', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('186', 'PWCPP00034', 'Paul Ejikeme', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('187', 'PWCPP00034', 'Vincent Chikwendu', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('188', 'PWCPP00034', 'O C C', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('189', 'SEC001044', 'ANAYO NWANI', '0.00', '615.97', '1');
INSERT INTO `customer_credit` VALUES ('190', 'SEC001112', 'ODO MARTIN', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('191', 'SEC001593', 'Christian Obi', '2198731.39', '6736194.17', '3');
INSERT INTO `customer_credit` VALUES ('192', 'SEC001824', 'Livinus Ogumba', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('193', 'SEC001903', 'Christian Mba', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('194', 'SEC002709', 'Innocent Eziaghala', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('195', 'SEC003370', 'Alaeze Godwin', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('196', 'WCPA000068', 'AMAECHI ENEH', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('197', 'WCPA000078', 'PATRICK NNEJI ', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('198', 'WCPA000085', 'DENNIS EYA', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('199', 'WCPA000087', 'FIDELIS ONAH', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('200', 'WCPA000090', 'MONICA NNABUCHI', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('201', 'WCPA000091', 'JOHN ANIEGBOKA', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('202', 'WCPA000101', 'CHIDI EKE', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('203', 'WCPA000104', 'MENSU BOSS', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('204', 'WCPA000111', 'PHILIP NWEKE', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('205', 'WCPA000123', 'Obi Eze & Company Nig Limited', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('206', 'SEC001078', 'Omakwu Abel', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('207', 'SEC002027', 'Ifyanyi  Nwanyanwu', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('208', 'SEC002091', 'EMEKA EZE', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('209', 'SEC002092', 'ALH HASSAN YAKUBU', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('210', 'SEC002725', 'GEORGE EZEMA', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('211', 'SEC002767', 'Alhaji Umoru Danbauchi', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('212', 'SEC003374', 'Onyekwere Eze Enterprise', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('213', 'WCPA000159', 'Alh Dahiru Baba', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('214', 'WCPA000167', 'Paul Abuchi', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('215', 'WCPA000169', 'Charles Duru', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('216', 'WCPA000171', 'Obinna Obi', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('217', 'WCPA000172', 'Umar Bobo', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('218', 'WCPP000745', 'Eze Chibuzo', '4499524.14', '13498572.42', '3');
INSERT INTO `customer_credit` VALUES ('219', 'PWCPP00051', 'Ojuiyiowi Eze', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('220', 'SEC001204', 'Mrs Oyindamola Babalola', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('221', 'SEC001205', 'Alhaji Dauda Abdulsalam', '6820161.59', '8216823.18', '2');
INSERT INTO `customer_credit` VALUES ('222', 'SEC002830', 'Bashir Aliyu', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('223', 'WCPA000001', 'IBRAHIM ABDULAHI EDI', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('224', 'WCPA000002', 'ALHAJI AHMADU ADAMU ABDULAHI', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('225', 'WCPA000004', 'ADAMU ADO', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('226', 'WCPA000006', 'ADAMU YAKUBU', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('227', 'WCPA000019', 'DONALD ODIMEGWU', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('228', 'WCPA000054', 'IFEANYI OSUJI', '602358.00', '1807074.00', '3');
INSERT INTO `customer_credit` VALUES ('229', 'WCPA000057', 'EZEKWE OJIOFOR', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('230', 'WCPA000061', 'NDUBUISI ARIRIAHU', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('231', 'WCPA000063', 'CHIEF SIMON EMERE', '0.00', '35256644.33', '1');
INSERT INTO `customer_credit` VALUES ('232', 'WCPA000161', 'Alh Isah Musa', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('233', 'SEC003627', 'Dickson Madueke', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('234', 'SEC003690', 'Nwani Francis', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('235', 'SEC003703', 'REFERENCE SUPER STORE', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('236', 'SEC002559', 'Essien Akpan Bassey', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('237', 'SWC3000', 'Elizabeth Egbeimah', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('238', 'CTAH0003', 'KEMI SOLOLA', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('239', 'CTAH0006', 'ADENLE BILIKISU', '6372668.94', '19618006.82', '3');
INSERT INTO `customer_credit` VALUES ('240', 'CTAH0017', 'IYA OPE', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('241', 'CTAH0023', 'JOHN MAMAH', '482.00', '1446.00', '3');
INSERT INTO `customer_credit` VALUES ('242', 'CTAH0303', 'Mrs Iyabo Rasheed', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('243', 'CTAI0082', 'Tope Adewole (Agege)', '414286.22', '1242858.66', '3');
INSERT INTO `customer_credit` VALUES ('244', 'CTAJ0003', 'MAMMAH ROSEMARY', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('245', 'CTAJ0006', 'EMMANUEL NWADIKE', '10198286.25', '30594858.75', '3');
INSERT INTO `customer_credit` VALUES ('246', 'CTAJ0007', 'ADEJOKE TIJANI', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('247', 'CTAK0003', 'AIRATU OSAYEMI', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('248', 'CTAK0007', 'IYABO', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('249', 'LAC0073', 'BABA SODIQ', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('250', 'LAC0281', 'Esther Jimoh', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('251', 'LAC0282', 'IYA IBEJI JENNT COMFORT', '4942169.10', '14826507.30', '3');
INSERT INTO `customer_credit` VALUES ('252', 'LAC0431', 'Aminat Adeniyi', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('253', 'LAC0616', 'Onyekachi Ifeanyi', '5026539.06', '15079617.18', '3');
INSERT INTO `customer_credit` VALUES ('254', 'LAC0666', 'Iya Mohammed', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('255', 'LAC0696', 'Ndigwe & Igwe Venture', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('256', 'LAC1605', 'Iya Faidat Trading Stores', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('257', 'LAC2292', 'Iya Tosin', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('258', 'LAC2298', 'WONUJUWONLO VENTURE', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('259', 'LAC2392', 'UGWU JONAS EMEKA', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('260', 'LAC2393', 'NDIGWE SAMUEL TOCHUKWU', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('261', 'SWC1390', 'Selfas Merchandise Ent.', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('262', 'SWC2335', 'Okafor Iloke', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('263', 'WCFA000175', 'Chukwuma Ube', '3037178.10', '9111534.30', '3');
INSERT INTO `customer_credit` VALUES ('264', 'WCFA000177', 'Samuel Ube', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('265', 'WCFA000208', 'Alhaja Lateef Ayisat', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('266', 'WCFA000218', 'Kelechi Store', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('267', 'WCFA000220', 'Mc Igwe', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('268', 'WCFA000223', 'St.Judes Stores', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('269', 'SWC0917', 'Ben Stores', '1434731.70', '4604195.10', '3');
INSERT INTO `customer_credit` VALUES ('270', 'CTAN0004', 'GBOSHE OLATUNJI', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('271', 'CTAN0007', 'OYEDIJO MIKAILA', '0.00', '3475143.58', '2');
INSERT INTO `customer_credit` VALUES ('272', 'CTAN0008', 'WASIU SILIFAT', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('273', 'CTAN0010', 'KUBURATU LAWAL', '846237.60', '2578712.80', '3');
INSERT INTO `customer_credit` VALUES ('274', 'CTAN0011', 'NIKE OLADIPO', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('275', 'CTAN0012', 'RASHIDAT OLAJIDE (Fauzat)', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('276', 'CTAP0019', 'NAB NIG. ENTERPRISES', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('277', 'CTAQ0005', 'IDRIS (1) USENI', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('278', 'LAC0390', 'Alfa Nofiu', '9043319.66', '27229958.98', '3');
INSERT INTO `customer_credit` VALUES ('279', 'LAC1472', 'King Joe Incorporation', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('280', 'LAC2143', 'IYA PETER (MRS AFOLABI)', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('281', 'LAC2253', 'EDWIN ONWUAMAIZU', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('282', 'LAC2254', 'GEOMAN OKUMA (GM)', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('283', 'LAC2255', 'IYA LATEFATH OLAITAN', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('284', 'LAC2256', 'MARUF FAUZAT (AYISATH)', '3000.00', '9000.00', '3');
INSERT INTO `customer_credit` VALUES ('285', 'LAC2259', 'MOHAMED ALI', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('286', 'LAC2258', 'IYA AHMED FALY', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('287', 'LAC2268', 'Ibrahim Yahaya', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('288', 'LAC3368', 'FLORENCE AGBOOLA', '0.00', '976555.76', '1');
INSERT INTO `customer_credit` VALUES ('289', 'LAC3519', 'T.H. NIG. Enterprises', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('290', 'LAC3531', 'CHUKWU EMERIE Stores Limited', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('291', 'LAC3572', 'IYA KOKORO', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('292', 'SWC0914', 'Mrs Dada Kolapo', '0.00', '3213822.27', '1');
INSERT INTO `customer_credit` VALUES ('293', 'SWC1078', 'Ali Yusuf', '891355.00', '1782710.00', '2');
INSERT INTO `customer_credit` VALUES ('294', 'SWC1102', 'Alhaja Mosadoluwa', '2666803.86', '2666803.86', '1');
INSERT INTO `customer_credit` VALUES ('295', 'SWC1105', 'Alhaja Tanimola Adeyinka', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('296', 'SWC1269', 'Mrs. Ayinke Adebayo', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('297', 'SWC2006', 'MAVELLOUS STORE', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('298', 'SWC2092', 'IYA TOPE', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('299', 'WCFA000001', 'Iya Amina Rafiu', '2042957.40', '2042957.40', '1');
INSERT INTO `customer_credit` VALUES ('300', 'WCFA000003', 'Twins Sister', '0.00', '4163904.60', '1');
INSERT INTO `customer_credit` VALUES ('301', 'WCFA000004', 'Olaide Oguniyi', '0.00', '2072750.02', '1');
INSERT INTO `customer_credit` VALUES ('302', 'WCFA000008', 'Funmi Alira(Mrs)', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('303', 'WCFA000018', 'Anifat Ibikunle', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('304', 'WCFA000021', 'Iya Ramon Isiaka', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('305', 'WCFA000023', 'Sadiq Sile (iya)', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('306', 'WCFA000026', 'Latifat Ajiboye', '0.00', '1514211.00', '2');
INSERT INTO `customer_credit` VALUES ('307', 'WCFA000027', 'Abdul Ramon Mujidat', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('308', 'WCFA000029', 'Omolara Bello Iya', '0.50', '1.50', '3');
INSERT INTO `customer_credit` VALUES ('309', 'WCFA000034', 'Mama Kemi Oluwalana', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('310', 'WCFA000039', 'Fausat Adetunji', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('311', 'WCFA000042', 'Omolara Alamu', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('312', 'WCFA000045', 'Saidat Omotayo(Iya)', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('313', 'WCFA000046', 'Tale Morufat (Iya)', '0.00', '1408180.78', '1');
INSERT INTO `customer_credit` VALUES ('314', 'WCFA000047', 'Gbotie Makinde', '0.00', '1174913.32', '1');
INSERT INTO `customer_credit` VALUES ('315', 'WCFA000049', 'Jibola Aminu(Iya)', '1559031.74', '4677095.22', '3');
INSERT INTO `customer_credit` VALUES ('316', 'WCFA000052', 'Mujidat Adepegba', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('317', 'WCFA000054', 'Funmi Idowu', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('318', 'WCFA000055', 'Titi Alausa', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('319', 'WCFA000057', 'Tawakali Olisa', '0.00', '3723242.59', '1');
INSERT INTO `customer_credit` VALUES ('320', 'WCFA000058', 'Akeem Funmilayo', '580437.26', '1741311.78', '3');
INSERT INTO `customer_credit` VALUES ('321', 'WCFA000060', 'Onipanla Todun', '2765618.78', '8296856.34', '3');
INSERT INTO `customer_credit` VALUES ('322', 'WCFA000061', 'Salewa Stores', '127416043.60', '127416043.60', '1');
INSERT INTO `customer_credit` VALUES ('323', 'WCFA000071', 'Eskay Tajudeen', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('324', 'WCFA000073', 'Mutiyat Olawuwo', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('325', 'WCFA000074', 'Aderibigbe Jumoke', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('326', 'WCFA000075', 'Hammed Idowu', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('327', 'WCFA000082', 'Adelaja D.A', '1924896.50', '5774689.50', '3');
INSERT INTO `customer_credit` VALUES ('328', 'SWC0009', 'Arewa Toyin O.', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('329', 'SWC0086', 'Mrs Adeosun Funmilayo', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('330', 'SWC0934', 'Mrs Balikis Oseni (Iya Malik)', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('331', 'SWC1039', 'Alhaja Oniwiridi', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('332', 'SWC1886', 'Zino Stores', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('333', 'WCFA000088', 'Alfa Yahaya', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('334', 'WCFA000090', 'Musili Sanni Ramota', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('335', 'WCFA000091', 'Mumini Onikepe', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('336', 'WCFA000095', 'Iya Lukman', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('337', 'WCFA000096', 'Salimat Elejo', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('338', 'WCFA000097', 'Kikelomo Iman', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('339', 'WCFA000098', 'Rukayat Folorunsho', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('340', 'WCFA000099', 'Iya Kemi', '0.05', '0.15', '3');
INSERT INTO `customer_credit` VALUES ('341', 'WCFA000102', 'Iya Sadiat', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('342', 'WCFA000103', 'Alh Taiye', '568991.35', '1706974.05', '3');
INSERT INTO `customer_credit` VALUES ('343', 'WCFA000113', 'Alh Hamsat Sabitiyu', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('344', 'WCFA000116', 'Fausat Najeem', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('345', 'WCFA000672', 'Tajudeen Opeyemi (Iya Nofi)', '0.00', '3955824.21', '1');
INSERT INTO `customer_credit` VALUES ('346', 'CTAE0002', 'ALHAJI ABIODUN  BELLO', '932345.40', '2797036.20', '3');
INSERT INTO `customer_credit` VALUES ('347', 'CTAE0003', 'ALHAJI ADEYELE ADEPATE', '822784.12', '2468352.36', '3');
INSERT INTO `customer_credit` VALUES ('348', 'CTAE0006', 'MR AJAYI  AYINKE', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('349', 'CTAE0008', 'MRS ALABI LUKMAN', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('350', 'CTAE0013', 'AROWOLO TAIBAT', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('351', 'CTAE0017', 'BOLTIKAY NIG LIMITED', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('352', 'CTAE0018', 'DAYO OLAREWAJU ODEBODE', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('353', 'LAC3996', 'MR EDATOMOLA KAZEEM', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('354', 'CTAE0020', 'MR EDATOMOLA KAZEEM', '0.00', '107.50', '2');
INSERT INTO `customer_credit` VALUES ('355', 'CTAE0023', 'ALH. FOLU  F. OGUNDALU', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('356', 'CTAE0026', 'MR GANIYU YAHAYA', '13159773.65', '40194320.95', '3');
INSERT INTO `customer_credit` VALUES ('357', 'CTAE0031', 'ALH LUKMAN BELLO', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('358', 'CTAE0032', 'MR MADINAT  YUSUF', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('359', 'CTAE0037', 'MRS OKEKE FELICIA', '453946.68', '1361840.04', '3');
INSERT INTO `customer_credit` VALUES ('360', 'CTAE0041', 'Mattew Okonkwo', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('361', 'CTAE0042', 'MR R A IBRAHIM', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('362', 'CTAE0045', 'MRS SEMO & CO', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('363', 'CTAE0047', 'MR.  SEGUN ADEMOLA', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('364', 'CTAE0052', 'MR TOYOSI OSILAJA', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('365', 'CTAE0054', 'MESSRS YAKUBU AISHA', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('366', 'CTAE0058', 'Jakande Iya Samson', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('367', 'CTAE0064', 'Taofiq Yahaya', '201245.00', '603735.00', '3');
INSERT INTO `customer_credit` VALUES ('368', 'LAC0017', 'Abolaji Enterprises', '962691.12', '2888073.36', '3');
INSERT INTO `customer_credit` VALUES ('369', 'LAC0160', 'Mumuni Ibrahim', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('370', 'LAC0161', 'Blessed Kanayo', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('371', 'LAC3995', 'Marthy B', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('372', 'LAC0424', 'BANKOLE STORE', '327186.62', '981559.86', '3');
INSERT INTO `customer_credit` VALUES ('373', 'LAC0429', 'DAMTOY NIG LTD', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('374', 'LAC3987', 'Yahya Mutairu Rasheedat', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('375', 'LAC1419', 'Three Zeroes', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('376', 'LAC3504', 'Novtech Integrated Ltd', '2982159.75', '8946479.25', '3');
INSERT INTO `customer_credit` VALUES ('377', 'CTAF0319', 'Chinedu (Stores)', '1249581.31', '3748743.93', '3');
INSERT INTO `customer_credit` VALUES ('378', 'CTAW0001', 'LAWAL MOHAMMED', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('379', 'CTAW0002', 'CHIJIOKE ONU', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('380', 'CTAW0004', 'ALI GADO GARUBA', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('381', 'CTAW0006', 'FUNMILAYO SHITTU', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('382', 'CTAZ0001', 'TAIWO BASANYA', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('383', 'CTAZ0007', 'IYA BUNMI', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('384', 'CTAZ0008', 'SEGUN FUNMILAYO BABALOLA', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('385', 'CTAZ0035', 'OLOMO FUNMILOLA FAGBEMI', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('386', 'CTAZ0040', 'IYA HABEEB', '2410032.21', '7230096.63', '3');
INSERT INTO `customer_credit` VALUES ('387', 'CTAZ0043', 'JUNIOR (IYA)', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('388', 'CTAZ0044', 'KOFO THOMAS', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('389', 'CTAZ0045', 'SIKIRAT AGBOOLA', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('390', 'CTAZ0049', 'MRS BELLO', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('391', 'LAC0083', 'Sunday Ossai (Ojota)', '1433034.20', '4299102.60', '3');
INSERT INTO `customer_credit` VALUES ('392', 'LAC0085', 'Mrs Eze Ann', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('393', 'LAC0087', 'Ameh Amos Ifeanyichukwu', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('394', 'LAC0088', 'Sunday Adama (Ojota)', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('395', 'LAC0212', 'Mrs. Alade Tawakalitu', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('396', 'LAC0411', 'Sarafa Oladele', '1.00', '3.00', '3');
INSERT INTO `customer_credit` VALUES ('397', 'LAC2310', 'Opeloyeru Godsgift', '11863272.55', '35589817.65', '3');
INSERT INTO `customer_credit` VALUES ('398', 'LAC3508', 'Iya Zainab', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('399', 'CTAZ0010', 'ANISU SANYAOLU', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('400', 'WCFA000209', 'Iya Ibeji', '1385118.91', '4155356.73', '3');
INSERT INTO `customer_credit` VALUES ('401', 'LAC3860', 'Solid Venturee', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('402', 'CTAZ0023', 'MUINAT (IYA)', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('403', 'CTAZ0005', 'NURUDEEN (IYA)', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('404', 'CTAE0033', 'ALHAJA MOGBONJUBOLA OLANREWAJU', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('405', 'LAC3712', 'Alh. Idiat Olatunji - 2', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('406', 'NTC2395', 'Aminu Buba Baffa', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('407', 'SEC003622', 'ALOU ENTERPRISE', '4628589.00', '13885767.00', '3');
INSERT INTO `customer_credit` VALUES ('408', 'LAC3675', 'Holy water Universal', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('409', 'WCDA000068', 'Alh Abdul Mohammed', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('410', 'MBC003573', 'Adamu Usman', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('411', 'MBC003587', 'Ezedinbu Sam-Isamaco Ltd', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('412', 'SWC2850', 'Modester Ube', '0.00', '210310.20', '1');
INSERT INTO `customer_credit` VALUES ('413', 'SWC3120', 'Aliyu Aishat', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('414', 'SEC003795', 'Enojane Intergrated Ent.', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('415', 'SWC3226', 'Odofin Adekunle Global Limited', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('416', 'SEC003986', 'Elijah James Udoh', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('417', 'LAC4068', 'Ariwoayo Safiat', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('418', 'WCFA000080', 'Agaga Olayinka', '0.00', '0.00', '0');
INSERT INTO `customer_credit` VALUES ('419', 'LAC4043', 'Maurice Chibueze', '0.00', '0.00', '0');
INSERT INTO `dept` VALUES ('COMM_PA', 'Communication - Public Affairs', '');
INSERT INTO `dept` VALUES ('DONUTS', 'DONUTS', '');
INSERT INTO `dept` VALUES ('FACILITIES', 'Facilities - General Services', 'Dolapo.Onasanya@pernod-ricard.com');
INSERT INTO `dept` VALUES ('FINANCE', 'Finance', 'Gaetan.Magdelain@pernod-ricard.com');
INSERT INTO `dept` VALUES ('HR', 'Human Resources', 'Dolapo.Onasanya@pernod-ricard.com');
INSERT INTO `dept` VALUES ('IT', 'Information Systems & Technology', 'Gaetan.Magdelain@pernod-ricard.com');
INSERT INTO `dept` VALUES ('ITNL_SALES', 'International Sales', 'ikechukwu.agu@pernod-ricard.com');
INSERT INTO `dept` VALUES ('LEGAL', 'Legal', '');
INSERT INTO `dept` VALUES ('MAIN_STREA', 'MAINSTREAM', 'ikechukwu.agu@pernod-ricard.com');
INSERT INTO `dept` VALUES ('MGMT_STRAT', 'Management', 'Sola.Oke@pernod-ricard.com');
INSERT INTO `dept` VALUES ('MKTG', 'Marketing', 'Barene.Jankovich-Besan@pernod-ricard.com');
INSERT INTO `dept` VALUES ('ORANGIANA', 'ORANGIANA', 'Sola.Oke@pernod-ricard.com');
INSERT INTO `dept` VALUES ('OTHERS_DPT', 'Others departments in structure costs', 'Gaetan.Magdelain@pernod-ricard.com');
INSERT INTO `dept` VALUES ('TRADE_MKTG', 'Sales', 'ikechukwu.agu@pernod-ricard.com');
INSERT INTO `dept` VALUES ('SC', 'Supply Chain', 'Gaetan.Magdelain@pernod-ricard.com');
INSERT INTO `dept` VALUES ('TRADE_MKTG2', 'Trade Marketing', 'Barene.Jankovich-Besan@pernod-ricard.com');
INSERT INTO `groups` VALUES ('1', 'admin', 'Administrator');
INSERT INTO `groups` VALUES ('2', 'members', 'General User');
INSERT INTO `groups` VALUES ('3', 'web', 'Web User');
INSERT INTO `location` VALUES ('1', 'Abuja', 'Middle Belt');
INSERT INTO `location` VALUES ('2', 'Abuja 2', 'Middle Belt');
INSERT INTO `location` VALUES ('3', 'Jos', 'Middle Belt');
INSERT INTO `location` VALUES ('4', 'Kaduna', 'Middle Belt');
INSERT INTO `location` VALUES ('5', 'Kano', 'North');
INSERT INTO `location` VALUES ('6', 'Katsina', 'North');
INSERT INTO `location` VALUES ('7', 'Maiduguri', 'North');
INSERT INTO `location` VALUES ('8', 'Sokoto', 'North');
INSERT INTO `location` VALUES ('9', 'Benin', 'South East');
INSERT INTO `location` VALUES ('10', 'Calabar', 'South East');
INSERT INTO `location` VALUES ('11', 'Enugu', 'South East');
INSERT INTO `location` VALUES ('12', 'Makurdi', 'South East');
INSERT INTO `location` VALUES ('13', 'PH', 'South East');
INSERT INTO `location` VALUES ('14', 'Onitsha', 'South East');
INSERT INTO `location` VALUES ('15', 'Agege', 'South West');
INSERT INTO `location` VALUES ('16', 'Akure', 'South West');
INSERT INTO `location` VALUES ('17', 'Festac', 'South West');
INSERT INTO `location` VALUES ('18', 'Ibadan', 'South West');
INSERT INTO `location` VALUES ('19', 'Ilorin', 'South West');
INSERT INTO `location` VALUES ('20', 'Marina', 'South West');
INSERT INTO `location` VALUES ('21', 'Mushin', 'South West');
INSERT INTO `login_attempts` VALUES ('5', '::1', 'samuelo#nubiaville.com', '1636924332');
INSERT INTO `login_attempts` VALUES ('6', '::1', 'samuelo@nubiavillle.com', '1636924393');
INSERT INTO `region_credit_request` VALUES ('0bb92eb459', '997d3914ad', '2021-10-12 12:53:19', '91', 'RWS', '2021-10-01', 'attachments/0bb92eb459_creditfile_MB_Region_October_2021_Value_Max_Rural_Target_and_Credit_Deployment_Template_MBelt.xlsx', 'Middle Belt', 'Attached is the Target Split for RWS', 'Oct 2021', '2021-10-12 12:53:19');
INSERT INTO `region_credit_request` VALUES ('14b85aae3f', '19b51e30b8', '2021-10-12 12:52:16', '93', 'UWS', '2021-10-01', 'attachments/14b85aae3f_creditfile_SER_October_2021_Value_Max_Urban_Target_and_Credit_Deployment_Template.xlsx', 'South East', 'SER October 2021 Urban Target and Credit Deployment', 'Oct 2021', '2021-10-12 12:52:16');
INSERT INTO `region_credit_request` VALUES ('249c558d81', '19b51e30b8', '2021-10-12 12:52:16', '91', 'UWS', '2021-10-01', 'attachments/249c558d81_creditfile_MB_Region_October_2021_Value_Max_Urban_Target_and_Credit_Deployment_Template_MBelt.xlsx', 'Middle Belt', 'Attached is the Target & Credit Split for UWS', 'Oct 2021', '2021-10-12 12:52:16');
INSERT INTO `region_credit_request` VALUES ('2d7d24f4b1', '997d3914ad', '2021-10-12 12:53:19', '95', 'RWS', '2021-10-01', 'attachments/2d7d24f4b1_creditfile_SWR_-_October_2021_Value_Max_Rural_Target_and_Credit_Deployment.xlsx', 'South West', '', 'Oct 2021', '2021-10-12 12:53:19');
INSERT INTO `region_credit_request` VALUES ('4a97b6eb15', '19b51e30b8', '2021-10-12 12:52:15', '91', 'UWS', '2021-10-01', 'attachments/4a97b6eb15_creditfile_October_2021_Value_Max_Urban_Target_and_Credit_Deployment_Template_North.xlsx', 'North', 'Attached is the Target Split alongside Credit Deployment for UWS', 'Oct 2021', '2021-10-12 12:52:15');
INSERT INTO `region_credit_request` VALUES ('4ff21d44d3', '997d3914ad', '2021-10-12 12:53:19', '91', 'RWS', '2021-10-01', 'attachments/4ff21d44d3_creditfile_October_2021_Value_Max_Rural_Target_and_Credit_Deployment_Template_North.xlsx', 'North', 'Attached is the Target Split alongside Credit Deployment for RWS', 'Oct 2021', '2021-10-12 12:53:19');
INSERT INTO `region_credit_request` VALUES ('8fadcc5ab0', '997d3914ad', '2021-10-12 12:53:19', '93', 'RWS', '2021-10-01', 'attachments/8fadcc5ab0_creditfile_SER_October_2021_Value_Max_Rural_Target_and_Credit_Deployment_Template.xlsx', 'South East', 'Resending SER October 2021 Rural Target and Credit Deployment', 'Oct 2021', '2021-10-12 12:53:19');
INSERT INTO `region_credit_request` VALUES ('d7110ba278', '19b51e30b8', '2021-10-12 12:52:16', '95', 'UWS', '2021-10-01', 'attachments/d7110ba278_creditfile_October_2021_Value_Max_Urban_Target_and_Credit_Deployment_SWR.xlsx', 'South West', '', 'Oct 2021', '2021-10-12 12:52:16');
INSERT INTO `request_approvers` VALUES ('44', '121', '8fadcc5ab0', '29', '1', '94', 'RM South East', '');
INSERT INTO `request_approvers` VALUES ('45', '122', '8fadcc5ab0', '29', '2', '25', 'Wholesale Mgr', '');
INSERT INTO `request_approvers` VALUES ('47', '121', '14b85aae3f', '29', '1', '94', 'RM South East', '');
INSERT INTO `request_approvers` VALUES ('48', '122', '14b85aae3f', '29', '2', '25', 'Wholesale Mgr', '');
INSERT INTO `request_approvers` VALUES ('50', '117', '4ff21d44d3', '28', '1', '92', 'RM North', '');
INSERT INTO `request_approvers` VALUES ('51', '118', '4ff21d44d3', '28', '2', '25', 'Wholesale Mgr', '');
INSERT INTO `request_approvers` VALUES ('53', '117', '4a97b6eb15', '28', '1', '92', 'RM North', '');
INSERT INTO `request_approvers` VALUES ('54', '118', '4a97b6eb15', '28', '2', '25', 'Wholesale Mgr', '');
INSERT INTO `request_approvers` VALUES ('56', '119', '249c558d81', '31', '1', '97', 'RM Middle Belt', '');
INSERT INTO `request_approvers` VALUES ('57', '120', '249c558d81', '31', '2', '25', 'Wholesale Mgr', '');
INSERT INTO `request_approvers` VALUES ('59', '119', '0bb92eb459', '31', '1', '97', 'RM Middle Belt', '');
INSERT INTO `request_approvers` VALUES ('60', '120', '0bb92eb459', '31', '2', '25', 'Wholesale Mgr', '');
INSERT INTO `request_approvers` VALUES ('61', '123', '2d7d24f4b1', '30', '1', '96', 'RM South West', '');
INSERT INTO `request_approvers` VALUES ('62', '124', '2d7d24f4b1', '30', '2', '25', 'Wholesale Mgr', '');
INSERT INTO `request_approvers` VALUES ('64', '123', 'd7110ba278', '30', '1', '96', 'RM South West', '');
INSERT INTO `request_approvers` VALUES ('65', '124', 'd7110ba278', '30', '2', '25', 'Wholesale Mgr', '');
INSERT INTO `request_approvers` VALUES ('67', '113', '94bf7682d1', '25', '1', '25', 'Approver 1', '');
INSERT INTO `request_approvers` VALUES ('68', '114', '94bf7682d1', '25', '2', '2', 'Approver 2', '');
INSERT INTO `request_approvers` VALUES ('69', '115', '94bf7682d1', '25', '3', '26', 'Approver 3', '');
INSERT INTO `request_approvers` VALUES ('70', '116', '94bf7682d1', '25', '4', '1', 'Approver 4', '');
INSERT INTO `request_approvers` VALUES ('76', '13', '997d3914ad', '27', '1', '98', 'Head Channel BD', '');
INSERT INTO `request_approvers` VALUES ('77', '14', '997d3914ad', '27', '2', '99', 'Head TM&D', '');
INSERT INTO `setup_credit` VALUES ('21', 'Middle Belt', '0.22', '5676.87', '944763222.54', '45546425.95', '899216796.59', 'UWS', '2021-09-01');
INSERT INTO `setup_credit` VALUES ('22', 'South East', '0.30', '8084.07', '1301196620.14', '20680607.35', '1280516012.79', 'UWS', '2021-09-01');
INSERT INTO `setup_credit` VALUES ('23', 'South West', '0.28', '6887.42', '1189542784.75', '98574887.12', '1090967897.63', 'UWS', '2021-09-01');
INSERT INTO `setup_credit` VALUES ('24', 'North', '0.20', '5325.98', '858875656.86', '15240305.17', '843635351.69', 'UWS', '2021-09-01');
INSERT INTO `setup_credit` VALUES ('25', 'Total', '1.00', '25974.34', '4294378284.29', '180042225.59', '4114336058.70', 'UWS', '2021-09-01');
INSERT INTO `setup_credit` VALUES ('26', 'Middle Belt', '0.22', '761.92', '129181122.37', '8493096.68', '120688025.69', 'RWS', '2021-09-01');
INSERT INTO `setup_credit` VALUES ('27', 'South East', '0.32', '1140.27', '187899814.35', '7280953.19', '180618861.16', 'RWS', '2021-09-01');
INSERT INTO `setup_credit` VALUES ('28', 'South West', '0.34', '1223.42', '199643552.75', '5853661.78', '193789890.97', 'RWS', '2021-09-01');
INSERT INTO `setup_credit` VALUES ('29', 'North', '0.12', '431.90', '70462430.38', '2049858.12', '68412572.26', 'RWS', '2021-09-01');
INSERT INTO `setup_credit` VALUES ('30', 'Total', '1.00', '3557.51', '587186919.84', '23677569.77', '563509350.07', 'RWS', '2021-09-01');
INSERT INTO `setup_credit` VALUES ('31', 'Middle Belt', '0.22', '5790.54', '974466730.78', '163791471.41', '810675259.37', 'UWS', '2021-10-01');
INSERT INTO `setup_credit` VALUES ('32', 'South East', '0.30', '9101.58', '1328818269.24', '54597744.08', '1274220525.16', 'UWS', '2021-10-01');
INSERT INTO `setup_credit` VALUES ('33', 'South West', '0.28', '6840.10', '1240230384.62', '282616920.18', '957613464.44', 'UWS', '2021-10-01');
INSERT INTO `setup_credit` VALUES ('34', 'North', '0.20', '6265.40', '885878846.16', '8722442.58', '877156403.58', 'UWS', '2021-10-01');
INSERT INTO `setup_credit` VALUES ('35', 'Total', '0.00', '27997.61', '4429394230.80', '509728578.25', '3919665652.55', 'UWS', '2021-10-01');
INSERT INTO `setup_credit` VALUES ('36', 'Middle Belt', '0.22', '890.84', '133118796.59', '8401547.21', '124717249.38', 'RWS', '2021-10-01');
INSERT INTO `setup_credit` VALUES ('37', 'South East', '0.32', '1307.42', '193627340.50', '10588447.77', '183038892.73', 'RWS', '2021-10-01');
INSERT INTO `setup_credit` VALUES ('38', 'South West', '0.34', '1356.53', '205729049.28', '15815333.84', '189913715.44', 'RWS', '2021-10-01');
INSERT INTO `setup_credit` VALUES ('39', 'North', '0.12', '506.23', '72610252.69', '1737359.13', '70872893.56', 'RWS', '2021-10-01');
INSERT INTO `setup_credit` VALUES ('40', 'Total', '0.00', '4061.02', '605085439.06', '36542687.95', '568542751.11', 'RWS', '2021-10-01');
INSERT INTO `setup_parameters` VALUES ('1', 'Customer Type', 'RWS\r\nUWS');
INSERT INTO `setup_parameters` VALUES ('2', 'Region', 'North\r\nMiddle Belt\r\nSouth East\r\nSouth West');
INSERT INTO `setup_parameters` VALUES ('3', 'Current Month', '2021-10-01');
INSERT INTO `setup_parameters` VALUES ('6', 'North', '91');
INSERT INTO `setup_parameters` VALUES ('7', 'South East', '93');
INSERT INTO `setup_parameters` VALUES ('8', 'South West', '95');
INSERT INTO `setup_parameters` VALUES ('9', 'Middle Belt', '91');
INSERT INTO `users` VALUES ('1', '127.0.0.1', 'administrator', '$2y$10$30.45D6Xqrn2KkwBgVF8YO9hzyi2HMR.9bdYpKB8GCLYX/12ToW.S', '', 'samuelo@nubiaville.com', null, null, '', null, null, null, null, null, '1268889823', '1636960044', '1', 'Samuel', 'Obe', 'Samuel Obe', null, null, null, '234-8052067585', 'Consultant', 'Admin', 'Nigeria');
INSERT INTO `users` VALUES ('2', '::1', 'eeed0bd874', '$2y$08$D3aU47asHUaJgLaVeD3q9uQn60wP.6O1rhpnVl9q.qS1Cae9gDtW6', null, 'Olusola_Chukwura@bat.com', null, null, null, null, 'JoszMvAQ7A.rxxldlYmwi.78a385688aa3d78d37', '1487856653', null, 'LuGYPZpD7SdruHXez/2bj.', '1471288595', '1629293329', '1', 'Olusola', 'Chukwura', 'Olusola Chukwura', null, null, null, '', 'Customer Development Executive (Wholesale)', 'Initiator', 'Nigeria');
INSERT INTO `users` VALUES ('25', '197.242.108.160', 'dd8f6e0068', '$2y$08$xIpKTDlOYsvWZI3uvZleNeNnjRH0tSh69hsbQ.34Jfm7QWYM8Va62', null, 'Sandra_Njaka@bat.com', null, null, null, null, null, null, null, null, '1478092580', '1636888246', '1', 'Sandra', 'Njaka', 'Sandra Njaka', null, null, null, '234-7046002160', 'Marketing Finance Executive', 'Approver', 'Nigeria');
INSERT INTO `users` VALUES ('26', '197.242.108.160', 'b4357cf294', '$2y$08$Eb3KdWOtsON3u82Pn/a.eOI6cptUjj0u0124OjpVMTh5aHCBft1Hy', null, 'it_support@bat.com', null, null, null, null, null, null, null, 'T4X66.aLAe1MNtU46lIMVO', '1478092679', '1629242883', '1', 'IT', 'Support', 'IT Support', null, null, null, '', 'IT Support', 'Admin', 'WCA');
INSERT INTO `users` VALUES ('30', '::1', '709cd862df', '$2y$08$Eb3KdWOtsON3u82Pn/a.eOI6cptUjj0u0124OjpVMTh5aHCBft1Hy', null, 'abraham_ngami@bat.com', null, null, null, null, null, null, null, '13/MO1cMvou6irQO1UKhdu', '1487841064', '1629106106', '1', 'Abraham', 'Ngami', 'Abraham Ngami', null, null, null, '233-544334872', 'Approver', 'Approver', 'Nigeria');
INSERT INTO `users` VALUES ('31', '::1', 'a8bf652476', '$2y$08$Eb3KdWOtsON3u82Pn/a.eOI6cptUjj0u0124OjpVMTh5aHCBft1Hy', null, 'Adesegun_Orafidiya@bat.com', null, null, null, null, null, null, null, null, '1487841065', null, '1', 'Adesegun', 'Orafidiya', 'Adesegun Orafidiya', null, null, null, '233-544343630', 'ASM-North', 'Approver', 'Nigeria');
INSERT INTO `users` VALUES ('69', '10.131.248.145', 'f0eeba1a25', '$2y$08$Eb3KdWOtsON3u82Pn/a.eOI6cptUjj0u0124OjpVMTh5aHCBft1Hy', null, 'bisayo_lawal@bat.com', null, null, null, null, null, null, null, 'NvLaIV7cz6r5IiO.LgyJ0.', '1550152539', '1633536686', '1', 'Bisayo', 'Lawal', 'Bisayo Lawal', null, null, null, '', 'RTMDM Middle Belt', 'Approver', 'Nigeria');
INSERT INTO `users` VALUES ('78', '10.17.194.47', 'f5b7c507b3', '$2y$08$Eb3KdWOtsON3u82Pn/a.eOI6cptUjj0u0124OjpVMTh5aHCBft1Hy', null, 'Olakunle_Ogedengbe@bat.com', null, null, null, null, null, null, null, '2JmGHskvQpgrce8dFJ6Fqu', '1580060315', '1633714084', '1', 'Olakunle', 'Ogedengbe', 'Olakunle Ogedengbe', null, null, null, '', 'System Admin', 'Admin', 'Nigeria');
INSERT INTO `users` VALUES ('80', '10.20.115.152', 'b1ae1f8b66', '$2y$08$Eb3KdWOtsON3u82Pn/a.eOI6cptUjj0u0124OjpVMTh5aHCBft1Hy', null, 'kayode_moriwawon@bat.com', null, null, null, null, 'igC5K.K.DwbmPH07Q2kaZO17f2d56d11c31d35eb', '1633520156', null, '/ZKlv9FshgJpf95N3mSpI.', '1589977860', '1634742181', '1', 'Kayode', 'Moriwawon', 'Kayode Moriwawon', null, null, null, '', 'System Admin', 'Admin', 'Nigeria');
INSERT INTO `users` VALUES ('84', '10.17.194.99', '1668a66cf0', '$2y$08$Eb3KdWOtsON3u82Pn/a.eOI6cptUjj0u0124OjpVMTh5aHCBft1Hy', null, 'motunrayo_ademulegun@bat.com', null, null, null, null, 'wN00FGWNZ-8aOREAeerNe05286368c972faf420', '1633533789', null, 'p0ZGee4CvBGVOTaszxKDCu', '1614939781', '1633533941', '1', 'Motunrayo', 'Ademulegun', 'Motunrayo Ademulegun', null, null, null, '', 'RTMDM South West', 'Approver', 'Nigeria');
INSERT INTO `users` VALUES ('91', '10.17.203.54', '0071e850ba', '$2y$08$jGJBqbpaB/hFr.Yp3yCSRe/8s1C5IN/kOgULQMlDroTdasPvs8x9y', null, 'dauda_abdulmalik@bat.com', null, 'Regional TMDM (North', null, null, null, null, null, 'D9K51AtCMsVatS1LWqYN4O', '1633691991', '1636540828', '1', 'Dauda', 'Abdulmalik', 'Dauda Abdulmalik', null, 'Marketing', 'Sandra Njaka', null, 'Dauda Abdulmalik', 'User', 'geria');
INSERT INTO `users` VALUES ('92', '10.17.203.54', 'de53f3f1c3', '$2y$08$uQmackUq.DANOpkKTYDKdebOVqNl2nrG5DOH4szQaJ9xpDetRZNhO', null, 'BAKO_DANAUTA@bat.com', null, 'Regional Mgr (North)', null, null, null, null, null, null, '1633691991', '1635172099', '1', 'Bako', 'Dan Auta', 'Bako Dan Auta', null, 'Marketing', 'Sandra Njaka', null, 'Bako Dan Auta', 'User', 'geria');
INSERT INTO `users` VALUES ('93', '10.17.203.54', '78b41a06b7', '$2y$08$GO6zE0NFc.5O5JjzAHU4y.EghF/x4K8X4elNanH.jOywCKD0XPHPC', null, 'Cosmas_Anyikwa@bat.com', null, 'Regional TMDM (South', null, null, null, null, null, '9XmFrp.mMPwihEYoPfjVae', '1633691991', '1635781847', '1', 'Cosmas', 'Anyikwa', 'Cosmas Anyikwa', null, 'Marketing', 'Sandra Njaka', null, 'Cosmas Anyikwa', 'User', 'geria');
INSERT INTO `users` VALUES ('94', '10.17.203.54', '85c2cb3736', '$2y$08$uQmackUq.DANOpkKTYDKdebOVqNl2nrG5DOH4szQaJ9xpDetRZNhO', null, 'henry_eze@bat.com', null, 'Regional Mgr (South ', null, null, null, null, null, 'SvIeWwLtTBEA6QyuTZiRbu', '1633691991', '1635246112', '1', 'Henry', 'Eze', 'Henry Eze', null, 'Marketing', 'Sandra Njaka', null, 'Henry Eze', 'User', 'geria');
INSERT INTO `users` VALUES ('95', '10.17.203.54', 'd4c4569b7c', '$2y$08$pK7pJ.fcfJ0Qf4KCAQLFp.bWtkb6kiwjUII4Oau8T1hAGUmnDLIH.', null, 'Olayiwola_Daramola@bat.com', null, 'Regional TMDM (South', null, null, null, null, null, 'omzG1K9Es9eFdVEBjW0gYu', '1633691991', '1635231839', '1', 'Daramola', 'Olayiwola', 'Daramola Olayiwola', null, 'Marketing', 'Sandra Njaka', null, 'Daramola Olayiwola', 'User', 'geria');
INSERT INTO `users` VALUES ('96', '10.17.203.54', '17ce7e802b', '$2y$08$4EFfWIaMAPK7ApJZ3Io1x.SZpUEL522TqNRippy7glq1RTIjU5L6q', null, 'Victoria_Olorunfemi@bat.com', null, 'Regional Mgr (South ', null, null, null, null, null, 'ox6CARfa4A3GymIiESiXMO', '1633691991', '1634568332', '1', 'Victoria', 'Olorunfemi', 'Victoria Olorunfemi', null, 'Marketing', 'Sandra Njaka', null, 'Victoria Olorunfemi', 'User', 'geria');
INSERT INTO `users` VALUES ('97', '10.17.203.54', 'f0ebba22e2', '$2y$08$.9hR803D27irvbd3ihj4nOFm3aVnZ4yvXGq9uvSU8zw83siHWXu56', null, 'Chris_Onwusi@bat.com', null, 'Regional TMDM (Middl', null, null, null, null, null, null, '1633691991', '1634550228', '1', 'Chris', 'Onwusi', 'Chris Onwusi', null, 'Marketing', 'Sandra Njaka', null, 'Chris Onwusi', 'User', 'geria');
INSERT INTO `users` VALUES ('98', '10.17.203.34', '80cd5e8022', '$2y$08$rkocJxYJxSDD35E49sy4XOc.A6BZgsy..qxLib9hkRzo5oCaclmtW', null, 'Kikelomo_Fisayo-Okusanya@bat.com', null, 'Marketing', null, null, null, null, null, null, '1635246493', '1636903805', '1', 'Kikelomo', 'Fisayo-Okusanya', 'Kikelomo Fisayo-Okusanya', null, 'Olakunle Ogedengbe', 'Olakunle_Ogedengbe@bat.com', null, 'Head Chanel BD', 'User', 'geria');
INSERT INTO `users` VALUES ('99', '10.17.203.34', '9188a598a7', '$2y$08$p.FeEWTs5/v2iYs5UJpuyu6iasrEE/NcG.AvAYmHwqwyZBjxniWnq', null, 'OPEYEMI_DAIRO@BAT.COM', null, 'Marketing', null, null, null, null, null, null, '1635246611', null, '1', 'Opeyemi', 'Dairo', 'Opeyemi Dairo', null, 'Olakunle Ogedengbe', 'Olakunle_Ogedengbe@bat.com', null, 'Head TM&D', 'User', 'geria');
INSERT INTO `users_groups` VALUES ('1', '25', '2');
INSERT INTO `users_groups` VALUES ('2', '25', '3');
INSERT INTO `users_groups` VALUES ('3', '26', '2');
INSERT INTO `users_groups` VALUES ('4', '26', '3');
INSERT INTO `users_groups` VALUES ('11', '30', '2');
INSERT INTO `users_groups` VALUES ('12', '30', '3');
INSERT INTO `users_groups` VALUES ('13', '31', '2');
INSERT INTO `users_groups` VALUES ('14', '31', '3');
INSERT INTO `users_groups` VALUES ('90', '69', '2');
INSERT INTO `users_groups` VALUES ('91', '69', '3');
INSERT INTO `users_groups` VALUES ('108', '78', '2');
INSERT INTO `users_groups` VALUES ('109', '78', '3');
INSERT INTO `users_groups` VALUES ('112', '80', '2');
INSERT INTO `users_groups` VALUES ('113', '80', '3');
INSERT INTO `users_groups` VALUES ('120', '84', '2');
INSERT INTO `users_groups` VALUES ('121', '84', '3');
INSERT INTO `users_groups` VALUES ('134', '91', '2');
INSERT INTO `users_groups` VALUES ('135', '91', '3');
INSERT INTO `users_groups` VALUES ('136', '92', '2');
INSERT INTO `users_groups` VALUES ('137', '92', '3');
INSERT INTO `users_groups` VALUES ('138', '93', '2');
INSERT INTO `users_groups` VALUES ('139', '93', '3');
INSERT INTO `users_groups` VALUES ('140', '94', '2');
INSERT INTO `users_groups` VALUES ('141', '94', '3');
INSERT INTO `users_groups` VALUES ('142', '95', '2');
INSERT INTO `users_groups` VALUES ('143', '95', '3');
INSERT INTO `users_groups` VALUES ('144', '96', '2');
INSERT INTO `users_groups` VALUES ('145', '96', '3');
INSERT INTO `users_groups` VALUES ('146', '97', '2');
INSERT INTO `users_groups` VALUES ('147', '97', '3');
INSERT INTO `users_groups` VALUES ('148', '98', '2');
INSERT INTO `users_groups` VALUES ('149', '98', '3');
INSERT INTO `users_groups` VALUES ('150', '99', '2');
INSERT INTO `users_groups` VALUES ('151', '99', '3');
INSERT INTO `workflow` VALUES ('25', 'request_add_credit', 'Additional Credit Request', 'request_add_credit', 'request_add_credit', 'credit_add_request', '3', 'Do Nothing', '', '', 'complete', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `workflow` VALUES ('27', 'request_credit', 'Standard Credit Request', 'request_credit', 'request_credit', 'credit_request', '3', 'Do Nothing', '', '', 'complete', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `workflow` VALUES ('28', 'request_region_north', 'Regional Credit Details North', 'request_region_credit', 'request_region_credit', 'region_credit_request', '3', 'Do Nothing', '', '', 'complete', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `workflow` VALUES ('29', 'request_region_southeast', 'Regional Credit Details South East', 'request_region_credit', 'request_region_credit', 'region_credit_request', '3', 'Do Nothing', '', '', 'complete', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `workflow` VALUES ('30', 'request_region_southwest', 'Regional Credit Details South West', 'request_region_credit', 'request_region_credit', 'region_credit_request', '3', 'Do Nothing', '', '', 'complete', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `workflow` VALUES ('31', 'request_region_middlebelt', 'Regional Credit Details Middle Belt', 'request_region_credit', 'request_region_credit', 'region_credit_request', '3', 'Do Nothing', '', '', 'complete', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `workflow_approvers` VALUES ('13', '27', '1', 'Approver', '98', 'Head Channel BD', '', '');
INSERT INTO `workflow_approvers` VALUES ('14', '27', '2', 'Approver', '99', 'Head TM&D', '', '');
INSERT INTO `workflow_approvers` VALUES ('113', '25', '1', 'Approver', '25', 'Approver 1', '', '');
INSERT INTO `workflow_approvers` VALUES ('114', '25', '2', 'Approver', '2', 'Approver 2', '', '');
INSERT INTO `workflow_approvers` VALUES ('115', '25', '3', 'Approver', '26', 'Approver 3', '', '');
INSERT INTO `workflow_approvers` VALUES ('116', '25', '4', 'Approver', '1', 'Approver 4', '', '');
INSERT INTO `workflow_approvers` VALUES ('117', '28', '1', 'Approver', '92', 'RM North', '', '');
INSERT INTO `workflow_approvers` VALUES ('118', '28', '2', 'Approver', '25', 'Wholesale Mgr', '', '');
INSERT INTO `workflow_approvers` VALUES ('119', '31', '1', 'Approver', '97', 'RM Middle Belt', '', '');
INSERT INTO `workflow_approvers` VALUES ('120', '31', '2', 'Approver', '25', 'Wholesale Mgr', '', '');
INSERT INTO `workflow_approvers` VALUES ('121', '29', '1', 'Approver', '94', 'RM South East', '', '');
INSERT INTO `workflow_approvers` VALUES ('122', '29', '2', 'Approver', '25', 'Wholesale Mgr', '', '');
INSERT INTO `workflow_approvers` VALUES ('123', '30', '1', 'Approver', '96', 'RM South West', '', '');
INSERT INTO `workflow_approvers` VALUES ('124', '30', '2', 'Approver', '25', 'Wholesale Mgr', '', '');
INSERT INTO `workflow_history` VALUES ('39', '8fadcc5ab0', '93', 'Cosmas Anyikwa', 'Initiator', null, 'Submitted <br/>(Initiator)', 'Request submitted - Awaiting Approval', '2021-10-13 11:21:37', '94', 'Henry Eze (RM South East)');
INSERT INTO `workflow_history` VALUES ('40', '14b85aae3f', '93', 'Cosmas Anyikwa', 'Initiator', null, 'Submitted <br/>(Initiator)', 'Request submitted - Awaiting Approval', '2021-10-13 11:24:13', '94', 'Henry Eze (RM South East)');
INSERT INTO `workflow_history` VALUES ('41', '8fadcc5ab0', '94', 'Henry Eze', 'RM South East', null, 'Returned', 'Information not complete. There are no monetary values except target. No credit on the credit part', '2021-10-13 14:57:25', '93', 'Cosmas Anyikwa (Initiator)');
INSERT INTO `workflow_history` VALUES ('42', '8fadcc5ab0', '93', 'Cosmas Anyikwa', 'Initiator', null, 'Re-submitted<br/>(Initiator)', '', '2021-10-14 10:48:40', '94', 'Henry Eze (RM South East)');
INSERT INTO `workflow_history` VALUES ('43', '4ff21d44d3', '91', 'Dauda Abdulmalik', 'Initiator', null, 'Submitted <br/>(Initiator)', 'Request submitted - Awaiting Approval', '2021-10-15 11:50:19', '92', 'Bako Dan Auta (RM North)');
INSERT INTO `workflow_history` VALUES ('44', '4a97b6eb15', '91', 'Dauda Abdulmalik', 'Initiator', null, 'Submitted <br/>(Initiator)', 'Request submitted - Awaiting Approval', '2021-10-15 11:51:00', '92', 'Bako Dan Auta (RM North)');
INSERT INTO `workflow_history` VALUES ('45', '249c558d81', '91', 'Dauda Abdulmalik', 'Initiator', null, 'Submitted <br/>(Initiator)', 'Request submitted - Awaiting Approval', '2021-10-15 12:01:55', '97', 'Chris Onwusi (RM Middle Belt)');
INSERT INTO `workflow_history` VALUES ('46', '0bb92eb459', '91', 'Dauda Abdulmalik', 'Initiator', null, 'Submitted <br/>(Initiator)', 'Request submitted - Awaiting Approval', '2021-10-15 12:03:40', '97', 'Chris Onwusi (RM Middle Belt)');
INSERT INTO `workflow_history` VALUES ('47', '0bb92eb459', '97', 'Chris Onwusi', 'RM Middle Belt', null, 'Approved', 'Approved', '2021-10-18 10:45:17', '25', 'Sandra Njaka (Wholesale Mgr)');
INSERT INTO `workflow_history` VALUES ('48', '2d7d24f4b1', '95', 'Daramola Olayiwola', 'Initiator', null, 'Submitted <br/>(Initiator)', 'Request submitted - Awaiting Approval', '2021-10-18 10:45:33', '96', 'Victoria Olorunfemi (RM South West)');
INSERT INTO `workflow_history` VALUES ('49', '249c558d81', '97', 'Chris Onwusi', 'RM Middle Belt', null, 'Approved', 'Approved', '2021-10-18 10:45:38', '25', 'Sandra Njaka (Wholesale Mgr)');
INSERT INTO `workflow_history` VALUES ('50', '0bb92eb459', '25', 'Sandra Njaka', 'Wholesale Mgr', null, 'Approval complete', 'Approved for testing', '2021-10-18 10:48:36', null, '');
INSERT INTO `workflow_history` VALUES ('51', '249c558d81', '25', 'Sandra Njaka', 'Wholesale Mgr', null, 'Approval complete', 'Approved for testing', '2021-10-18 10:48:54', null, '');
INSERT INTO `workflow_history` VALUES ('52', 'd7110ba278', '95', 'Daramola Olayiwola', 'Initiator', null, 'Submitted <br/>(Initiator)', 'Request submitted - Awaiting Approval', '2021-10-18 11:57:16', '96', 'Victoria Olorunfemi (RM South West)');
INSERT INTO `workflow_history` VALUES ('53', '2d7d24f4b1', '96', 'Victoria Olorunfemi', 'RM South West', null, 'Approved', 'Approved', '2021-10-18 14:00:11', '25', 'Sandra Njaka (Wholesale Mgr)');
INSERT INTO `workflow_history` VALUES ('54', 'd7110ba278', '96', 'Victoria Olorunfemi', 'RM South West', null, 'Approved', 'Approved', '2021-10-18 14:00:29', '25', 'Sandra Njaka (Wholesale Mgr)');
INSERT INTO `workflow_history` VALUES ('55', '2d7d24f4b1', '25', 'Sandra Njaka', 'Wholesale Mgr', null, 'Approval complete', 'approved for testing', '2021-10-18 14:19:46', null, '');
INSERT INTO `workflow_history` VALUES ('56', '4a97b6eb15', '92', 'Bako Dan Auta', 'RM North', null, 'Approved', 'all good here. Approved by Sam', '2021-10-25 15:28:46', '25', 'Sandra Njaka (Wholesale Mgr)');
INSERT INTO `workflow_history` VALUES ('57', '4ff21d44d3', '92', 'Bako Dan Auta', 'RM North', null, 'Approved', 'all good here. Approved by Sam', '2021-10-25 15:28:57', '25', 'Sandra Njaka (Wholesale Mgr)');
INSERT INTO `workflow_history` VALUES ('58', '4ff21d44d3', '25', 'Sandra Njaka', 'Wholesale Mgr', null, 'Approval complete', 'Approved for test', '2021-10-26 07:49:46', null, '');
INSERT INTO `workflow_history` VALUES ('59', 'd7110ba278', '25', 'Sandra Njaka', 'Wholesale Mgr', null, 'Approval complete', 'Approved for test', '2021-10-26 07:50:39', null, '');
INSERT INTO `workflow_history` VALUES ('60', '4a97b6eb15', '25', 'Sandra Njaka', 'Wholesale Mgr', null, 'Approval complete', 'Approved for test', '2021-10-26 07:51:01', null, '');
INSERT INTO `workflow_history` VALUES ('61', '8fadcc5ab0', '94', 'Henry Eze', 'RM South East', null, 'Approved', 'Approval Done by Sam.', '2021-10-26 12:11:45', '25', 'Sandra Njaka (Wholesale Mgr)');
INSERT INTO `workflow_history` VALUES ('62', '14b85aae3f', '94', 'Henry Eze', 'RM South East', null, 'Approved', 'Approval Done by Sam.', '2021-10-26 12:12:01', '25', 'Sandra Njaka (Wholesale Mgr)');
INSERT INTO `workflow_history` VALUES ('63', '8fadcc5ab0', '25', 'Sandra Njaka', 'Wholesale Mgr', null, 'Approval complete', 'approved for test', '2021-10-27 16:55:43', null, '');
INSERT INTO `workflow_history` VALUES ('64', '14b85aae3f', '25', 'Sandra Njaka', 'Wholesale Mgr', null, 'Approval complete', 'approved for test', '2021-10-27 16:56:00', null, '');
INSERT INTO `workflow_history` VALUES ('65', '94bf7682d1', '93', 'Cosmas Anyikwa', 'Initiator', null, 'Submitted <br/>(Initiator)', 'Request submitted - Awaiting Approval', '2021-11-01 16:53:59', '25', 'Sandra Njaka (Approver 1)');
INSERT INTO `workflow_history` VALUES ('66', '94bf7682d1', '25', 'Sandra Njaka', 'Approver 1', null, 'Returned', 'Please explore reallocation for now', '2021-11-01 17:40:08', '93', 'Cosmas Anyikwa (Initiator)');
INSERT INTO `workflow_history` VALUES ('69', '997d3914ad', '25', 'Sandra Njaka', 'Initiator', null, 'Submitted <br/>(Initiator)', 'Request submitted - Awaiting Approval', '2021-11-14 16:14:59', '98', 'Kikelomo Fisayo-Okusanya (Head Channel BD)');
INSERT INTO `workflow_requests` VALUES ('0bb92eb459', 'request_region_middlebelt', 'RWS', 'Oct 2021', '2021-10-01', 'Attached is the Target Split for RWS', '31', '2021-10-12 12:53:19', '91', 'Approved', '3', '0', '', '', '0.00', '2021-10-15 12:03:40');
INSERT INTO `workflow_requests` VALUES ('14b85aae3f', 'request_region_southeast', 'UWS', 'Oct 2021', '2021-10-01', 'SER October 2021 Urban Target and Credit Deployment', '29', '2021-10-12 12:52:16', '93', 'Approved', '3', '0', '', '', '0.00', '2021-10-13 11:24:13');
INSERT INTO `workflow_requests` VALUES ('19b51e30b8', 'request_credit', 'UWS', 'Oct 2021', '2021-10-01', 'Live version for Oct 2021', '27', '2021-10-12 12:51:55', '25', 'Submitted', '0', '0', '', '', '0.00', '0000-00-00 00:00:00');
INSERT INTO `workflow_requests` VALUES ('249c558d81', 'request_region_middlebelt', 'UWS', 'Oct 2021', '2021-10-01', 'Attached is the Target & Credit Split for UWS', '31', '2021-10-12 12:52:16', '91', 'Approved', '3', '0', '', '', '0.00', '2021-10-15 12:01:55');
INSERT INTO `workflow_requests` VALUES ('2d7d24f4b1', 'request_region_southwest', 'RWS', 'Oct 2021', '2021-10-01', '', '30', '2021-10-12 12:53:19', '95', 'Approved', '3', '0', '', '', '0.00', '2021-10-18 10:45:33');
INSERT INTO `workflow_requests` VALUES ('3bc6ae3915', 'request_region_middlebelt', 'RWS', 'Oct 2021', '2021-10-01', '', '31', '2021-11-12 15:40:01', '91', 'New', '0', '0', '', '', '0.00', '0000-00-00 00:00:00');
INSERT INTO `workflow_requests` VALUES ('3f2e37104b', 'request_region_southeast', 'RWS', 'Oct 2021', '2021-10-01', '', '29', '2021-11-12 15:40:01', '93', 'New', '0', '0', '', '', '0.00', '0000-00-00 00:00:00');
INSERT INTO `workflow_requests` VALUES ('4a97b6eb15', 'request_region_north', 'UWS', 'Oct 2021', '2021-10-01', 'Attached is the Target Split alongside Credit Deployment for UWS', '28', '2021-10-12 12:52:15', '91', 'Approved', '3', '0', '', '', '0.00', '2021-10-15 11:51:00');
INSERT INTO `workflow_requests` VALUES ('4ff21d44d3', 'request_region_north', 'RWS', 'Oct 2021', '2021-10-01', 'Attached is the Target Split alongside Credit Deployment for RWS', '28', '2021-10-12 12:53:19', '91', 'Approved', '3', '0', '', '', '0.00', '2021-10-15 11:50:19');
INSERT INTO `workflow_requests` VALUES ('8fadcc5ab0', 'request_region_southeast', 'RWS', 'Oct 2021', '2021-10-01', 'Resending SER October 2021 Rural Target and Credit Deployment', '29', '2021-10-12 12:53:19', '93', 'Approved', '3', '0', '', '', '0.00', '2021-10-13 11:21:37');
INSERT INTO `workflow_requests` VALUES ('925fade077', 'request_region_north', 'RWS', 'Oct 2021', '2021-10-01', '', '28', '2021-11-12 15:40:01', '91', 'New', '0', '0', '', '', '0.00', '0000-00-00 00:00:00');
INSERT INTO `workflow_requests` VALUES ('94bf7682d1', 'request_add_credit', 'RWS', 'Oct 2021', '2021-10-01', 'Additional Credit Request for SER RWS', '25', '2021-11-01 16:51:37', '93', 'Returned to', '0', '93', 'Cosmas Anyikwa', '', '0.00', '2021-11-01 16:53:59');
INSERT INTO `workflow_requests` VALUES ('997d3914ad', 'request_credit', 'RWS', 'Oct 2021', '2021-10-01', 'Live Version for Oct 2021', '27', '2021-10-12 12:52:51', '25', 'Awaiting Approval', '1', '98', 'Kikelomo Fisayo-Okusanya', '', '0.00', '2021-11-14 16:14:59');
INSERT INTO `workflow_requests` VALUES ('c52000ae1c', 'request_region_southwest', 'RWS', 'Oct 2021', '2021-10-01', '', '30', '2021-11-12 15:40:01', '95', 'New', '0', '0', '', '', '0.00', '0000-00-00 00:00:00');
INSERT INTO `workflow_requests` VALUES ('d7110ba278', 'request_region_southwest', 'UWS', 'Oct 2021', '2021-10-01', '', '30', '2021-10-12 12:52:16', '95', 'Approved', '3', '0', '', '', '0.00', '2021-10-18 11:57:16');
