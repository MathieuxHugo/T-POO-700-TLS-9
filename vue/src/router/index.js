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
<<<<<<< HEAD
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
=======
>>>>>>> 0cddfa181bc052fd245cba40416c4ba9f43026b5
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
