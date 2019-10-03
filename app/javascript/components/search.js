class Search {
  constructor() {
    window.addEventListener('load', () => {
      const form = document.querySelector('#search');
      if (form) {
        this.cards = form.querySelector('.cards');
        // Initialize the errors
        const errors = form.querySelectorAll('.errors p');
        this.errors = [...errors].reduce((acc, err) => {
          const [prefix, name] = err.classList[0].split('--');
          acc[name] = err;
          return acc;
        }, {});
        form.addEventListener('ajax:success', this.onClick.bind(this));
      }
    });
  }
  async onClick(event) {
    const [data, status, xhr] = event.detail;
    this.resetError();
    if (data.length > 0) {
      data.forEach((res) => {
        const node = document.createElement('li');
        node.innerText = res.name;
        this.cards.appendChild(node);
      }, this);
    } else {
      this.errors['none'].classList.remove('transition', 'hidden');
    }
  }
  resetError() {
    Object.values(this.errors).forEach(e => e.classList.add('transition', 'hidden'));
  }
}
module.export = new Search();
