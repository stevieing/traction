// app/javascript/sequencing-runs/components/Sample.vue

<template>
  <li draggable="true" @dragstart="drag" id="sample.name" class='sample'>
    {{ sample.name }}
  </li>
</template>

<script>
  export default {
    name: 'Sample',
    props: ['sample'],
    data () {
      return {
        msg: 'Sample'
      }
    },
    methods: {
      drag (event) {
        var sample = JSON.stringify(this.sample);
        event.dataTransfer.setData("sample", sample)
      }
    }
  }
</script>