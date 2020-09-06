:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/html_write)).


:- http_handler(root(.), report, []).


server(Port) :-
    http_server(http_dispatch, [port(Port)]).

report(Request) :-
    reply_html_page(
        [title('Creación de Aplicaciones Web usando Prolog')],
        [\body(Request)]
    ).

body(_Request) -->
    html(
        [
            div([style='font-family: Arial'],
                [
                    div(\cover),
                    div(\what_is_prolog),
                    div(\utilization),
                    div(\overall_flow),
                    div(\handlers),
                    div(\prolog_server),
                    div(\how_create_html),
                    div(\post_form),
                    div(\get_form_info),
                    div(\conclusions),
                    div(\bibliography)
                ]
            )
        ]
    ).

cover -->
    html(
        [
            div([style='text-align: center'],[
                    img([ src='https://upload.wikimedia.org/wikipedia/commons/f/f9/Logo-unah.jpg', style="float: left; z-index: 2;height: 40vh; width: 20vw;"]),
                    img([ src='https://curoc.unah.edu.hn/assets/CUROC/paginas/nuevo-pagina/_resampled/ResizedImageWzYwMCw2MDBd/logos-UNAH-11.png', style="float: right;height: 36vh; width: 26vw; z-index: 2"]),
                    h1([style='margin-top: 6%'],"Universidad Nacional Autónoma de Honduras"),
                    h1("Facultad de Ingeniería"),
                    h1("Carrera de Ingeniería en Sistemas"),
                    h1([style='margin-top: 11%'],"Informe sobre la Creación de Aplicaciones Web usando Prolog y SWI-Prolog"),
                    h1([style='margin: 6%'],"Nombre: Luis Enrrique Martinez Meza"),
                    h1([style='margin: 6%'],"Cuenta: 20161031037"),
                    h1([style='margin: 6%'],"Asignatura: IS-513 Lenguajes de Programación"),
                    h1([style='margin: 6%'],"Catedrático: José Inestroza"),
                    h1([style='margin: 6%'],"Fecha Entrega: 10 de Agosto de 2020")
                ]
            )
        ]
    ).

what_is_prolog -->
    html(
        [
            h1([style='padding-top: 3%; border-top: 2px solid black;text-align: center; margin top: 4%'],"Introducción a la Programación en Prolog"),
            h3("¿Qué es Prolog?"),
            p("Prolog es un lenguaje de programación de tipo declarativo, y dentro de éste tipo de lenguaje pertenece a los lenguajes lógicos, en donde se trabaja en forma descriptiva, estableciendo relaciones entre entidades. Prolog se puede definir como un lenguaje semi-interpretado, ya que aunque en sus inicios éste era un lenguaje totalmente interpretado, una década mas tarde se creo un compilador el cual es capaz de traducir Prolog en un conjunto de instrucciones de una maquina abstracta denominada WAM ('Warren Abstract Machine')."),
            p("La programación en éste lenguaje consiste en:"),
            ul([li("Declarar hechos sobre objetos y relaciones entre éstos."),
                li("Definir reglas sobre los objetos y relaciones."),
                li("Realizar preguntas o consultas.")
            ]),
            h3("Elementos en Prolog"),
            ul([li("Átomos: Es una definicion genérica de un objeto de la vida real que queremos representar."),
                li("Predicados: Son las caracteristicas o las relaciones que pueden poseer los objetos que queremos representar."),
                li("Hechos: Es algo que ocurre en la vida real, y representan las relaciones entre los objetos. Ejemplo de un hecho podría ser 'La computadora tiene cámara' donde 'computadora' y 'cámara' son átomos u objetos y 'tiene' es el predicado o relación que los une."),
                li("Variables: En Prolog, una variable representa el valor de un átomo. En Prolog los nombres de las variables siempre inician con letra mayúscula"),
                li("Reglas: Las reglas se utilizan para significar que un hecho depende de otro u otros. Es la representación de la implicación 'p -> q' (p implica q), también éstas siempre finalizan con un '.'. En Prolog una regla esta formada por una cabeza y un cuerpo, la cabeza solo puede estar formada por un único hecho mientras que el cuerpo puede ser uno o más hechos separados por una coma, la cual funciona como el operador 'y' lógico.")
            ]),
            p("Un ejemplo de programación en Prolog sería el siguiente:"),
            pre([style='background-color: black; color: gold;margin-left: 4%;margin-right: 4%; padding: 2%'],[code("/* Hechos */
hombre('Adan'). % Siempre lleva punto al final 
mujer('Eva').
hombre('Cain').

descendiente('Cain','Adan').
descendiente('Cain','Eva').

/* Predicados */
padre(X,Y) :-
    hombre(Y),
    descendiente(X,Y).

madre(X,Y) :-
    mujer(Y),
    descendiente(X,Y).
")           ])        
        ]
    ).

utilization -->
    html(
        [
            h3("¿Para qué se utiliza Prolog?"),
            p("Aunque se podría considerar a Prolog como un lenguaje de programación sencillo con capacidades limitadas, es un lenguaje muy versátil donde se puede implementar cualquier tipo de algoritmo, por lo que se puede comparar con lenguajes como C++. Java, Haskell, y en algunos aspectos se podria considerar mas potente."),
            p("Prolog es uno de los lenguajes preferidos en el ámbito de la Inteligencia Artificial, se utiliza para crear sistemas expertos o sistemas basados en conocimientos, también es bastante utilizado en Machine Learning (por su gran uso en IA), es común que se utilice para realizar subprocesos lógicos en programas donde los demás componentes del programa son desarrollados en lenguajes más conocidos."),
            h3("¿Para qué se puede utilizar Prolog?"),
            p("Como se dijo anteriormente Prlog puede ser utlizado en ámbitos como la Inteligencia Artificial, también en campos donde sea necesario realizar procedimientos lógicos, y también para crear Aplicaciones Web gracias a SWI-Prolog."),
            h1([style='padding-top: 3%; border-top: 2px solid black;text-align: center; margin top: 4%'],"Utilizando Prolog en la Web"),
            h3("¿Porqué utilizar Prolog para aplicaciones Web?"),
            p("Una de las razones es por los programas que se pueden realizar en Prolog, pues son programas que se pueden considerar sencillos, pero que, como se dijo anteriormente, esto no limita a Prolog. Otra razon es que debido a su 'sencillez' en el desarrollo de programas, el código fuente de una aplicación web creada con Prolog será mucho mas pequeño que si es creado en los lenguajes que comunmente se utilizan para crear estas aplicaciones."),
            p("También al ser Prolog un lenguaje lógico, la complejidad que puede tener el codigo fuente de una aplicación web desarrollado con otro lenguaje será mas alta que la complejidad de la aplicacion creada con Prolog, dando asi un código mas optimizado."),
            h3("Que sitios utilizan Prolog?"),
            p("Algunos de los sitios que estan desarrollados en prolog son:"),
            img([style="border: 2px solid black;margin-left: 20%" ,src="http://www.pathwayslms.com/swipltuts/html/systemsusingprolog.png"])
        ]
    ).

overall_flow -->
    html(
        [
            h3("¿Como es el flujo general de la implementación Web en Prolog?"),
            p("El flujo general de una solicitud o petición es:"),
            ul([
                li("Mediante la libreria 'http_dispatch' se asigna un hilo, el cual analiza las cabeceras y detiene la lectura, decodifica la ruta de la petición y trata de encontrar una ruta que coincida con ésta."),
                li("Convierte la información que tiene sobre la petición en un objeto, en éste caso como se trata de Prolog lo convierte en una lista, que contiene la información, como puede ser: las cabeceras, dirección IP de quien realizó la peticion,etc."),
                li("Si se tiene instalado algun filtro de tipo 'http_request-expansion' el objeto que se creo anteriormente pasa por éste filtro, el cual puede hacer que el objeto cambie o lanzar alguna excepción."),
                li("Ahora el predicado del manejador es llamado, éste predicado es definido por el programador y se pasa comoo parámetro la petición. La función de este predicado o lo que se espera que haga es que escriba el contenido de la pagina web, incluyendo los encabezados de 'current_output' y será interpretado como un archivo CGI (Common Gateway Interface Script)."),
                li("Para las API's REST se utiliza 'http_read_json_dict/2 para convertir de forma cuidadosa un JSON entrante a un termino 'dict' mientras que 'reply_json_doct/1' hace la funcion inversa. "),
                li("Para mostrar un HTML se utiliza la función 'reply_html_page, donde el programador agrega una DCG(Definite Clause Grammar) en la cual define que elementos iran en el HEAD, y otra DCG que define los elementos que irán en el BODY del HTML que desea mostrar. Para generar este HTML se puede utilizar un termino que define Prolog en el cual se genera el HTML de forma anidada, siendo asi mas rápido de escribir, aunque tambien se puede utilizar HTML de la forma comun."),
                li("El HTML se estiliza al pasar a través de user:body//2 o user:head//2 para los encabezados, luego de esto se empieza a dar formato al HTML al agregar nuevas lineas para poder mostrar algo legible."),
                li("La salida final de la funcion 'print_html' es un archivo CGI el cual es interpertado por el sistema.")
            ])
        ]
    ).

handlers -->
    html(
        [
            h3("Manejadores en Prolog"),
            p("Las Aplicaciones Web creadas en SWI-Prolog son definidas como una colección de manejadores. Los manejadores en Prolog son el equivalente a las rutas en Ruby on Rails, o a las URL's en Django, en el cual se definen una ruta o dirección que tendrá nuestra aplicación y lo que se quiere mostrar en esa dirección en especifico."),
            p("Un ejemplo de manejador en Prolog:"),
            pre([style='background-color: black; color: gold;margin-left: 4%;margin-right: 4%; padding: 2%'],
            [code("% Estructura de un manejador en Prolog

:- http_handler('/hello', hello, []).
% El primer parámetro es la direccion o ruta donde se mostrará el contenido que esta en el segundo parámetro.

hello -->
    % Aqui iría la informacion y el HTML que se quiere devolver.
% El segundo parámetro podemos llamarlo con 'call(Args, Request)' donde Request posee toda la informacion de la peticion.
% y es una 'regla'' donde se obtiene la informacion que se quiere devolver en esa ruta.

% El último parámetro es un conjunto de opciones que pueden ser de nuestro interés dependiendo de la aplicación que se esté desarrollando.
& Uno de los mas utilizados es 'prefix', con el que, con un unico manejador poder gestionar todo lo que se encuentre por debajo de la ruta especificada tambien,")]),
            p("En el código anterior lo que se está haciendo es que, mediante un manejador, poniendo como ejemplo que el dominio de nuestra aplicacion web sea 'www.helloworld.com',se muestre en la ruta 'www.helloworld.com/hello' lo que esté definido en la regla llamada 'hello' que, comunmente contiene el código HTML que se quiere mostrar en esta ruta en especifico.")
        ]
    ).

prolog_server -->
    html(
        [
            h3("Pasos para crear, ejecutar y cerrar un servidor en Prolog"),
            p("Antes que nada, se debe instalar SWI Prolog en nuestra computadora, escribiendo en la consola el siguiente comando:"),
            pre([style='background-color: black; color: gold;margin-left: 4%;margin-right: 4%; padding: 2%'],
            [code("$ sudo snap install swi-prolog")]),
            p("Esto hará que se instale la version estable de SWI Prolog."),
            p("Primero hay que crear el archivo donde estará la funcionalidad para crear el servidor. En este ejemplo se llamará create.pl :"),
            pre([style='background-color: black; color: gold;margin-left: 4%;margin-right: 4%; padding: 2%'],
            [code("% Primero debemos importar dos modulos necesarios para crear el servidor.
            
:- use_module(library(http/thread_httpd)).

:- use_module(library(http/http_dispatch)).

% Ahora creamos la funcion que se encargará de crear el servidor.

server(Port) :-
    http_server(http_dispatch, [port(Port)]).")]),
            p("Ahora desde la consola ubicados en la carpeta donde se encuentra el archivo create.pl escribiremos los siguientes comandos:"),
            pre([style='background-color: black; color: gold;margin-left: 4%;margin-right: 4%; padding: 2%'],
            [code("$ swipl create.pl")]),
            p("Luego de esto se abrirá el intérprete de SWI Prolog, ahora vamos a poner el siguiente comando:"),
            pre([style='background-color: black; color: gold;margin-left: 4%;margin-right: 4%; padding: 2%'],
            [code("?- server(7777).")]),
            p("Esto hará que se cree un servidor en la direccion 'http://localhost:7777'. Si queremos cerrar el servidor y salir del intérprete usamos el comando 'halt.'.")
        ]
    ).

how_create_html -->
    html(
        [
            h3("Como crear HTML como programa Web en Prolog"),
            p("Existen distintas formas para generar y servir HTML con Prolog. Tomando como ejemplo la impresión de un 'Hello World', podemos imprimir este texto en pantalla de las siguientes maneras:"),
            p("1. Imprimiendo HTML directamente"),
            pre([style='background-color: black; color: gold;margin-left: 4%;margin-right: 4%; padding: 2%'],
            [code("hello(_Request) :-
    format('Content-Type: text/html~n~n),
    format('<html><head><title>Hello</title></head><body><h1>Hello World</h1><p>Hello World</p></body></html>').")]),
            p("En esta forma se puede notar que mediante el uso de 'format' podemos escribir codigo HTML de la forma tradicional, sin olvidar agregar el tipo de contenido que se quiere enviar para que sea mostrado en pantalla."),
            p("2. Usando print_html"),
            pre([style='background-color: black; color: gold;margin-left: 4%;margin-right: 4%; padding: 2%'],
            [code("hello(_Request) :-
    format('Content-Type: text/html~n~n),
            print_html(['<html>',
            '<head>',
            '<title>',
            'Hello',
            '</title>',
            '<body>',
            '<h1>',
            'Hello World',
            '</h1>',
            '<p>',
            'Hello World',
            '</p>',
            '</body>',
            '</html>']).")]),
            p("Al usar 'print_html' tambien se puede decir que es equivalente a escribir HTML de forma normal, pero es un poco menos elegante de ver, ya que cada etiqueta o texto que se quiera imprimir en la pagina web debe declararse como un elemento de una lista, lo cual puede provocar confusiones al momento de estar escribiendo el codigo."),
            p("3. Generando HTML con ayuda de Prolog"),
            pre([style='background-color: black; color: gold;margin-left: 4%;margin-right: 4%; padding: 2%'],
            [code("hello(_Request) :-
    meeting(
        html(
                head(title('Hello')),
                body([h1('Hello World'), p('Hello World')])
            ],
            TokenizedHtml,
            [])
    ),
    format('Content-Type: text/html~n~n'),
    print_html(TokenizedHtml).")]),
            p("En esta forma mezclamos las dos formas vistas anteriormente, usando tanto 'format' como 'print_html' pero no escribiendo codigo HTML directamente. Usando TokenizedHtml es una buena opcion para generar HTML, ya que primero creamos un objeto el cual contiene el HTML deseado, y donde se declara cada tipo de etiqueta y su contenido usando objetos con estos mismos nombres,a los cuales tambien se les puede agregar estilos, luego podemos usar el objeto creado utilizando 'print_html' lo cual permite que el codigo se vea mas ordenado. "),
            p("4. Usando 'reply_html_page'"),
            pre([style='background-color: black; color: gold;margin-left: 4%;margin-right: 4%; padding: 2%'],
            [code("hello(_Request) :-
    reply_html_page(
        [title('Hello')],
        [h1('Hello World), p('Hello World')]
    ).")]),
            p("Se puede decir que esta forma es una version corta de la anterior, ya que, en lugar de crear un objeto que contiene el HTML y usarlo mediante 'print_html' lo que nos permite hacer 'reply_html_page' es poder escribir el codigo HTML directamente en él sin tener que crear un objeto para luego poder usarlo."),
            p("5. Usando la inclusión"),
            pre([style='background-color: black; color: gold;margin-left: 4%;margin-right: 4%; padding: 2%'],
            [code("hello(_Request) :-
    reply_html_page(
        [title('Hello')],
        [*meeting]
    ).
    
meeting -->
    html(
        [
            h1('Hello World'),
            p('Hello World')
        ]
    ).")]),
            p("Esta forma es similar a la anterior excepto que en este caso creamos un objeto donde estará el HTML, para luego agregarlo en 'reply_html_page', como una lista y usando el simbolo de contrapleca antes del nombre. En el ejemplo anterior para incluir 'meeting' debemos sustituir el '*' por una contrapleca. "),
            p("También hay que aclarar que la aridad de 'reply_html_page' es de 3 por lo que solo puede recibir como máximo tres parámetros, por lo que si se quiere hacer más inclusiones lo recomendable es crear un objeto 'body' por ejemplo, que contenga todas las inclusiones que se requiera. De esta forma no se tendria conflicto con la aridad de 'reply_html_page'.")
        ]
    ).

post_form -->
    html(
        [
            h3("Generar formularios POST en Prolog"),
            p("Para generar formularios de tipo POST solamente debemos crear la misma estructura que tiene en HTML pero usando la herramienta 'reply_html_page' que nos provee Prolog"),
            p("Un ejemplo de un formulario con un campo de texto y un campo numérico:"),
            pre([style='background-color: black; color: gold;margin-left: 4%;margin-right: 4%; padding: 2%'],
            [code("form_example(_Request) :-
    reply_html_page(
        title('Ejemplo de Formulario en Prolog'),
        [
            form([action='/results', method='POST'],[
                p([],[ input([name=nombre, type=text, placeholder='Ingrese su nombre' ])]),
                p([],[ input([name=numero, type=number, placeholder='Ingrese su numero de telefono' ]) ]),
                p([],[ input([name=enviar, type=submit, value='Enviar']) ])
            ])
        ]
    ).")])
        ]
    ).

get_form_info -->
    html(
        [
            h3("Recibiendo y procesando peticiones POST en Prolog"),
            p("Para poder recibir las peticiones y poder manipular la información enviada primero debemos incluir la siguiente linea de código:"),  
            pre([style='background-color: black; color: gold;margin-left: 4%;margin-right: 4%; padding: 2%'],
            [code(":- use_module(library(http/http_client)).")]),
            p("Esta libreria nos permitira usar el método 'http_read_data' con la cual podremos leer la informacion recibida por medio de la petición. Ahora debemos definir la ruta donde se recibirán y mostrarán las peticiones, en este caso llamada results."),
            pre([style='background-color: black; color: gold;margin-left: 4%;margin-right: 4%; padding: 2%'],
            [code(":- http_handler('/results',get_results,[]).")]),
            p("Ahora vamos a implementar una función que nos permita obtener y mostrar en pantalla la información reecibida desde el formulario creado anteriormente."),
            pre([style='background-color: black; color: gold;margin-left: 4%;margin-right: 4%; padding: 2%'],
            [code("get_results(_Request) :-
    member(method(post), Request), !,
    http_read_data(Request, Data, []),
    format('Content-Type: text/html~n~n),
    format('<p>',[]),
        portray_clause(Data),
    format('</p>').")])
        ]
    ).

conclusions -->
    html(
        [
            h1([style='padding-top: 3%; border-top: 2px solid black;text-align: center; margin top: 4%'], ["Conclusiones"]),
            ol([
                li("Aunque Prolog a simple vista parece un lenguaje que tiene pocos campos de apĺicación, podemos ver que no es asi, ya que, aunque el campo donde suele usarse de manera mas habitual es el de Inteligencia Artificial, no debemos limitar nuestra forma de pensar asumiendo que Prolog solo es util en ese único campo, ya que, como hemos visto, tambien podemos usarlo en otros ámbitos."),
                p(""),
                li("Prolog es uno de los lenguajes de mayor importancia en la historia de los lenguajes de programación, pues fue una innovación crear un lenguaje donde no se busca que el programador solucione un problema sino que el programador dote de ésta psobilidad a la maquina, para que ésta sea capaz de resolver los problemas."),
                p(""),
                li("El desarrollo de aplicaciones web con Prolog es una alternativa que podemos utilizar, ya que, como se dijo anteriormente, los programas hechos en Prolog son mucho mas pequeños y pueden llegar a ser mas eficientes que los programas escritos en lenguajes comunmente utilizados para esto, como lo puede ser Java o PHP."),
                p(""),
                li("Con SWI-Prolog se puede crear de manera sencilla una aplicación web, pues con pocas lineas de código podemos crear un servidor y mostrar contenido en éste, además, cuenta con las herramientas necesarias para crear una aplicaion web mas compleja, e.g.: Auntenticaciones, Conexion con Bases de Datos, CORS, AJAX, Sesiones, etc."),
                p(""),
                li("Prolog puede parecer un lenguaje sencillo al principio, al ver su sintaxis relativamente facil de aprender, pero en realidad estamos hablando de un lenguaje bastante complejo y extenso, con el que podemos crear codigos de igual complejidad.")
            ])
        ]
    ).

bibliography -->
    html(
        [
            h1([style='padding-top: 3%; border-top: 2px solid black;text-align: center; margin top: 4%'], ["Bibliografía"]),
            ul(
                [
                    li("Tutorial — Creating Web Applications in SWI-Prolog, http://www.pathwayslms.com/swipltuts/html/index.html#_javascript_and_json"),
                    p(""),
                    li("Generating HTML, http://www.pathwayslms.com/swipltuts/html/index.html#_generating_html"),
                    p(""),
                    li("Overall Flow, http://www.pathwayslms.com/swipltuts/html/index.html#_overall_flow"),
                    p(""),
                    li("Handling Parameters, http://www.pathwayslms.com/swipltuts/html/index.html#_handling_parameters")
                ]
            )
        ]
    ).