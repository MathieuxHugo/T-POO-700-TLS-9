<template>
    <div>
        <h2>ChartManager Vue</h2>
        <pie-chart :data="[['Blueberry', 44], ['Strawberry', 23]]"></pie-chart>
    </div>
</template>

<script>

import axios from 'axios'

export default {
  name: 'ChartManager',

  data () {
    return {
      resp: []
    }
  },

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