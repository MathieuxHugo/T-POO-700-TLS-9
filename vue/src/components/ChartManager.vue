<template>
    <div>
        <h2>ChartManager Vue</h2>
        <div class= "endPeriodContainer">
          <label for="startPeriod">Start Period</label>
          <input type="datetime-local" name="startPeriod" v-model="startPeriod"/>
        </div>
        <div class= "startPeriodContainer">
          <label for="endPeriod">End Period</label>
          <input type="datetime-local" name="endPeriod" v-model="endPeriod"/>
        </div>
        <line-chart :data="lineChartData"></line-chart>
        <column-chart :data="barChartData"></column-chart>
        <button v-on:click="getWorkTimePeriod"></button>
    </div>
</template>

<script>

import axios from 'axios'
import moment, { months } from 'moment'

export default {
  name: 'ChartManager',

  data () {
    return {
      resp: [],
      startPeriod: moment().subtract(1,"months").format('YYYY-MM-DDThh:mm:ss'),
      endPeriod: moment().format('YYYY-MM-DDThh:mm:ss'),
      workingData: [],
      barChartData: {},
      lineChartData: {},
      pieChartData: {}
    }
  },

  created() {
    this.getWorkTimePeriod()
  },

  methods: {
    getWorkTimePeriod(){
      // let startPeriod = "2019-12-31T23:59:59"
      // let endPeriod = "2020-12-31T23:59:59"
      axios.get('http://localhost:4000/api/workingtimes/8?start='+ this.startPeriod +'&'+'end='+ this.endPeriod , {
        responseType: 'json'
      }).then(resp => {
        this.workingData = resp.data.data
        this.hoursByMonth()
        this.hoursByDay()
      });
        
    },

    hoursByMonth(){
      let workingDurations = {}
      moment.months().forEach(elem => {
          workingDurations[elem] = 0
        });

        this.workingData.forEach(elem => {
          workingDurations[moment(elem.start).format('MMMM').toString()] = this.getWorkDuration(elem.start, elem.end)+workingDurations[moment(elem.start).format('MMMM').toString()]
        });
        this.barChartData = workingDurations
    },

    hoursByDay(){
      let workingDurations = {}
      moment.weekdays().forEach(elem => {
          workingDurations[elem] = 0
        });
        this.workingData.forEach(elem => {
          workingDurations[moment(elem.start).format('dddd').toString()] = this.getWorkDuration(elem.start, elem.end)+workingDurations[moment(elem.start).format('dddd').toString()]
        });
        this.lineChartData = workingDurations
    },

    

    getWorkDuration(t1,t2){
      let seconds=moment(t2).diff(moment(t1),'s')%60
      let minutes=moment(t2).diff(moment(t1),'m')%60
      let hours=moment(t2).diff(moment(t1),'h')
      return this.workDuration=hours//+'h'+minutes+'m'+seconds+'s'
    },

    test(){
      console.log(moment().format('YYYY-MM-DDThh:mm:ss'))
      console.log(moment().subtract(1,"months").format('YYYY-MM-DDThh:mm:ss'))
      console.log(this.startPeriod)
      console.log(this.endPeriod)

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