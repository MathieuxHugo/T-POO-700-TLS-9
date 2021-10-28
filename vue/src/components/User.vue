<template>
  <div class="row">
    <div class="col-12 Title">
      <h1>Welcome {{this.UserData.username}}</h1>
    </div>
    
    <div class="col-11 InfoBox">
      <div class="col-5 InputBox">
        <div>Username :</div>
        <b-input-group>
          <b-form-input :state="usernameState" syze="lg" type="text" v-model="NewUserName" :placeholder ="this.UserData.username"></b-form-input>
        </b-input-group>
        <br/>
        <div>Email :</div>
        <b-input-group>
           <b-form-input :state="emailState" syze="lg" type="text" v-model="NewEmail" :placeholder ="this.UserData.email"></b-form-input>
        </b-input-group>
      </div>
      <div class="col-5 ButtonBox">
        <b-button size="lg" variant="outline-primary" v-on:click="updateUser(1,NewUserName,NewEmail)">update</b-button>
        <b-button size="lg" variant="outline-primary" v-on:click="getUser(1)">Refresh</b-button>
      </div>
    </div>

    <div class ="col-xs DeleteBox">
      <b-button size="lg" variant="outline-danger" v-on:click="deleteUser(1)">Delete user</b-button>
    </div>
    <!-- TestButton & Testlines
    <h2>username : {{this.UserData.username}}</h2>
    <h2>email : {{this.UserData.email}}</h2>
    <button v-on:click="createUser('Logan','logan@email.fr')">Create Jean paul</button>
    -->

  </div>
</template>

<script>

import axios from 'axios'

export default {
  name: 'User',

  computed: {
    usernameState(){
      return this.NewUserName.length > 0 ? true : null
    },
    emailState(){
      if (this.NewEmail.includes("@") && this.NewEmail.includes(".")) {
        return true;
      }
      else {
        return null;
      }
    }
  },

  data () {
    return {
      UserData: [],
      NewUserName: "" ,
      NewEmail: "" 
    }
  },



  created () {
    this.getUser(1)
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
body {
  background : #F4998D;
}

.row {
  min-height : 100px ;
}

.Title {
  display:flex;
  align-items : center;
  justify-content: center;
  margin-top: 50px;
  margin-bottom: 50px;
}

.InfoBox{
  display:flex;
  align-items : center;
  justify-content: center;
  background : #48cae4;
  border-radius: 50px;
  margin:4%;
}

.InputBox{
  padding: 50px;
  font-size : 20px;
  text-align : left ;
}

.ButtonBox{
  padding: 50px;
  font-size : 20px;
}

.DeleteBox{
  padding: 50px;
}

.input-group{
  max-width : 50%;
}

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
