<?php 

/* @Autor: Edward J. P. */

include("connect.php");

class functions extends connection { //APERTURA DE LA CLASE QUE EXTIENDE A OTRA

	public function selectSQL($tab,$ins=array(),$claus) { // SELECCION DE REGISTROS
		$rows=array();
		if(!empty($ins)) { // VALIDA EL CONTENIDO DE LA VARIABLE
			$val=$this->concat($ins); // CONCATENA LOS VALORES
			$selectSQL="SELECT ".$val[0]." FROM ".$tab." ".$claus;
		} else {
			$selectSQL="SELECT * FROM ".$tab." ".$claus;
		}
		$this->connect();
		$res=$this->connection->query($selectSQL) or die($this->connection->connect_error); // EJECUTA LA SENTENCIA
		while($row=$res->fetch_assoc()) { // RECORRE LOS REGISTROS
			$rows[]=$row; // ALMANCENA LOS VALORES EN UN ARREGLO
		}
		$res->close(); // LIBERA MEMORIA
		$this->disconnect();
		return $rows; // REGRESA LOS VALORES ALMACENADOS
	}
	
	public function concat($ins=array()) { // CONCATENADO DE VARIABLES
		$str="";
		$val="";
		for($i=0;$i<count($ins);$i++) {
			$str.=$ins[$i];
			$val.=@$_POST[$ins[$i]];
			if($i<count($ins)-1){
				$str.=", ";
				$val.="', '";
			}
		}
		return array($str, $val);
	}
	
	public function exists_reference($tab1,$tab2,$tab3,$ins=array()) { // EXISTENCIA DE LLAVES REFERENCIADAS AL DEVICES
		if($_POST) { // VALIDA LA FUNCION POST
			$in1=$_POST[$ins[0]]; // ENTRADA 1
			$in2=$_POST[$ins[1]]; // ENTRADA 2
			$in3=$this->concat($ins); // CONCATENA
			$array1=$this->selectSQL($tab1,array("id"),""); // CONJUNTO 1
			$array2=$this->selectSQL($tab2,array("id"),""); // CONJUNTO 2
			$this->connect();
			$this->connection->autocommit(false); // DESACTIVA LA AUTOCONFIRMACION DE LA BD
			$insertSQL="INSERT INTO ".$tab3." (".$in3[0].") VALUES ('".$in3[1]."')"; // SQL
			$this->connection->query($insertSQL); // SENTENCIA EN ESPERA
			if(array_key_exists($in1,$array1)&&array_key_exists($in2,$array2)) { // VALIDACION DE LA EXISTENCIA
				$this->connection->savepoint("P1"); // PUNTO DE GUARDADO - SI SE LOGRA DEVUELVE TRUE EN CASO CONTRARIO FALSE
				$this->connection->commit(); // CONFIRMA
				echo "commit";
			} else {
				$this->connection->rollback(); // REGRESA
				echo "rollback";
			}
			$this->disconnect();
		}
	}
	
	public function register_relation($tab,$ins=array()) { // COMPROBACION DE REGISTROS NUEVOS EN DEVICES
		if($_POST) { // VALIDACION DE LA FUNCION POST
			$this->connect();
			$this->connection->autocommit(false); // DESACTIVA LA AUTOCONFIRMACION
			$in=$this->concat($ins); // CONCATENA
			$insertSQL="INSERT INTO ".$tab." (".$in[0].") VALUES ('".$in[1]."')"; // SQL
			$this->connection->query($insertSQL); // SENTENCIA EN ESPERA
			if(!empty($_POST[$ins[0]])) { // VALIDACION DE LA PRIMERA ENTRADA
				$this->connection->savepoint("P1"); // PRIMER PUNTO DE GUARDADO
				echo "Se registro ".$ins[0]."</br>";
				if(!empty($_POST[$ins[1]])) { // VALIDACION DE LA SEGUNDA ENTRADA
					$this->connection->savepoint("P2"); // SEGUNDO PUNTO DE GUARDADO
					echo "Se registro ".$ins[1];
					$this->connection->commit(); // CONFIRMA
				}
			} else {
				$this->connection->rollback(); // REGRESA
				echo "Fallo el registro de ".$ins[0]." y ".$ins[1]."</br>";
			}
			$this->disconnect();
		}
	}
	
	public function no_remove_register_relation_dev($tab1,$tab2,$tab3,$id) { // NO PERMITIR LA ELIMINACION EN DEVICES
		$array1=$this->selectSQL($tab1,array("id"),""); // CONJUNTO 1
		$array2=$this->selectSQL($tab2,array("id"),""); // CONJUNTO 2
		$array3=$this->selectSQL($tab3,array("id","type_id","brand_id"),"WHERE id = ".$id); // CONJUNTO 3
		$this->connect();
		$this->connection->autocommit(false); // DESACTIVA LA AUTOCONFIRMACION
		$deleteSQL="DELETE FROM ".$tab3." WHERE id = ".$id; // SQL
		$this->connection->query($deleteSQL); // SENTENCIA EN ESPERA
		if(!array_key_exists($array3[0]['type_id'],$array1)&&!array_key_exists($array3[0]['brand_id'],$array2)) { // VALIDA EXISTENCIA
			$this->connection->savepoint("P1"); // PUNTO GUARDADO
			$this->connection->commit(); // CONFIRMA
			echo "commit";
		} else {
			$this->connection->rollback(); // REGRESA
			echo "rollback";
		}
		$this->disconnect();
	}
	
	public function no_remove_register_relation_typ($tab1,$tab2,$id) { // NO PERMITIR LA ELIMINACION EN TYPES
		$array=$this->selectSQL($tab1,array("type_id"),""); // CONJUNTO 1
		$this->connect();
		$this->connection->autocommit(false); // DESACTIVA LA AUTOCONFIRMACION
		$deleteSQL="DELETE FROM ".$tab2." WHERE id = ".$id; // SQL
		$this->connection->query($deleteSQL); // SENTENCIA EN ESPERA
		if(!array_key_exists($id,$array)) {
			$this->connection->savepoint("P1"); // PUNTO GUARDADO
			$this->connection->commit(); // CONFIRMA
			echo "commit";
		} else {
			$this->connection->rollback(); // REGRESA
			echo "rollback";
		}
		$this->disconnect();
	}
	
	public function no_remove_register_relation_bran($tab1,$tab2,$id) { // NO PERMITIR LA ELIMINACION EN BRANDS
		$array=$this->selectSQL($tab1,array("brand_id"),""); // CONJUNTO 1
		$this->connect();
		$this->connection->autocommit(false); // DESACTIVA LA AUTOCONFIRMACION
		$deleteSQL="DELETE FROM ".$tab2." WHERE id = ".$id; // SQL
		$this->connection->query($deleteSQL); // SENTENCIA EN ESPERA
		if(!array_key_exists($id,$array)) { // VALIDACION DE LA EXISTENCIA
			$this->connection->savepoint("P1"); // PUNTO GUARDADO
			$this->connection->commit(); // CONFIRMA
			echo "commit";
		} else {
			$this->connection->rollback(); // REGRESA
			echo "rollback";
		}
		$this->disconnect();
	}
	
	public function no_remove_register_relation_tec($tab1,$tab2,$id) { // NO PERMITIR LA ELIMINACION EN TECHNICALS
		$array=$this->selectSQL($tab1,array("technical_id"),""); // CONJUNTO 1
		$this->connect();
		$this->connection->autocommit(false); // DESACTIVA LA AUTOCONFIRMACION
		$deleteSQL="DELETE FROM ".$tab2." WHERE id = ".$id; // SQL
		$this->connection->query($deleteSQL); //S ENTENCIA EN ESPERA
		if(!array_key_exists($id,$array)) { // VALIDACION DE LA EXISTENCIA
			$this->connection->savepoint("P1"); // PUNTO GUARDADO
			$this->connection->commit(); // CONFIRMA 
			echo "commit";
		} else {
			$this->connection->rollback(); // REGRESA
			echo "rollback";
		}
		$this->disconnect();
	}	
	
	public function backup_db() { // RESPALDO DE LA BASE DE DATOS
		$this->connect();
		$sql="mysqldump -u root -p transaccion_ine > backup_ine.sql";
		$this->connection->query($sql);
		$this->disconnect();
	}
	
	public function lock_db($typ) { // BLOQUEO DE LA BASE DE DATOS - TIPO DE BLOQUEO WRITE | READ
		$this->connect();
		$sql="FLUSH TABLES WITH ".$typ." LOCK";
		$this->connection->query($sql);
		$this->disconnect();
	}
	
	public function lock_table($tab,$typ) { // BLOQUEO DE TABLA - TIPO DE BLOQUEO WRITE | READ
		$this->connect();
		$sql="LOCK TABLES ".$tab." ".$typ;
		$this->connection->query($sql);
		$this->disconnect();
	}
	
	public function unlock_tables() { // DESBLOQUEO DE TABLAS
		$this->connect();
		$sql="UNLOCK TABLES";
		$this->connection->query($sql);
		$this->disconnect();
	}
		
} //CIERRE DE LA CLASE

/*$connection = new mysqli("localhost", "root", "", "contabilidad") or die(mysqli_error($connection));
$result = $connection->query("SELECT * FROM pagos") or die(mysqli_error($connection)); 
$row = $result->fetch_assoc();
mysqli_close($connection);*/

	/*
	public function selectSQL() {
		$rows=array();
		$this->connect();
		$selectSQL="SELECT * FROM user";
		$res=$this->connection->query($selectSQL) or die($this->connection->connect_error);
		while($row=$res->fetch_assoc()) {
			$rows[]=$row;
		}
		$res->close();
		$this->disconnect();
		return $rows;
	}
	
	public function insertSQL($inputs=array()) {
		$this->connect();
		if($_POST) {
			$str="";
			$values="";
			for($i=0;$i<count($inputs);$i++) {
				$str.=$inputs[$i];
				$values.=$_POST[$inputs[$i]];
				if($i<count($inputs)-1){
					$str.=", ";
					$values.="', '";
				}
			}
			$insertSQL="INSERT INTO user (".$str.") VALUES ('".$values."')";
			$this->connection->query($insertSQL) or die($this->connection->connect_error);
			$this->disconnect();
			header("location: list.php");
		}
	}
	
	public function updateSQL() { //FUNCION DE ACTUALIZACION
		$this->connect(); //LLAMADO DE LA FUNCION CONECTAR
		if((isset($_GET["id"])) && ($_GET["id"] != "")) { //VALIDACION DEL $_GET
			$selectSQL = "SELECT sueldo, iva, subsidio, subtotal, total FROM pagos WHERE id_pagos = '$_GET[id]'"; //CONSULTA O SENTENCIA MYSQL
			$query = $this->connection->query($selectSQL) or die($this->connection->connect_error); //EJECUCION DE LA SENTENCIA O CONSULTA MYSQL
			$row = $query->fetch_assoc();
			if($_POST) { //VALIDACION DEL $_POST
			$updateSQL = "UPDATE pagos SET sueldo='$_POST[sueldo]', iva='$_POST[iva]', subsidio='$_POST[subsidio]', 
						subtotal='$_POST[subtotal]', total='$_POST[total]' WHERE id_pagos = '$_GET[id]'"; //CONSULTA O SENTENCIA MYSQL
			$this->connection->query($updateSQL) or die($this->connection->connect_error); //EJECUCION DE LA SENTENCIA O CONSULTA MYSQL
			$this->disconnect(); //LLAMADO DE LA FUNCION DESCONECTAR
			header("location: list.php"); //DIRECCION O UBICACION DE LA PAGINA A LA QUE SE REDIRECCIONA O ENVIA.
			}
		} else {
			header("location: list.php"); //DIRECCION O UBICACION DE LA PAGINA A LA QUE SE REDIRECCIONA O ENVIA.
		}
		return $row;
	}
	
	public function deleteSQL($input, $value) { 
		$this->connect();
		//if((isset($_GET["id"])) && ($_GET["id"] != "")) {
		$deleteSQL="DELETE FROM user WHERE ".$input." = ".$value;
		$this->connection->query($deleteSQL) or die($this->connection->connect_error);
		$this->disconnect();
		//}
		header("location: list.php");
	}
	*/
?>