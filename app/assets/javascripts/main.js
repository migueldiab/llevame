console.log('init app from main.js');
requirejs.config({
    //By default load any module IDs from js
    baseUrl: 'assets'
    ,paths: {
        //jquery: '//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery'
        jquery: 'jquery-1.8.2'
        //,bootstrap: '//netdna.bootstrapcdn.com/twitter-bootstrap/2.2.1/js/bootstrap.min'
        ,angular: 'angular'
        //,opensans: 'http://use.edgefonts.net/open-sans'
        ,llevame: 'controller/app'
        ,modernizr: 'modernizr-2.6.1-respond-1.1.0.min'
    }
    ,priority: [
        "jquery"
        ,"angular"
    ]

});

// Start the main app logic.
requirejs(
    ['angular'
        ,'jquery'
        ,'llevame'
        //,'opensans'
    ],
    function(angular, $, llevame) {
        console.log("App Main : " + llevame);
        llevame.initialize();


    }
);
