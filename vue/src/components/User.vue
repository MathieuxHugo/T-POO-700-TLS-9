<template>
  <div class="">
    <h2>User Vue</h2>
    <h2>username : {{this.UserData.username}}</h2>
    <h2>email : {{this.UserData.email}}</h2>
    <button v-on:click="deleteUser()">Delete user 2</button>

  </div>
</template>

<script>

import axios from 'axios'

export default {
  name: 'User',

  created () {
    this.getUser()
  },

  data () {
    return {
      UserData: []
    }
  },

  methods: {
    getUser () {
      axios.get('http://localhost:4000/api/users/1', {
        responseType: 'json'
      }).then(resp => {
        console.log(resp.data.data)
        this.UserData = resp.data.data
      })
    },
    updateUser () {
      axios.get('http://localhost:4000/api/users/1', {
        responseType: 'json'
      }).then(resp => {
        console.log(resp.data.data)
        this.UserData = resp.data.data
      })
    },
    deleteUser () {
      axios.delete('http://localhost:4000/api/users/2', {
        responseType: 'json'
      }).then(resp => {
        console.log('Succesfully deleted')
      })
    },
    createUser () {
      axios.get('http://localhost:4000/api/users/1', {
        responseType: 'json'
      }).then(resp => {
        console.log(resp.data.data)
        this.UserData = resp.data.data
      })
    }
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
