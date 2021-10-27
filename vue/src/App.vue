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
  color: #2c3e50;
  margin-top: 60px;
}
</style>
