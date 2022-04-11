$(document).ready(function() {
    $('#mapplic').mapplic({
      source: 'map_json',
      height: 600,
      sidebar: false,
      marker: 'hidden',
      fullscreen: false,
      maxscale: 3,

      // UI
      basecolor: 'rgba(255,255,255, 0.6)',
      bgcolor: '#333',
      bgcolor2: '#333',
      headingcolor: '#fff',
      textcolor: '#aaa'
    });
  });