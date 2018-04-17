const routes = require('next-routes')();

routes
  .add('/campaigns/new', '/campaigns/new') // new campaign
  .add('/campaigns/:address', '/campaigns/show') // show all campaigns
  .add('/campaigns/:address/requests', '/campaigns/requests/index') // show all requests
  .add('/campaigns/:address/requests/new', '/campaigns/requests/new'); // for creating new request

module.exports = routes;
