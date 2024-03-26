class PostenLevering extends HTMLElement {
    set hass(hass) {
      if (!this.content) {
        const card = document.createElement('ha-card');
        const style = document.createElement('style');
        style.textContent = `   
          .posten-div {
            padding: 16px;
          }
          .posten-list {
            display: inline-block;
            width: calc(100% - 4.5rem + 6px); //18rem;
            padding: 0.75rem 0.75rem;
            padding-right: 3rem;
            background: no-repeat url("/local/posten-logo.png");
            background-size: 35px 35px;
            background-position-x: 96%;
            background-position-y: 0.75rem;
            border: 1px solid #e32d22;
            border-radius: 5px;
            border-left-width: 5px;
            font-size: 18px;
          }
          .posten-entry {
            list-style-type: none;
            margin-bottom: 5px;
            margin-top: 5px;
            display: flex;
          }
          .posten-text {
            width: 100px;
            display: inline-block;
          }
        `;
        card.appendChild(style);
        this.content = document.createElement('div');
        this.content.className = 'posten-div';
        card.appendChild(this.content);
        this.appendChild(card);
      }
  
      const entityId = this.config.entity;
      const state = hass.states[entityId];
      const dates = JSON.parse(state.state);
      
      let dateList = '<ul class="posten-list">';
      for (let date of dates) {
        const d = new Date(date);
        let weekday = d.toLocaleDateString('nb-NO', { weekday: 'long' });
        weekday = weekday.charAt(0).toUpperCase() + weekday.slice(1);
        dateList += `<li class="posten-entry"><small class="posten-text">${weekday}</small> <small>${d.toLocaleDateString('nb-NO')}</small></li>`;
      }
      dateList += '</ul>';
  
      this.content.innerHTML = dateList;
    }
  
    setConfig(config) {
      if (!config.entity) {
        throw new Error('You need to define an entity');
      }
      this.config = config;
    }
  
    getCardSize() {
      return 1;
    }
  }
  
  customElements.define('posten-levering', PostenLevering);