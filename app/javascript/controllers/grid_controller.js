import { Controller } from "@hotwired/stimulus"
import { Grid, h } from "gridjs";


export default class extends Controller {
  connect() {

    const grid = new Grid({
      search: true,
      sort: true,
      pagination: true,
      // columns: ['Name', 'Marketplace', 'Entity'],
      columns: ['Name', 'Marketplace',
        {
          name: 'Entity',
          hidden: true
        }],
      fixedHeader: true,
      // width: '3000px',
      server: {
        url: '/api/accounts/',
        then: data => data.map(account => [account.name, account.marketplace_code, account.entity_id]),
      },
      pagination: {
        limit: 20
      },
      className: {
        tr: 'cursor-pointer' //add hover:pointer on the line
      }
    }).render(document.getElementById("wrapper"));

    // grid.on('cellClick', (...args) => console.log(args));
    // grid.on('cellClick', (...args) => location.assign('/account/' + args[3].cells[2].data));
    grid.on('rowClick', (...args) => location.assign('/account/' + args[1].cells[2].data));

  }
}
