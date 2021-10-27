<template>
  <div class="">
    <h2>User Vue Jean paul</h2>
    <h2>username : {{this.UserData.username}}</h2>
    <h2>email : {{this.UserData.email}} {{truc}}</h2>
    
  </div>
</template>

<script>

import axios from 'axios' ;

export default {
  name: 'User',

    created() {
        axios.get('http://localhost:4000/api/users/1', {
            responseType: "json",
        }).then(resp => {
            console.log(resp.data.data);
            this.UserData = resp.data.data;
        });
    },

    data () {
        return {
        UserData: [],
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
