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
  }
]

const router = new VueRouter({
  mode: 'history',
  routes
})
export default router
