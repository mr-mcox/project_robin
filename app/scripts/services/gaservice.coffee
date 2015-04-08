'use strict'

###*
 # @ngdoc service
 # @name projectRobinApp.GAService
 # @description
 # # GAService
 # Service in the projectRobinApp.
###

class GAService
    tracking_on = false
    send_pageview: (page) ->
        if tracking_on
            ga('set', 'page', page)
            ga('send', 'pageview')
        else
            console.log "Pageview would be called with " + page
    login: (id)->
        if tracking_on
            ga('set', '&uid', id)
            ga('send', 'event', 'Login Action', 'Logged In')
        else
            console.log "Login would be called with " + id
    set_tracking: (status) ->
        tracking_on = status
    get_tracking: () ->
        tracking_on

angular.module 'projectRobinApp'
  .service 'GAService', [GAService]
  .controller 'GATrackingCtrl', ['GAService', (GAService)->
    self = this
    self.tracking_status = () ->
        GAService.get_tracking()
    self.set_tracking = () ->
        GAService.set_tracking( self.new_tracking_status )
  ]
    # AngularJS will instantiate a singleton by calling "new" on this function
