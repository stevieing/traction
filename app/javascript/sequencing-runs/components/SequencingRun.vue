// app/javascript/sequencing-runs/components/SequencingRun.vue

<template>
  <div id='sequencing-run' class="container-fluid">
    <div class="row">
      <div class="col-9">
        <div>
          <button class="btn btn-primary" v-on:click="save" type="submit">Save</button>
        </div>
        <table class="table table-curved">
          <thead>
            <th >&nbsp;</th>
            <th  v-for="column in columns">{{ column }}</th>
          </thead>
          <tbody>
            <tr v-for="row in rows">
              <td >{{ row }}</td>
              <well  v-for="column in columns" :row="row" :column="column" v-bind:key="row.concat(column)" v-on:add="addMetadata" >
              </well>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="col-3">
        <div class="row">
          <sequencing-run-metadata :sequencingRun="this.sequencingRun"></sequencing-run-metadata>
        </div>
        <samples></samples>
      </div>
    </div>
  </div>
</template>

<script>

  import Well from '../components/Well'
  import Samples from '../components/Samples'
  import SequencingRunMetadata from '../components/SequencingRunMetadata'
  import sequencing_run from '../../data/sequencing_run.json'

  export default {
    name: 'SequencingRun',
    data () {
      return {
        msg: 'Sequencing Run',
        columns: ['1','2','3','4','5','6','7','8','9','10','11','12'],
        rows: ['A','B','C','D','E','F','G','H'],
        sequencingRun: sequencing_run
      }
    },
    components: {
      Well,
      Samples,
      SequencingRunMetadata
    },
    methods: {
      save (event) {
        alert("saved!")
        for (var index in this.$children) {
          if (Object.keys(this.$children[index].sample).length > 0) {
            console.log(this.$children[index].sample)
          }
        }
      },
      addMetadata (sample) {
        for (var index in this.$children) {
          var child = this.$children[index]
          if (child.$options.name === "Well" ) {
            if (child.selected && Object.keys(child.sample).length > 0)  {
              child.addMetadata(sample)
            }
          }
        }
      }
    }
  }
</script>