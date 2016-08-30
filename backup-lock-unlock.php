<?php 
include("functions.php"); 
$fun=new functions();
switch(isset($_POST)) {
	case isset($_POST['backup-db']):
		echo "Se realizo el respaldo de la base de datos ine";
		$fun->backup_db();
		break;
	case isset($_POST['lock-db']):
		echo "Se bloqueo la lectura de la base de datos ine";
		$fun->lock_db("READ");
		break;
	case isset($_POST['lock-tab']):
		echo "Se bloqueo la escritura de la tabla brands";
		$fun->lock_table("brands","WRITE");
		break;
	case isset($_POST['unlock-tab']):
		echo "Se desbloqueron las tablas y la base de datos";
		$fun->unlock_tables();
		break;
	default: 
}
?>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>backup, lock and unlock</title>
</head>

<body>
<form action="<?php echo $_SERVER['PHP_SELF']; ?>" enctype="multipart/form-data" method="POST">
	<center><p><input type="submit" name="backup-db" value="Backup DB"></p></center>
    <center><p><input type="submit" name="lock-db" value="Lock DB"></p></center>
    <center><p><input type="submit" name="lock-tab" value="Lock Table"></p></center>
    <center><p><input type="submit" name="unlock-tab" value="Unlock Table"></p></center>
    <center><a href="index.php">REGRESAR A LA PAGINA PRINCIPAL</a></center>
</form>
</body>
</html>