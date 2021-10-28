<template>
  <div class="">
    <h2>User Vue</h2>
    <h2>username : {{this.UserData.username}}</h2>
    <h2>email : {{this.UserData.email}}</h2>
    <!-- Testing routes for USER entity
    <button v-on:click="getUser(1)">Getuser</button>
    <button v-on:click="deleteUser(1)">Delete user</button>
    <button v-on:click="createUser('Logan','logan@email.fr')">Create Jean paul</button>
    <button v-on:click="updateUser(1,'Jean-Paul','jean@gmail.com')">updateUser user 1</button> -->

  </div>
</template>

<script>

import axios from 'axios'

export default {
  name: 'User',

  created () {
    this.getUser(1)
  },

  data () {
    return {
      UserData: []
    }
  },

  methods: {
    getUser (userID) {
      axios.get('http://localhost:4000/api/users/'+userID, {
        responseType: 'json'
      }).then(resp => {
        this.UserData = resp.data.data
        console.log(this.UserData)
      })
    },

    updateUser (userID, username, email) {
      axios.put('http://localhost:4000/api/users/' + userID, {
        users:
        {
          username: username,
          email: email
        }
      }).then(() => {
        console.log('Update Done')
      })
    },

    deleteUser (userID) {
      axios.delete('http://localhost:4000/api/users/' + userID, {
        responseType: 'json'
      }).then(resp => {
        console.log('Delete Done')
      })
    },

    createUser (username, email) {
      axios.post('http://localhost:4000/api/users', {
        users:
        {
          username: username,
          email: email
        }
      }).then(resp => {
        console.log('Create Done')
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
