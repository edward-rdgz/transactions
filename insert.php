<?php 
include("functions.php");
$fun = new functions();
$rows = $fun->selectSQL();
?>

<!doctype html>
<html>
<head>
    <title>Agregar</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>
	<form action="#" enctype="multipart/form-data" method="POST">
	<table>
    <?php
	$inputs = array();
    $flag = false;
	foreach($rows as $row) { //FOREACH #1 BEGIN
		if(!$flag) { //IF #1 BEGIN
			echo "<thead>
				  <tr>";
			foreach($row as $element => $object) { //FOREACH #2 BEGIN 
				echo "<th>".$element."</th>
					  <td><input type='text' name='".$element."'/></td>
					  </tr>";
			$inputs[] = $element;
			} //FOREACH #2 END
		echo "</thead>";
		$flag = true;
		} //IF #1 END
	} //FOREACH #1 END
	$fun->insertSQL($inputs);
    ?>
    </table>
    <center><p><input type="submit" value="Agregar"/></p></center>
	</form>
	<center><a href="index.php">REGRESAR A LA PAGINA PRINCIPAL</a></center>
</body>
</html>