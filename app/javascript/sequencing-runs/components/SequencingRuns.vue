// app/javascript/sequencing-runs/components/SequencingRuns.vue

<template>
  <div id='sequencing-runs' class="container-fluid">
    <div class="row">
      <div class="col-lg-9">
        <div>{{ msg }}</div>
        <table class="table table-bordered">
          <thead>
            <th class="success">&nbsp;</th>
            <th class="success" v-for="column in columns">{{ column }}</th>
          </thead>
          <tbody>
            <tr v-for="row in rows">
              <td class="success">{{ row }}</td>
              <well  v-for="column in columns" :row="row" :column="column"></well>
            </tr>
          </tbody>
        </table>
      </div>
      <samples></samples>
    </div>
  </div>
</template>

<script>

  import Well from '../components/Well'
  import Samples from '../components/Samples'

  export default {
    name: 'SequencingRuns',
    data () {
      return {
        msg: 'Sequencing Runs',
        columns: ['1','2','3','4','5','6','7','8','9','10','11','12'],
        rows: ['A','B','C','D','E','F','G','H']
      }
    },
    components: {
      Well,
      Samples
    }
  }
</script>