<template>
  <div class="">
    <h2>WorkingTime Vue</h2>
    <button v-on:click="createWorkingTime">Create</button>

  </div>
</template>

<script>

import axios from 'axios'

export default {
  name: 'WorkingTime',

  data () {
    return {
        resp: []
    }
  },

  methods: {
    createWorkingTime () {
        axios.post('http://localhost:4000/api/workingtimes/' + this.$router.currentRoute.params.userid, {
            workingtimes:
            {
                start: "2018-03-29T13:34:00.000",
                end: "2018-04-29T13:34:00.000"
            }
        }).then(resp => {
            console.log(resp.data.data)
            this.resp = resp.data.data
        })
    },
    
    updateWorkingTime () {
      //Hard code workingtimes parameter
      axios.put('http://localhost:4000/api/workingtimes/1', {
          workingtimes:
          {
              start: "2018-03-29T13:34:00.000",
              end: "2018-04-29T13:35:00.000"
          }
      }).then(resp => {
          console.log(resp.data.data)
          this.resp = resp.data.data
      })
    },

    deleteWorkingTime () {
      //Hard code workingtimes parameter
      axios.put('http://localhost:4000/api/workingtimes/1')
      .then(resp => {
          console.log(resp.data.data)
          this.resp = resp.data.data
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
button {
    width: 100px;
    height: 30px;
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
