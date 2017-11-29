// app/javascript/sequencing-runs/components/Samples.vue

<template>
  <div id='samples' class="col-xs-3">
    <div>{{ msg }}</div>
    <ul class="list-unstyled" >
      <sample v-for="sample in samples" :sample="sample" :ref="sample.name" v-bind:key="sample.id"></sample>
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
    components: {
      Sample
    }
    ,
    mounted () {
      console.log(this.$refs.Sample1)
    }
  }
</script>