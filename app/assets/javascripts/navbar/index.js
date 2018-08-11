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
