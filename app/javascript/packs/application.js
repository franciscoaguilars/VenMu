require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// External imports
import "bootstrap";
import Swiper from 'swiper/bundle';

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { initMapbox } from '../plugins/init_mapbox'

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initMapbox();

});

var swiper = new Swiper('.swiper-container', {
      slidesPerView: 3,
      spaceBetween: 10,

      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
    });
