<template>
  <div class="">
    <h2>{{this.time}}</h2>
    <button v-on:click="clock()">Clock {{this.ClockData.status ? 'End Shift' : 'Start Shift'}}</button>
  </div>
</template>

<script>

import axios from 'axios'
import moment from 'moment'

export default {
  name: 'ClockManager',

  created () {
    this.ClockData = {status: false, time: null}
    this.refresh()
  },

  data () {
    return {
      ClockData: []
    }
  },

  methods: {
    clock () {
      axios.post('http://localhost:4000/api/clocks/1', {
        clocks:
        {
          time: moment().format(),
          status: !this.ClockData.status
        }
      }).then(resp => {
        if (this.ClockData.status) {
          axios.post('http://localhost:4000/api/workingtimes/' + 1, {
            workingtimes:
            {
              start: this.ClockData.time,
              end: moment().format()
            }
          }).then(() => {
            console.log('Working time created.')
          })
        }
        this.ClockData = resp.data.data
        console.log('Clocked ', this.ClockData.status ? 'IN' : 'OUT')
      })
    },
    refresh () {
      axios.get('http://localhost:4000/api/clocks/1', {
        responseType: 'json'
      }).then(resp => {
        this.ClockData = resp.data.data.at((-1))
        console.log('Clock refreshed')
        this.time = moment().format('YYYY/MM/D[-]hh:mm:ss')
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
