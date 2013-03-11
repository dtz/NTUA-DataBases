-- --------------------------------------------------------

--
-- Stand-in structure for view `wage_stats`
--
CREATE TABLE IF NOT EXISTS `wage_stats` (
`department` varchar(20)
,`avg(wage)` double
);
-- --------------------------------------------------------

--
-- Structure for view `employees_2012`
--
DROP TABLE IF EXISTS `employees_2012`;

CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`localhost` SQL SECURITY DEFINER VIEW `employees_2012` AS select `EMPLOYEE`.`name` AS `name`,`EMPLOYEE`.`surname` AS `surname`,`EMPLOYEE`.`street` AS `street`,`EMPLOYEE`.`number` AS `number`,`EMPLOYEE`.`PC` AS `PC`,`EMPLOYEE`.`specialization` AS `specialization`,`EMPLOYEE`.`education_level` AS `education_level`,`EMPLOYEE`.`marital_status` AS `marital_status`,`EMPLOYEE`.`children_no` AS `children_no`,`EMPLOYEE`.`pid` AS `pid`,`EMPLOYEE`.`from_date` AS `from_date` from `EMPLOYEE` where (`EMPLOYEE`.`from_date` between '2012-01-01' and '2012-12-31');

-- --------------------------------------------------------

--
-- Structure for view `wage_stats`
--
DROP TABLE IF EXISTS `wage_stats`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wage_stats` AS select `p`.`department` AS `department`,avg(`s`.`wage`) AS `avg(wage)` from (`SALARY` `s` join `POSITION` `p`) where (`s`.`sal_id` = `p`.`sal_id`) group by `p`.`department`;


--
-- Triggers `PROMOTION`
--
DROP TRIGGER IF EXISTS `promo_update`;
DELIMITER //
CREATE TRIGGER `promo_update` AFTER UPDATE ON `PROMOTION`
 FOR EACH ROW begin
	update EMPLOYEE
	set EMPLOYEE.pid = NEW.new_pos
	where EMPLOYEE.SSN = NEW.SSN and NEW.new_pos > 0 and NEW.new_pos <> OLD.new_pos;
	update POSITION
	set POSITION.is_empty = POSITION.is_empty+1
	where POSITION.pid = OLD.new_pos and NEW.new_pos > 0 and NEW.new_pos <> OLD.new_pos;
	update POSITION
	set POSITION.number = POSITION.number+1
	where POSITION.pid = NEW.new_pos and POSITION.is_empty = 0 and NEW.new_pos > 0 and NEW.new_pos <> OLD.new_pos;
	update POSITION
	set POSITION.is_empty = POSITION.is_empty-1 
	where POSITION.pid = NEW.new_pos and POSITION.is_empty > 0 and NEW.new_pos > 0 and NEW.new_pos <> OLD.new_pos;
	
end
//
DELIMITER ;

-- --------------------------------------------------------
