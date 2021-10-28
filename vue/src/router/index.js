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
    name: 'ClockManager',
    path: '/clock/:userid',
    component: () => import('../components/ClockManager.vue')
  },
  {
    path: '/workingtime/:userid',
    name: 'workingTime1',
    component: () => import('../components/WorkingTime.vue')
  },
  {
    path: '/workingtime/:userid/:workingtimeid',
    name: 'workingTime2',
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
  },
  {
    path: '/chartmanager',
    name: 'ChartManager',
    component: () => import('../components/ChartManager.vue')
  }
]

const router = new VueRouter({
  mode: 'history',
  routes
})
export default router
