// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

Array.prototype.flat = function () {
  return this.reduce((acc, val) => acc.concat(val), []);
};

document.addEventListener('turbolinks:load', () => {
  const burgerButtons = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'));

  burgerButtons.forEach((element) => {
    element.addEventListener('click', () => {
      const target = document.getElementById(element.dataset.target);

      [element, target].forEach((el) => {
        el.classList.toggle('is-active');
      });
    });
  });
});
