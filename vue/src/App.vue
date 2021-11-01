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
  font: normal normal 600 30px/40px "Dosis";
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  height: 100%
}

.btn-outline-primary {
  color: #13699F;
  border-color: #446188;
}
</style>
