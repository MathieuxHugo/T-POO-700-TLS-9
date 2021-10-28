<template>
  <div class="">
    <h2>WorkingTime Vue</h2>
    <div v-if="this.$router.currentRoute.params.workingtimeid !== undefined" id ="inputContainer" class ="container">
      <div class= "workingContainer">
        <b-form-input id="workingStart" class="inputText" :value="this.workingStart"></b-form-input>
        <p class = "subText">Format : YYYY/MM/DD-hh-mm-ss</p>
      </div>
      <div class= "workingContainer">
        <b-form-input id="workingEnd" class="inputText" :value="this.workingEnd"></b-form-input>
        <p class = "subText">Format : YYYY/MM/DD-hh:mm:ss</p>
      </div>
    </div>
    <div v-if="this.$router.currentRoute.params.workingtimeid == undefined" id ="inputContainer" class ="container">
      <div class= "workingContainer">
        <b-form-input id="workingStartCreate" class="inputText" placeholder="Start Date"></b-form-input>
        <p class = "subText">Format : YYYY/MM/DD-hh:mm:ss</p>
      </div>
      <div class= "workingContainer">
        <b-form-input id="workingEndCreate" class="inputText" placeholder="End Date"></b-form-input>
        <p class = "subText">Format : YYYY/MM/DD-hh:mm:ss</p>
      </div>
    </div>
    <button v-if="this.$router.currentRoute.params.workingtimeid == undefined" v-on:click="createWorkingTime()">Add</button>
    <button v-if="this.$router.currentRoute.params.workingtimeid !== undefined" v-on:click="updateWorkingTime()">Modify</button>
    <button v-if="this.$router.currentRoute.params.workingtimeid !== undefined" v-on:click="deleteWorkingTime()">Delete</button>
    
  </div>
</template>

<script>

import axios from 'axios'
import moment from 'moment'

export default {
  name: 'WorkingTime',

  created () {
    console.log(this.$router.currentRoute.params.workingtimeid)
    if (this.$router.currentRoute.params.workingtimeid !== undefined)
    {
      this.getWorkingTimes(1)
    }
    else
    {
      console.log('No Working times parameter detected in URL')
    }
  },

  data () {
    return {
      resp: [],
      workingStart: '',
      workingEnd: '',
      workingStartInput: '',
      workingEndinput: '',
      workingStartCreate: '',
      workingEndCreate: ''
    }
  },

  methods: {

    getWorkingTimes (userID) {
      axios.get('http://localhost:4000/api/workingtimes/' + userID + '/' + this.$router.currentRoute.params.workingtimeid, {
        responseType: 'json'
      }).then(resp => {
        this.workingStart = moment(resp.data.data[0].start).format('YYYY/MM/DD[-]hh:mm:ss')
        this.workingEnd = moment(resp.data.data[0].end).format('YYYY/MM/DD[-]hh:mm:ss')
      })
    },
    createWorkingTime () {
      this.workingStartCreate = document.querySelector('input[id=workingStartCreate]').value
      this.workingEndCreate = document.querySelector('input[id=workingEndCreate]').value
      console.log(this.workingStartCreate)
      console.log(this.workingEndCreate)
      console.log(moment(this.workingStartCreate).format())
      console.log(moment(this.workingEndCreate).format())
      axios.post('http://localhost:4000/api/workingtimes/' + this.$router.currentRoute.params.userid, {
        workingtimes:
        {
          start: moment(this.workingStartCreate).format(),
          end: moment(this.workingEndCreate).format()
        }
      }).then(resp => {
        console.log(resp.data.data)
        this.resp = resp.data.data
      })
    },
      
    updateWorkingTime () {
      // Hard code workingtimes parameter
      this.workingStartInput = document.querySelector('input[id=workingStart]').value
      this.workingEndInput = document.querySelector('input[id=workingEnd]').value
      axios.put('http://localhost:4000/api/workingtimes/' + this.$router.currentRoute.params.workingtimeid, {
        workingtimes:
          {
              start: moment(this.workingStartInput).format(),
              end: moment(this.workingEndInput).format()
          }
      }).then(resp => {
          console.log(resp.data.data)
          this.resp = resp.data.data
      })
    },

    deleteWorkingTime () {
      axios.delete('http://localhost:4000/api/workingtimes/' + this.$router.currentRoute.params.workingtimeid, {
        responseType: 'json'
      }).then(resp => {
        console.log('Delete Done')
        window.location.href = 'http://localhost:8080/workingtimes/' + this.$router.currentRoute.params.userid
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

.workingContainer {
  width: 40%;
}

#inputContainer {
  width: 500px;
  display: flex;
  justify-content: space-between;
  margin-bottom: 30px;
  margin-top: 30px;
}

#workingStart {
  text-align: center;
}

#workingEnd {
  text-align: center;
}

.subText {
  margin-top: 5px;
  font-size: 12px;
  color: gray;
}
</style>
