<?php 
include("functions.php");
$fun=new functions();
switch ($_GET['reg']) { // VARIABLE DE LA URL
    case 'devices':
		$fun->no_remove_register_relation_dev("types","brands","devices",$_GET['id']); // DEVICES
		break;
    case 'types':
        $fun->no_remove_register_relation_typ("devices","types",$_GET['id']); // TYPES
        break;
    case 'brands':
		$fun->no_remove_register_relation_bran("devices","brands",$_GET['id']); // BRANDS
        break;
	case 'technicals':
		$fun->no_remove_register_relation_tec("maintenances","technicals",$_GET['id']); // TECHNICALS
		break;
	default: 
	echo "error en la variable reg"; // ERROR
}
/*
$rows = $fun->selectSQL();
foreach($rows as $row) {
	foreach($row as $element => $object) {
		$fun->deleteSQL($element, $_GET[$element]);
	}
}
*/
?>