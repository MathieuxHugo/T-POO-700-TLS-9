import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  { path: '/', redirect: '/home' },

  {
    path: '/home',
    name: 'Home',
    component: () => import('../components/User.vue')
  },
  {
    path: '/clock',
    name: 'ClockManager',
    component: () => import('../components/ClockManager.vue')
  },
  {
    path: '/helloworld',
    name: 'HelloWorld',
    component: () => import('../components/HelloWorld.vue')
  },
  {
<<<<<<< HEAD
    path: '/workingtimes',
    name: 'WorkingTimes',
    component: () => import('../components/WorkingTimes.vue')
=======
    path: '/workingtime/:userid',
    name: 'workingTime',
    component: () => import('../components/WorkingTime.vue')
>>>>>>> d6cd3ab73da84eb7afa644a2f628269aa0063511
  }
]

const router = new VueRouter({
  mode: 'history',
  routes
})
export default router
