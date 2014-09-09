express = require 'express'
commonFindControllerConfigurator = require './modules/common/configurators/common.find.controller.configurator'
commonCreateControllerConfigurator = require './modules/common/configurators/common.create.controller.configurator'
commonReadControllerConfigurator = require './modules/common/configurators/common.read.controller.configurator'
commonUpdateControllerConfigurator = require './modules/common/configurators/common.update.controller.configurator'
commonDeleteControllerConfigurator = require './modules/common/configurators/common.delete.controller.configurator'

configureRoutes = (server) ->
	router = do express.Router

	configureCommonModuleRoutes = (endpoint, multibookerObject, multibookerPrimaryKey) ->
		router.route "/#{endpoint}"
			.get commonFindControllerConfigurator multibookerObject, multibookerPrimaryKey
			.post commonCreateControllerConfigurator multibookerObject, multibookerPrimaryKey
		router.route "/#{endpoint}/:id"
			.get commonReadControllerConfigurator multibookerObject, multibookerPrimaryKey
			.put commonUpdateControllerConfigurator multibookerObject, multibookerPrimaryKey
			.delete commonDeleteControllerConfigurator multibookerObject, multibookerPrimaryKey

	configureCommonModuleRoutes 'addresses', 'hall_addresses', 'addr_id'
	configureCommonModuleRoutes 'halls', 'hall', 'hall_id'
	configureCommonModuleRoutes 'orders', 'order', 'order_id'
	configureCommonModuleRoutes 'funds_groups', 'fund_group', 'fund_group_id'
	configureCommonModuleRoutes 'price_groups', 'price_group', 'price_group_id'
	configureCommonModuleRoutes 'age_categories', 'age_category', 'age_category_id'
	configureCommonModuleRoutes 'price_groups', 'price_group', 'price_group_id'
	configureCommonModuleRoutes 'place_colors' ,'action_scheme_place_color', 'color'
	configureCommonModuleRoutes 'ticket_pack_types', 'ticket_pack_type', 'ticket_pack_type'
	configureCommonModuleRoutes 'show_types', 'show_type', 'show_type_id'
	configureCommonModuleRoutes 'show_genres', 'show_genre', 'show_genre_id'
	configureCommonModuleRoutes 'agent_classes', 'agent_class', 'agent_class_id'
	configureCommonModuleRoutes 'payment_card_types', 'payment_card_type', 'payment_card_type_id'
	configureCommonModuleRoutes 'ticket_defect_types', 'ticket_defect_type', 'ticket_defect_type_id'
	configureCommonModuleRoutes 'shows', 'show', 'show_id'
	configureCommonModuleRoutes 'events', 'action', 'action_id'
	configureCommonModuleRoutes 'ticket_packs', 'ticket_pack', 'ticket_pack_id'
	configureCommonModuleRoutes 'ticket_pack_histories', 'ticket_pack_hist', 'ticket_pack_hist_id'
	configureCommonModuleRoutes 'hall_schemes', 'hall_scheme', 'hall_scheme_id'
	configureCommonModuleRoutes 'agents', 'agent', 'agent_id'
	configureCommonModuleRoutes 'organizers', 'organizer', 'organizer_id'
	configureCommonModuleRoutes 'ticket_suppliers', 'ticket_supplier', 'ticket_supplier_id'
	configureCommonModuleRoutes 'subscriptions', 'subscription', 'subscription_id'
	configureCommonModuleRoutes 'tickets', 'order_ticket', 'order_ticket_id'
	configureCommonModuleRoutes 'crm_users', 'crm_user', 'crm_user_id'
	configureCommonModuleRoutes 'users', 'user', 'user_id'
	configureCommonModuleRoutes 'roles', 'role', 'role_id'

	server.use '/api/v1', router

module.exports = configureRoutes