<template>
  <div class="">
    <h1>Welcome Nom du token</h1>

    <!-- TestButton & Testlines
    <h2>username : {{this.UserData.username}}</h2>
    <h2>email : {{this.UserData.email}}</h2>

    <button v-on:click="getUser(1)">Getuser</button>
    <button v-on:click="deleteUser(1)">Delete user</button>
    <button v-on:click="createUser('Logan','logan@email.fr')">Create Jean paul</button>
    <button v-on:click="updateUser(1,'Jean-Paul','jean@gmail.com')">updateUser user 1</button>
    -->

  </div>
</template>

<script>

import axios from 'axios'

export default {
  name: 'Home',

  created () {

  },

  data () {
    return {

    }
  },

  methods: {

  }
}

</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
