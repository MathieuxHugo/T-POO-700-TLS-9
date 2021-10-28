import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  { path: '/', redirect: '/home' },

  {
    path: '/home',
    name: 'Home',
    component: () => import('../components/Home.vue')
  },
  {
    path: '/clock/:username',
    name: 'ClockManager',
    component: () => import('../components/ClockManager.vue')
  },
  {
    path: '/workingtime/:userid',
    name: 'workingTime',
    component: () => import('../components/WorkingTime.vue')
  },
  {
    path: '/workingtimes/:userid',
    name: 'workingTimes',
    component: () => import('../components/WorkingTimes.vue')
  },
  {
    path: '/user',
    name: 'User',
    component: () => import('../components/User.vue')
  }

]

const router = new VueRouter({
  mode: 'history',
  routes
})
export default router
