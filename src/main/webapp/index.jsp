<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Covid Web Project</title>
    <link href="css/carousel.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>

<body>
<%@ include file="jsp/nav.jsp" %>
<main>
    <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" aria-label="Slide 1"
                    aria-current="true"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2" class="active"
                    class=""></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"
                    class=""></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="3" aria-label="Slide 4"
                    class=""></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="4" aria-label="Slide 5"
                    class=""></button>
        </div>

        <div class="carousel-inner">
            <div class="carousel-item">
                <img src="img/grosplanmain.jpg" alt="...">

                <div class="container">
                    <div class="carousel-caption text-start">
                        <h1>Totally safe website</h1>
                        <p>We assure you that you cannot catch the covid on this website!!</p>
                        <p><a class="btn btn-lg btn-secondary" href="sign-in">Sign up today</a></p>
                    </div>
                </div>
            </div>
            <div class="carousel-item active">
                <rect width="100%" height="100%" fill="#e72"></rect>

                <img src="img/personne-heureuse-sur-la-plage-au-soleil.jpg" alt="...">
                <div class="container">
                    <div class="carousel-caption">
                        <h1>Join Our Community</h1>
                        <p>A place of peace to protect us all </p>
                        <p><a class="btn btn-lg btn-secondary" href="sign-in">Sign in</a></p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="img/happy-comment-etre-heureux-bonheur.jpg" alt="...">
                <div class="container">
                    <div class="carousel-caption text-end">
                        <h1>Wake Up</h1>
                        <h4>Be a major player in the fight against covid!</h4>
                        <p><a class="btn btn-lg btn-secondary" href="sign-in">Sign in</a></p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="img/beaucoup-etre-heureux.jpg" alt="...">
                <div class="container">
                    <div class="carousel-caption text-end">
                        <h1> Create Event</h1>
                        <p> Tired of being alone? Join many events dedicated to members.</p>
                        <p><a class="btn btn-lg btn-secondary" href="#">See event</a></p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="img/necesitamosdelosotros-e1562014792233.jpg" alt="...">
                <div class="container">
                    <div class="carousel-caption">
                        <h1>Help your town!</h1>
                        <p> Mark the risky places in your city to fight clusters</p>
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

    <br>
    <div class="container marketing">

        <!-- Three columns of text below the carousel -->
        <div class="row">
            <div class="col-lg-4">
                <img src="img/painsourire.jpg" alt="...">

                <h2>I am happy</h2>
                <p>Since I use this website, I'm really at peace of mind.</p>
                <p><a class="btn btn-secondary" href="#">View details »</a></p>
            </div><!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <img src="img/Manuel-Ferrara-jpg.jpg" alt="...">
                <h2>Very useful</h2>
                <p>I love meeting people, this website really helps me to always stay safe despite the encounters I have.</p>
                <p><a class="btn btn-secondary" href="#">View details »</a></p>
            </div><!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <img src="img/joker.jpg" alt="...">
                <h2>Keep me smiling</h2>
                <p>In these difficult times, it is nice to have this kind of application allowing you to live despite
                    the pandemic.</p>
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
                <p class="lead">By avoiding the spread of covid, you protect yourself in addition to protecting others,
                    including the most vulnerable, thus saving many lives.</p>
            </div>
            <div class="col-md-5"><img src="img/enfantXXvieux.png" alt="...">
            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7 order-md-2">
                <h2 class="featurette-heading">Grow the community!</h2>
                <p class="lead">
                    Unity is strength.
                    The more people we are, the better we can all know about the risk, and more we stem the
                    pandemic.</p>
            </div>
            <div class="col-md-5 order-md-1">
                <div class="col-md-5"><img src="img/main.jpg" alt="...">
                </div>
            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading">And lastly, Checkmate the covid!!!</h2>
                <p class="lead">With everyone's help and, of course, by following shielding measures, we can regain hope
                    to beat coronavirus and resume a normal life, so don't hesitate and join us.</p>
            </div>
            <div class="col-md-5">
                <div class="col-md-5"><img src="img/chekmate_the_covid.jpg" alt="...">

                </div>
            </div>

            <hr class="featurette-divider">

            <!-- /END THE FEATURETTES -->

        </div><!-- /.container -->
    </div>

    <!-- FOOTER -->
    <footer class="container">
        <p class="float-end"><a href="#">Back to top</a></p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</main>
</body>
</html>