<template>
  <div class="container">
    <h3 class="p-3 text-center">My Working Time Tracker</h3>
    <div>
      <p class="mt-3">Current Page: {{ currentPage }}</p>
      <b-table
        id="WorkingTable"
        :items="myProvider()"
        :current-page="currentPage"
        :per-page="perPage"
        :fields="['start', 'end', 'id']"
        @row-clicked="myRowClickHandler"
      ></b-table>
      <b-pagination
        v-model="currentPage"
        :total-rows="rows"
        :per-page="perPage"
        aria-controls="WorkingTable"
      ></b-pagination>
  </div>
  <b-button size="lg" variant="outline-primary" id="addWorkingTime" v-on:click="navigateToWorkingTime()">Add a working Time !</b-button>
  </div>
</template>

<script>

import axios from 'axios'

export default {
  name: 'WorkingTime',
  created () {
    this.getWorkingTimes(1)
  },
  data () {
    return {
      workingData: [],
      perPage: 10,
      currentPage: 1
    }
  },
  computed: {
    rows () {
      return this.workingData.length
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
      this.$router.push('/workingtime/1/' + record.id)
    },
    navigateToWorkingTime ()
    {
      this.$router.push('/workingtime/1')
    }
  }
}

</script>

<style>
  @import '../assets/styles/WorkingTimes.css';
</style>
