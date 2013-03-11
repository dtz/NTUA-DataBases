DROP TRIGGER IF EXISTS `promo_update`;
DELIMITER //
CREATE TRIGGER `promo_update` AFTER UPDATE ON `PROMOTION`
for each row begin
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
	
end;
//
DELIMITER ;
