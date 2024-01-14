// Function to force play the audio
function forcePlayAudio() {
    if (audioPlayer.paused) {
        audioPlayer.play();
    }
}

document.addEventListener('DOMContentLoaded', function() {
    var video = document.getElementById('fullscreen-video');

    // Function to force play the video
    function forcePlayVideo() {
        if (video.paused) {
            video.play().then(_ => {}).catch(error => {
                // Autoplay may be blocked by the browser, handle the error here
                console.error("Autoplay was prevented. Please interact with the page to allow autoplay.");
            });
        }
    }

    // Add an event listener to play the video when the document is clicked
    document.addEventListener('click', forcePlayVideo);

    // Optional: You can call forcePlayVideo() directly if you want to play the video on page load
    // forcePlayVideo();
});

document.addEventListener('DOMContentLoaded', function() {
    var audioPlayer = document.getElementById('audioPlayer');

    // Set initial volume (0.5 in this example, change as needed)
    audioPlayer.volume = 0.4;

    // Toggle mute/unmute when spacebar is pressed
    document.addEventListener('keydown', function(event) {
        if (event.code === 'Space') {
            event.preventDefault();
            audioPlayer.muted = !audioPlayer.muted;
        }
    });
    
    // Set volume when arrow up or down keys are pressed
    document.addEventListener('keydown', function(event) {
        if (event.code === 'ArrowUp' && audioPlayer.volume < 1) {
            audioPlayer.volume += 0.1;
        } else if (event.code === 'ArrowDown' && audioPlayer.volume > 0) {
            audioPlayer.volume -= 0.1;
        }
    });
});