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
      axios.get('http://localhost:4000/api/workingtimes/' + userID + '?start=' + moment().subtract(1, 'month').format('YYYY-MM-D[T]hh:mm:ss') + '&end=' + moment().format('YYYY-MM-D[T]hh:mm:ss'), {
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
    // 'record' will be the row data from items
    // `index` will be the visible row number (available in the v-model 'shownItems')
  }
  }
}

</script>

<style>
  @import '../assets/styles/WorkingTimes.css';
</style>
