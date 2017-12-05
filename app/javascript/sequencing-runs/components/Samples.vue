// app/javascript/sequencing-runs/components/Samples.vue

<template>
  <div id='samples' class="row">
    <ul class="list-group card" draggable="true" @dragover.prevent @drop="onDrop">
      <sample v-for="sample in samples" :sample="sample" :ref="sample.id" v-bind:key="sample.id"></sample>
    </ul>
  </div>
</template>

<script>

  import samples from '../../data/samples.json'
  import Sample from '../components/Sample'

  export default {
    name: 'Samples',
    data () {
      return {
        samples: samples,
        msg: 'Samples'
      }
    },
    methods: {
      onDrop (event) {
        event.preventDefault()
        var sample = JSON.parse(event.dataTransfer.getData("sample"))
        this.$refs[sample.id][0].show()
      }
    },
    components: {
      Sample
    }
  }
</script>