// app/javascript/sequencing-runs/components/SequencingRunMetadata.vue

<template>
  <form class="sequencing-run-metadata rounded" >
    <fieldset>
      <div class="form-group">
        <label class="" for="run-name">Name: </label>
        <div class="">
          <input class="form-control" type="text" id="run-name" v-model="sequencingRun.runName">
          </div>
      </div>
      <div class="form-group">
        <label class="" for="run-description">Description: </label>
        <div class="">
          <input class="form-control" type="text" id="run-description" v-model="sequencingRun.runDescription">
        </div>
      </div>
      <div class="form-group">
        <label class="" for="dna-control-complex-box-barcode">DNA Control Complex: </label>
        <div class="">
          <input class="form-control" type="text" id="dna-control-complex-box-barcode" v-model="sequencingRun.dnaControlComplexBoxBarcode">
        </div>
      </div>
      <div class="form-group">
        <label class="" for="binding-kit-box-barcode">Binding Kit: </label>
        <div class="">
          <input class="form-control" type="text" id="binding-kit-box-barcode" v-model="sequencingRun.bindingKitBoxBarcode">
        </div>
      </div>
      <div class="form-group">
        <label class="" for="sequencing-kit-box-barcode">Sequencing Kit: </label>
        <div class="">
          <input class="form-control" type="text" id="sequencing-kit-box-barcode" v-model="sequencingRun.sequencingKitBoxBarcode">
        </div>
      </div>
    </fieldset>
  </form>
</template>

<script>
  export default {
    name: 'SequencingRunMetadata',
    props: ['sequencingRun'],
    data () {
      return {
        msg: 'SequencingRunMetadata'
      }
    }
  }
</script>
