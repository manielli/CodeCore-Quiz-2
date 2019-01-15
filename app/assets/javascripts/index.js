document.addEventListener("DOMContentLoaded", function(event) {
    console.log("DOM fully loaded and parsed")
});

for(var i = 0; i < 1000000000; i++){

}

document.querySelectorAll(".card-title").forEach( node => {
    node.addEventListener( "click", event => {
        console.log(`${event.currentTarget.id} was clicked!`);
        const ideaNode = event.currentTarget;
    });
});