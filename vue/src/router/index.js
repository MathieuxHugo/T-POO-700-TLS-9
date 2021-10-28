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
    path: '/clock/:username',
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
  }
]

const router = new VueRouter({
  mode: 'history',
  routes
})
export default router
