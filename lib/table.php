<?php
function show_table()
{
	global $mysqli;

	$sql = 'select * from deck';
	$st = $mysqli->prepare($sql);

	$st->execute();
	$res = $st->get_result();

	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}

function reset_table()
{
	global $mysqli;

	$sql = 'call shuffle_deck()';
	$mysqli->query($sql);
	show_table();
}

function playcard($arg1, $arg2, $arg3, $arg4, $arg5, $arg6)
{
	if ($arg1 >= 1 && $arg1 <= 4) {
		$num_args = func_num_args();
		if ($num_args >= 3 && $num_args <= 6) {
			if ($arg1 == $num_args - 2) {
				if ($arg1 == 1) {
					global $mysqli;
					$sql = "UPDATE table_name SET players = 'T' WHERE id = " . func_get_arg(2);
					$st = $mysqli->prepare($sql);
					$st->execute();
				} elseif ($arg1 == 2) {
					for ($x = 2; $x <= 3; $x++) {
						global $mysqli;
						$sql = "UPDATE table_name SET players = 'T' WHERE id = " . func_get_arg($x);
						$st = $mysqli->prepare($sql);
						$st->execute();
					}
				} elseif ($arg1 == 3) {
					for ($x = 2; $x <= 4; $x++) {
						global $mysqli;
						$sql = "UPDATE table_name SET players = 'T' WHERE id = " . func_get_arg($x);
						$st = $mysqli->prepare($sql);
						$st->execute();
					}
				} elseif ($arg1 == 4) {
					for ($x = 2; $x <= 5; $x++) {
						global $mysqli;
						$sql = "UPDATE table_name SET players = 'T' WHERE id = " . func_get_arg($x);
						$st = $mysqli->prepare($sql);
						$st->execute();
					}
				}
			} else {
				return false;
			}
		} else {
			return false;
			// Dynates times einai apo 1 mexri 4
		}
	} else {
		return false;
		// To prwto argument prepei na einai apo 1 mexri 4
	}
}
