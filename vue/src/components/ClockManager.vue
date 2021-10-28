<template>
  <div class="InfoBox"> 
    <h1 class="Title">{{this.time}}</h1>
    <div class="TimeBox">
      <div class ="test">
        <h3>{{this.ClockData.status ? 'You started your shift at : ' : 'You finished your last shift at : '}}{{this.shiftTime}}</h3>
        <h3>You worked {{this.workDuration}} {{this.ClockData.status ? ' since the beginning of your shift' : ' in your last shift'}}.</h3>
      </div>
      <button class="ButtonBox" v-on:click="clock()">{{this.ClockData.status ? 'END SHIFT' : 'START SHIFT'}}</button>
    </div>
  </div>
</template>

<script>

import axios from 'axios'
import moment from 'moment'

export default {
  name: 'ClockManager',

  created () {
    this.ClockData = {status: false, time: null}
    this.interval=setInterval(this.refresh,1000)
    this.time=moment().format()
    this.shiftTime=null
    this.workDuration=null
  },
  beforeDestroy () {
       clearInterval(this.interval)
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
    getWorkDuration(t1,t2){
      let seconds=moment(t2).diff(moment(t1),'s')%60
      let minutes=moment(t2).diff(moment(t1),'m')%60
      let hours=moment(t2).diff(moment(t1),'h')
      return this.workDuration=hours+'h'+minutes+'m'+seconds+'s'
    },
    refresh () {
      axios.get('http://localhost:4000/api/clocks/1', {
        responseType: 'json'
      }).then(resp => {
        this.ClockData = resp.data.data.at((-1))
        this.shiftTime=moment(this.ClockData.time).format('hh:mm:ss[-]YYYY/MM/D')
        if(this.ClockData.status){ 
          this.workDuration=this.getWorkDuration(this.ClockData.time,moment())
        }
        else{
          let lastClock=resp.data.data.at(-2)
          this.workDuration=this.getWorkDuration(lastClock.time,this.ClockData.time)
        }
        this.time = moment().format('YYYY/MM/D[-]hh:mm:ss')
      })
    }
  }
}

</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  .InfoBox{
    margin-top: 5%;
    margin-left: 25%;
    margin-right: 25%;
    
    display:flex;
    align-items : center;
    justify-content: center;
    background : #48cae4;
    border-radius: 50px;
  }

  .Title {
    display:flex;
    align-items : center;
    justify-content: center;
    margin-top: 0px;
    margin-bottom: 0px;
    background : #35aac2;
    font-weight: bold;
  }
  .ButtonBox{
    width: 100%;
    height: 150px;
    border: solid 10px rgb(145, 28, 28);
    background-color: #154752;
    font-size: 50px;
  }
  .test {
    display: flex;
    align-items: center;
    flex-direction: column;
    background-color: #2998b1;
  }
</style>
