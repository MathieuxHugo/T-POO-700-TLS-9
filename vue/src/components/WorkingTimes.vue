<template>
  <div class="container">
    <h3 class="p-3 text-center">My Working Time Tracker</h3>
    <div>
      <b-table
        id="my-table"
        :items="myProvider()"
        :fields="['start', 'end', 'id']"
        @row-clicked="myRowClickHandler"
      ></b-table>
  </div>
  <p v-on:click="navigateToWorkingTime()"> Add an other Working Time here ! </p>
  </div>
</template>

<script>

import axios from 'axios'
import moment from 'moment'

export default {
  name: 'WorkingTime',
  created () {
    this.getWorkingTimes(1)
  },

  data () {
    return {
      workingData: []
    }
  },

  methods: {
    getWorkingTimes (userID) {
      axios.get('http://localhost:4000/api/workingtimes/' + userID + '?start=2021-10-01T01:00:00&end=2021-10-31T01:00:00', {
        responseType: 'json'
      }).then(resp => {
        this.workingData = resp.data.data
        console.log(this.workingData)
        return this.workingData
      })
    },
    sortTable (col) {
      this.rows.sort(function (a, b) {
        if (a[col] > b[col]) {
          return 1
        } else if (a[col] < b[col]) {
          return -1
        }
        return 0
      })
    },
    myProvider () {
      let items = this.workingData
      return items
    },
    myRowClickHandler (record, index) {
    /// Change to real user ID
      window.location.href = 'http://localhost:8080/workingtime/1/' + record.id
    },
    navigateToWorkingTime ()
    {
      window.location.href = 'http://localhost:8080/workingtime/1'
    }
  }
}

</script>

<style>
  @import '../assets/styles/WorkingTimes.css';
</style>
