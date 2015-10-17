<?php
// inicializamos las dependencias
require dirname(__DIR__).'/vendor/autoload.php';

// instanciamos ezSQL para la conexión a la bd
$db = new ezSQL_mysql('root', 'root', 'prueba_db', 'localhost');

if(isset($_POST) && $_POST['accion'] == 'insertar' ) {
    // sanitizamos strings
    $nombre = filter_var($_POST['nombre'], FILTER_SANITIZE_STRING);
    $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
    $mensaje = filter_var($_POST['mensaje'], FILTER_SANITIZE_STRING);

    // cabeceras para no ver puros símbolos raros
    $cabeceras = "From: felipe@fgacv.net\r\n";
    $cabeceras .= "MIME-Version: 1.0\r\n";
    $cabeceras .= "Content-Type: text/html; charset=UTF-8\r\n";

    // enviamos correo
    $sent_or_not_send = mail('felipe@fgacv.net', 'Prueba Octano', 'Enviando mensaje a '.$nombre.' ('.$email.'), que dice: <strong>'.$mensaje.'</strong>');

    // query a la bd
    $db->query('SET NAMES UTF8'); // aseguramos codificación
    $datosFormulario = $db->query('INSERT INTO felipe_gac (strNombre, strEmail, strMensaje, intEstado) VALUES("'.$nombre.'","'.$email.'","'.$mensaje.'",'.$sent_or_not_send.')');

    echo json_encode($datosFormulario);
}

if(isset($_POST) && $_POST['accion'] == 'getData') {
    $data = $db->get_results('SELECT * FROM mensajes ORDER BY ID ASC');
    echo json_encode($data);
}