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
  ga_service = null
  constructor: (GAService) ->
    ga_service = GAService
  get: () ->
    staff_id
  set: (value) ->
    staff_id = value
    ga_service.login( staff_id )

angular.module 'projectRobinApp'
  .service 'staffIdService', (GAService) ->
    new staffIdService(GAService)
  .controller 'StaffIdCtrl', ['staffIdService', 'GAService', (staffIdService, GAService) ->
    self = this
    self.logged_in_staff_id = staffIdService.get()
    self.current_id  = () ->
      staffIdService.get()
    self.set_id = () ->
      staffIdService.set(self.staff_id)
      self.logged_in_staff_id = staffIdService.get()
  ]
    # AngularJS will instantiate a singleton by calling "new" on this function

