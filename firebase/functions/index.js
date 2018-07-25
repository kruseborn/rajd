const functions = require('firebase-functions');
const firebase = require('firebase')
const GeoFire = require('geofire')

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//  response.send("Hello from Firebase!");
// });
var config = {
    apiKey: "AIzaSyBwdDULo-Ig3OW3VVx5iyI2DGN3Tz1BKjk",
    authDomain: "rajd-ae7af.firebaseapp.com",
    databaseURL: "https://rajd-ae7af.firebaseio.com/",
    storageBucket: "gs://rajd-ae7af.appspot.com"
};
firebase.initializeApp(config);

exports.helloWorld = functions.https.onRequest((request, response) => {
    // Get a reference to the database service
    firebase.database().ref('users/' + "123").set({
        username: "Sam",
        email: "sam@gmail.com",
        profile_picture: "duckface.png"
    }).then(function (data) {
        response.send("Hello from Firebase!" + data);
    }).catch(function (error) {
        response.send("Error from samo!" + error);
    });
    console.log("hello samo real time");

    var starCountRef = firebase.database().ref('samosCykel');
    starCountRef.on('value', function (snapshot) {
        console.log(snapshot.val().fish1);
    });
    var geoFire = new GeoFire(firebase.database().ref("samosCykel"));

    geoQuery = geoFire.query({
        center: [-66.722541, -167.019653],
        radius: 100000000000000
    });
    geoQuery.on("key_entered", function (key, location, distance) {
        console.log(key);
        console.log(key + " is located at [" + location + "] which is within the query (" + distance.toFixed(2) + " km from center)");
    });


    // Specify the locations for each fish
    var fishLocations = [
        [-16.130262, 153.605347],   // Coral Sea
        [-66.722541, -167.019653],  // Southern Ocean
        [-41.112469, 159.054565],   // Tasman Sea
        [30.902225, -166.66809]     // North Pacific Ocean
    ];

    var promises = fishLocations.map(function (location, index) {
        return geoFire.set("fish" + index, location).then(function () {
            console.log("fish" + index + " initially set to [" + location + "]");
        });
    });
})


exports.setBike = functions.https.onRequest((request, response) => {
    var geoFire = new GeoFire(firebase.database().ref("samosCykel"));

    // Specify the locations for each fish
    var fishLocations = [
        [-66.722544, -167.019353],  // Southern Ocean
    ];

    var promises = fishLocations.map(function (location, index) {
        return geoFire.set("fish" + 10, location).then(function () {
            console.log("fish" + 10 + " initially set to [" + location + "]");
        });
    });
})