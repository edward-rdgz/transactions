<?php

class connection { //APERTURA DE LA CLASE
	
	private $server; //SERVIDOR
	private $user; //USUARIO
	private $password; //CONTRASEÑA
	private $database; //BASE DE DATOS
	protected $connection; //VARIABLE DE CONEXION
	
	public function __construct() { //CONSTRUCTOR DE LA CLASE 
		$this->server; //INICIALIZACION DE LA VARIABLE SERVIDOR
		$this->user; //INICIALIZACION DE LA VARIABLE USUARIO
		$this->password; //INICIALIZACION DE LA VARIABLE CONTRASEÑA
		$this->database; //INICIALIZACION DE LA VARIABLE BASE DE DATOS
	}
	
	private function getServer() { //FUNCION OBTENER SERVIDOR
		return $this->server; //REGRESA EL VALOR DE LA VARIABLE SERVIDOR
	}
	
	private function setServer($server) { //FUNCION PONER SERVIDOR
		$this->server = $server; //ASIGNA EL PARAMETRO A LA VARIABLE SERVIDOR
	}
	
	private function getUser() { //FUNCION OBTENER USUARIO
		return $this->user; //REGRESA EL VALOR DE LA VARIABLE USUARIO
	}
	
	private function setUser($user) { //FUNCION PONER USUARIO
		$this->user = $user; //ASIGNA EL PARAMETRO A LA VARIABLE USUARIO
	}
	
	private function getPassword() { //FUNCION OBTENER CONTRASEÑA
		return $this->password; //REGRESA EL VALOR DE LA VARIABLE CONTRASEÑA
	}
	
	private function setPassword($password) { //FUNCION PONER CONTRASEÑA
		$this->password = $password; //ASIGNA EL PARAMETRO A LA VARIABLE CONTRASEÑA
	}
	
	private function getDatabase() { //FUNCION OBTENER BASE DE DATOS
		return $this->database; //REGRESA EL VALOR DE LA VARIABLE BASE DE DATOS
	}
	
	private function setDatabase($database) { //FUNCION PONER BASE DE DATOS
		$this->database = $database; //ASIGNA EL PARAMETRO A LA VARIABLE BASE DE DATOS
	}
	
	public function connect() { //CADENA DE CONEXION MYSQLI
		$this->setServer("localhost"); //ASIGNACION DEL SERVIDOR
		$this->setUser("root"); //ASIGNACION DEL USUARIO
		$this->setPassword(""); //ASIGNACION DE LA CONTRASEÑA
		$this->setDatabase("transaccion_ine"); //ASIGNACION DE LA BASE DE DATOS
		$this->connection = new mysqli($this->getServer(), $this->getUser(), $this->getPassword(), $this->getDatabase()) 
		or die($this->connection->connect_error); //CADENA DE CONEXION
	}
	
	public function disconnect() { //CIERRE DE LA CONEXION MYSQLI
		$this->connection->close();
	}
	
} //CIERRE DE LA CLASE

?>