// script entregado por Google
function showGoogleMaps() {

    var latLng = new google.maps.LatLng(-33.44716, -70.67121);

    var mapOptions = {
        zoom: 16,
        streetViewControl: false, // deshabilitamos el StreetView
        scaleControl: false, // deshabilitamos el zoom
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        center: latLng,
    };

    map = new google.maps.Map(document.getElementById('mapa'),
        mapOptions);

    map.panBy(-400, 100);

    marker = new google.maps.Marker({
        position: latLng,
        map: map,
        draggable: false,
        animation: google.maps.Animation.DROP,
        icon: 'img/pin.png'
    });
}

//google.maps.event.addDomListener(window, 'load', showGoogleMaps);

$(document).ready(function(){
    if ($('#mapa').length > 0) {
        google.maps.event.addDomListener(window, 'load', showGoogleMaps);

        $('form').validator().on('submit', function (e) {
            if (!e.isDefaultPrevented()) {
                e.preventDefault();
                $.ajax( {
                    url: '/php/backend.php',
                    dataType: 'json',
                    type: 'post',
                    data: { nombre: $('input[name=nombre]').val(), email: $('input[name=email]').val(),  mensaje: $('textarea[name=mensaje]').val(), accion: 'insertar' },
                    success: function(data) {
                        var $html;
                        if(data) {
                            $html = '<div class="alert alert-success" role="alert">'+
                            '<strong>Mensaje enviado!</strong> Tu mensaje ha sido enviado con éxito.'+
                            '</div>';
                        } else {
                            $html = '<div class="alert alert-danger" role="alert">'+
                            '<strong>Error!</strong> Hubo un error al momento de enviar tu mensaje. Intenta nuevamente.'+
                            '</div>';
                        }
                        $('form').append($html);
                    }
                });
            }
        });

    } else {
        $.ajax( {
            url: '/php/backend.php',
            dataType: 'json',
            type: 'post',
            data: { accion: 'getData' },
            success: function(data) {
                if(data) {
                    var $html;
                    $.each(data, function(index, value) {
                        $html += '<tr>'+
                                    '<td>'+value.ID+'</td>'+
                                    '<td>'+value.Nombre+'</td>'+
                                    '<td>'+value.Email+'</td>'+
                                    '<td>'+value.Mensaje+'</td>'+
                                    '<td>'+value.Estado+'</td>'+
                                '</tr>';
                    });
                    $('tbody').append($html);
                }
            }
        })
    }
});