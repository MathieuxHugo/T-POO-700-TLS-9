<template>
  <div class="">
    <h2>Clock Vue</h2>
    <h2>startDateTime : {{this.ClockData.time}}</h2>
    <h2>ClockIn : {{this.ClockData.status}}</h2>
    <button v-on:click="refresh()">refresh</button>
    <button v-on:click="clock()">Clock {{this.ClockData.status?'OUT':'IN'}}</button>
  </div>
</template>

<script>

import axios from 'axios'
import moment from 'moment'

export default {
  name: 'ClockManager',

  created () {
    this.refresh()
  },

  data () {
    return {
      ClockData: []
    }
  },

  methods: {
    clock() {
        axios.post('http://localhost:4000/api/clocks/1', {
            clocks:
            {
                time: moment().format(),
                status: !this.ClockData.status
            }
        }).then(resp => {
            this.ClockData=resp.data.data
            console.log('Clocked ',this.ClockData.status?'IN':'OUT')
        })
    },
    refresh () {
      axios.get('http://localhost:4000/api/clocks/1', {
        responseType: 'json'
      }).then(resp => {
        this.ClockData=resp.data.data.last()
        console.log('Clock refreshed')
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
