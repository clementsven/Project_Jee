<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>

        <link rel="canonical" href="carousel.css">



        <!-- Bootstrap core CSS -->
        <link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <!-- Favicons -->
        <link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
        <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
        <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
        <link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
        <link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
        <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
        <meta name="theme-color" content="#7952b3">


        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
        </style>


        <!-- Custom styles for this template -->
        <link href="carousel.css" rel="stylesheet">
    <title>Covid Web Project</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>



<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Protection Covid</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav me-auto mb-2 mb-md-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Sign in</a>
                    </li>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Navigation
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <li><a class="dropdown-item" href="#">Sign in</a></li>
                            <li><a class="dropdown-item" href="#">See contact covid zone</a></li>
                            <li><a class="dropdown-item" href="#">See contact covid event</a></li>
                            <li><a class="dropdown-item" href="#">Random covid victim</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="d-flex">
                    <ul class="navbar-nav me-auto mb-2 mb-md-0">
                        <% if(true){%>
                        <form action="/login"  method="post">
                            <li class="nav-item">
                            <a class="nav-link disabled" color = "red">Username : </a>
                            </li >
                            <li class="nav-item">
                            <input type="text" id="username" name="username" required><br>
                        </li>
                            <li class="nav-item">
                            <a class="nav-link disabled">   Password  : </a>
                        </li> <li class="nav-item">
                            <input type="password" id="password" name="password" required><br> </li>

                            <% if(request.getAttribute("check") != null && (boolean)request.getAttribute("check")){%>
                                      <p>.Error.</p>
                            <%}else{%><p>.     .</p>
                            <%}%>

                            <button class="btn btn-outline-warning" type="submit">Login</button> %>
                        <%}else{%>
                            <label for="password" >Password:</label><br>

                        <%}%>
                    </ul>
                </form>
            </div>
        </div>
    </nav>

</header>

<main class = "navbar-expand-md">
    <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0"  aria-label="Slide 1"class="active"aria-current="true"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2" class=""></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3" class="" ></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="3" aria-label="Slide 4" class="" ></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="4" aria-label="Slide 5" class="" ></button>
        </div>

        <div class="carousel-inner">
            <div class="carousel-item">
                <img src="ressource/grosplanmain.jpg" alt="...">

                <div class="container">
                     <div class="carousel-caption text-start">
                        <h1>Totally safe website</h1>
                        <p>We assure you that you cannot catch the covid on this website!!</p>
                        <p><a class="btn btn-lg btn-secondary" href="#">Sign up today</a></p>
                    </div>
                </div>
            </div>
            <div class="carousel-item active">
                <rect width="100%" height="100%" fill="#e72" ></rect>

                <img src="ressource/personne-heureuse-sur-la-plage-au-soleil.jpg" alt="...">
                <div class="container">
                    <div class="carousel-caption">
                        <h1>Join Our Community</h1>
                        <p>A place of peace to protect us all </p>
                        <p><a class="btn btn-lg btn-secondary" href="#">Sign in</a></p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="ressource/happy-comment-etre-heureux-bonheur.jpg" alt="...">
                <div class="container">
                    <div class="carousel-caption text-end">
                        <h1>Wake Up</h1>
                        <h4>Be a major player in the fight against covid!</h4>
                        <p><a class="btn btn-lg btn-secondary" href="#">Sign in</a></p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="ressource/beaucoup-etre-heureux.jpg" alt="...">
                <div class="container">
                    <div class="carousel-caption text-end">
                        <h1>    Create Event</h1>
                         <p>    Tired of being alone? join many events dedicated to members.</p>
                        <p><a class="btn btn-lg btn-secondary" href="#">See event</a></p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="ressource/necesitamosdelosotros-e1562014792233.jpg" alt="...">
                <div class="container">
                    <div class="carousel-caption">
                        <h1>Help your town!</h1>
                        <p>             Note the risky places in your city to fight clusters</p>
                        <p><a class="btn btn-lg btn-secondary" href="#">See risky zone</a></p>
                    </div>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>




    <p>.</p>
    <p></p>
    <p></p>
    <p>.</p>
    <div class="container marketing">

        <!-- Three columns of text below the carousel -->
        <div class="row">
            <div class="col-lg-4">
                <img src="ressource/painsourire.jpg" alt="...">

                <h2>I am happy</h2>
                <p>Since i use this website i'm really at peace of mind.</p>
                <p><a class="btn btn-secondary" href="#">View details »</a></p>
            </div><!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <img src="ressource/Manuel-Ferrara-jpg.jpg" alt="...">
                <h2>Very useful</h2>
                <p>I love meat people, this website really help me to always stay safe despite the encounters I do.</p>
                <p><a class="btn btn-secondary" href="#">View details »</a></p>
            </div><!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <img src="ressource/joker.jpg" alt="...">
                <h2>Keep me smiling</h2>
                <p>In these difficult times, it is nice to have this kind of application allowing you to live despite the pandemic.</p>
                <p><a class="btn btn-secondary" href="#">View details »</a></p>
            </div><!-- /.col-lg-4 -->
        </div><!-- /.row -->
    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->


        <!-- START THE FEATURETTES -->

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading">Protect the most fragile</h2>
                <p class="lead">By avoiding the spread of covid, you protect yourself in addition to protecting others, including the most vulnerable, thus saving many lives.</p>
            </div>
            <div class="col-md-5"> <img src="ressource/enfantXXvieux.png" alt="...">
            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7 order-md-2">
                <h2 class="featurette-heading">Grow the community!</h2>
                <p class="lead">
                    Unity is strength.
                    the more people we have, the better we can all members warn about their risk, and more we stem the pandemic.</p>
            </div>
            <div class="col-md-5 order-md-1">
                <div class="col-md-5"> <img src="ressource/main.jpg" alt="...">
            </div>
        </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading">And lastly, Checkmate the covid!!!</h2>
                <p class="lead">With everyone's help and of course by following shielding measures, we can regain hope to beat coronavirus and resume a normal life, so don't hesitate and join us.</p>
            </div>
            <div class="col-md-5">
                <div class="col-md-5"> <img src="ressource/chekmate_the_covid.jpg" alt="...">

            </div>
        </div>

        <hr class="featurette-divider">

        <!-- /END THE FEATURETTES -->

    </div><!-- /.container -->


    <!-- FOOTER -->
    <footer class="container">
        <p class="float-end"><a href="#">Back to top</a></p>
        <p>© 2017–2021 Company, Inc. · <a href="#">Privacy</a> · <a href="#">Terms</a></p>
    </footer>



<script src="/docs/5.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


<h1> Covid Web Project </h1><br>
    <%@ include file="jsp/nav.jsp" %>

    <h2> Home page </h2><br>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>