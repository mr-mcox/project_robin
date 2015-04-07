'use strict'

###*
 # @ngdoc service
 # @name projectRobinApp.staffIdService
 # @description
 # # staffIdService
 # Service in the projectRobinApp.
###
class staffIdService
	staff_id = null
	constructor: () ->
		staff_id = null
	get: () ->
		staff_id
	set: (value) ->
		staff_id = value

angular.module 'projectRobinApp'
  .service 'staffIdService', [staffIdService]
  .controller 'StaffIdCtrl', ['staffIdService', (staffIdService) ->
  	self = this
  	self.current_id  = () ->
  		staffIdService.get()
  	self.set_id = () ->
  		staffIdService.set(self.staff_id)
  		alert "Staff ID is now " + staffIdService.get()
  ]
    # AngularJS will instantiate a singleton by calling "new" on this function

