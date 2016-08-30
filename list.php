<?php 
include("functions.php");
$fun = new functions();
$rows = $fun->selectSQL();
?>

<!doctype html>
<html>
<head>
    <title>Lista</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>
    <table>
    <?php
    $flag = true;
    foreach($rows as $row) { //FOREACH #1 BEGIN
        if($flag) { //IF #1 BEGIN
            echo "<thead>
                  <tr>";
            foreach($row as $element => $object) { //FOREACH #2 BEGIN
                echo "<th>".$element."</th>";
            } //FOREACH #2 END
            echo "<th>modificar</th> 
                  <th>eliminar</th>
                  </tr> 
                  </thead>";
            $flag = false;
        } //IF #1 END
        echo "<tr>";
        foreach($row as $element => $object) { //FOREACH #3 BEGIN
            echo "<td>".$object."</td>";
        } //FOREACH #3 END
		$flag = true;
		foreach($row as $element => $object) { //FOREACH #4 BEGIN
			if($flag) { //IF #2 BEGIN
				echo "<td><a href='edit.php?".$element."=".$object."'><img src='img/edit.png'/></a></td>
					  <td><a href='delete.php?".$element."=".$object."'><img src='img/delete.png'/></a></td>";
				$flag = false;
			} //IF #2 END
		} //FOREACH #4 END
		echo "</tr>";
    } //FOREACH #1 END
    ?>
    </table>
    <center><p><a href="index.php">REGRESAR A LA PAGINA PRINCIPAL</a></p></center>
</body>
</html>