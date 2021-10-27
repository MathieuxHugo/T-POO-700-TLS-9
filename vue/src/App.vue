<template>
  <div id="app">
    <NavBar/>
    <router-view/>
  </div>
</template>

<script>
export default {
  name: 'App',
  components: {
    NavBar: () => import('./components/NavBar')
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  height: 100%
}
</style>
