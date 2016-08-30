<?php
include("functions.php"); 
$fun = new functions();
$fun->updateSQL();
?>

<!doctype html>
<html>
<head>
<title>Editar</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>
<form action="#" enctype="multipart/form-data" method="POST" name="form">
	<p align="center"><strong>MODIFICAR</strong></p>
    <table border="1" align="center" class="letra">
      <tr>
        <td>ID:</td>
        <td><?php echo $row['id_pagos']; ?></td>
      </tr>
      <tr>
        <td>SUELDO:</td>
        <td><input type="text" name="sueldo" value="<?php echo htmlentities($row['sueldo'], ENT_COMPAT, 'utf-8'); ?>" size="32" /></td>
      </tr>
      <tr>
        <td>IVA:</td>
        <td><input type="text" name="iva" value="<?php echo htmlentities($row['iva'], ENT_COMPAT, 'utf-8'); ?>" size="32" /></td>
      </tr>
      <tr>
        <td>SUBSIDIO:</td>
        <td><input type="text" name="subsidio" value="<?php echo htmlentities($row['subsidio'], ENT_COMPAT, 'utf-8'); ?>" size="32" /></td>
      </tr>
      <tr>
        <td>SUBTOTAL:</td>
        <td><input type="text" name="subtotal" value="<?php echo htmlentities($row['subtotal'], ENT_COMPAT, 'utf-8'); ?>" size="32" /></td>
      </tr>
      <tr>
        <td>TOTAL:</td>
        <td><input type="text" name="total" value="<?php echo htmlentities($row['total'], ENT_COMPAT, 'utf-8'); ?>" size="32" /></td>
      </tr>
    </table>
    <p align="center"><input type="submit" value="Actualizar" /></p>
</form>
</body>
</html>