class Notice {
  constructor() {
    window.addEventListener('load', () => {
      const el = document.querySelector('#notice.message .close');
      if (el) {
        el.addEventListener('click', (el) => {
          el.target.parentElement.classList.add('hidden');
        });
      }
    });
  }
}
module.exports = new Notice();
