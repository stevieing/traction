// app/javascript/sequencing-runs/components/SequencingRuns.vue

<template>
  <div id='sequencing-runs' class="container-fluid">
    <div class="row">
      <div class="col-lg-9">
        <div>{{ msg }}</div>
        <div>
          <form class="sequencing-run" @submit.prevent="onSubmit">
            <fieldset>
                <div class="form-group row">
                  <label class="col-3 col-form-label" for="run-name">Name: </label>
                  <div class="col-6">
                    <input class="form-control" type="text" id="run-name" v-model="sequencingRun.runName">
                  </div>
                </div>
                <div class="form-group row">
                  <label class="col-3 col-form-label" for="run-description">Description: </label>
                  <div class="col-6">
                    <input class="form-control" type="text" id="run-description" v-model="sequencingRun.runDescription">
                  </div>
                </div>
                <div class="form-group row">
                  <label class="col-3 col-form-label" for="dna-control-complex-box-barcode">DNA Control Complex: </label>
                  <div class="col-6">
                    <input class="form-control" type="text" id="dna-control-complex-box-barcode" v-model="sequencingRun.dnaControlComplexBoxBarcode">
                  </div>
                </div>
                <div class="form-group row">
                  <label class="col-3 col-form-label" for="binding-kit-box-barcode">Binding Kit: </label>
                  <div class="col-6">
                    <input class="form-control" type="text" id="binding-kit-box-barcode" v-model="sequencingRun.bindingKitBoxBarcode">
                  </div>
                </div>
                <div class="form-group row">
                  <label class="col-3 col-form-label" for="sequencing-kit-box-barcode">Sequencing Kit: </label>
                  <div class="col-6">
                    <input class="form-control" type="text" id="sequencing-kit-box-barcode" v-model="sequencingRun.sequencingKitBoxBarcode">
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-9">
                    <button class="btn btn-primary pull-right" type="submit">Submit</button>
                  </div>
                </div>
            </fieldset>
          </form>
        </div>
        <table class="table table-bordered">
          <thead>
            <th class="success">&nbsp;</th>
            <th class="success" v-for="column in columns">{{ column }}</th>
          </thead>
          <tbody>
            <tr v-for="row in rows">
              <td class="success">{{ row }}</td>
              <well  v-for="column in columns" :row="row" :column="column" v-bind:key="row.concat(column)" v-on:add="addMetadata" >
              </well>
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
        rows: ['A','B','C','D','E','F','G','H'],
        sequencingRun: {}
      }
    },
    components: {
      Well,
      Samples
    },
    methods: {
      onSubmit (event) {

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