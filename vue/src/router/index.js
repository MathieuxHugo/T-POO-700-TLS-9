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
    path: '/workingtime/:userid',
    name: 'workingTime',
    component: () => import('../components/WorkingTime.vue')
<<<<<<< HEAD
  },
  {
    path: '/workingtimes/:userid',
    name: 'workingTimes',
    component: () => import('../components/WorkingTimes.vue')
=======
>>>>>>> 610a2b8c8bda53c85a922fa5e5e954d424d12918
  }
]

const router = new VueRouter({
  mode: 'history',
  routes
})
export default router
