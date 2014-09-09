(function() {
  var addressesModule, commonCreateController, commonDeleteController, commonFindController, commonReadController, commonUpdateController;

  commonFindController = require('./../common/controllers/common.find.controller');

  commonCreateController = require('./../common/controllers/common.create.controller');

  commonReadController = require('./../common/controllers/common.read.controller');

  commonUpdateController = require('./../common/controllers/common.update.controller');

  commonDeleteController = require('./../common/controllers/common.delete.controller');

  addressesModule = {
    find: commonFindController('hall_addresses', 'addr_id'),
    create: commonCreateController('hall_addresses', 'addr_id'),
    read: commonReadController('hall_addresses', 'addr_id'),
    update: commonUpdateController('hall_addresses', 'addr_id'),
    'delete': commonDeleteController('hall_addresses', 'addr_id')
  };

  module.exports = addressesModule;

}).call(this);
