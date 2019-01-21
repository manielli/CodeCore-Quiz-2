function doSomething() {
    console.info("DOM Loaded");
}

if (document.readyState === "Loading...") {
    document.addEventListener("DOMContentLoaded", doSomething) 
} else
{
    doSomething();
};

document.querySelectorAll(".card-title").forEach( node => {
    node.addEventListener( "click", event => {
        // console.log(`${event.currentTarget.id} was clicked!`);
        const ideaNode = event.currentTarget;
        console.log(ideaNode.id);
    });
});