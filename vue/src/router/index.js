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
    path: '/helloworld',
    name: 'HelloWorld',
    component: () => import('../components/HelloWorld.vue')
  },
  {
    path: '/workingtime/:userid',
    name: 'workingTime',
    component: () => import('../components/WorkingTime.vue')
  }
]

const router = new VueRouter({
  mode: 'history',
  routes
})
export default router
